resource "aws_lambda_function" "default" {
  count                          = var.enabled ? 1 : 0
  function_name                  = var.function_name
  filename                       = var.filename
  source_code_hash               = filebase64sha256(var.filename)
  description                    = var.description
  layers                         = var.layers
  memory_size                    = var.memory_size
  runtime                        = var.runtime
  timeout                        = local.timeout
  reserved_concurrent_executions = var.reserved_concurrent_executions
  publish                        = local.publish
  role                           = var.role != "" ? var.role : aws_iam_role.default.0.arn
  handler                        = var.handler
  tags                           = module.label.tags
  depends_on                     = ["aws_iam_role.default"]

  dynamic "dead_letter_config" {
    for_each = var.target_arn == [] ? [] : var.target_arn
    iterator = target_arn
    content {
      target_arn = target_arn.value
    }
  }

  dynamic "tracing_config" {
    for_each = var.mode == [] ? [] : var.mode
    iterator = mode
    content {
      mode = mode.value
    }
  }

  environment {
    variables = var.environment_variables
  }

  dynamic "vpc_config" {
    for_each = var.subnet_ids == [] ? [] : 1
    iterator = subnets
    content {
      security_group_ids = var.use_existing_security_groups == false ? aws_security_group.default.*.id : var.existing_security_groups
      subnet_ids         = var.subnet_ids
    }
  }

  # vpc_config {
  #   security_group_ids = var.use_existing_security_groups == false ? aws_security_group.default.*.id : var.existing_security_groups
  #   subnet_ids         = legnth(var.subnet_ids) > 0 ? [] : var.subnet_ids
  # }
}


// Lambda Security Group
resource "aws_security_group" "default" {
  count  = var.enabled && var.use_existing_security_groups == false ? 1 : 0
  vpc_id = var.vpc_id
  name   = module.sg_label.id
  tags   = module.sg_label.tags

  dynamic "ingress" {
    for_each = length(var.allowed_security_groups) > 0 ? var.port : []
    iterator = ingress
    content {
      description     = "Allow inbound traffic from existing Security Groups"
      from_port       = ingress.value
      to_port         = ingress.value
      protocol        = "tcp"
      security_groups = var.allowed_security_groups
    }
  }

  dynamic "ingress" {
    for_each = length(var.allowed_cidr_blocks) > 0 ? var.port : []
    iterator = ingress
    content {
      description = "Allow inbound traffic to internal CIDR ranges"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = var.allowed_cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.allow_all_egress == true ? ["0.0.0.0/0"] : []
    iterator = ingress
    content {
      description = "Allow inbound traffic to internal CIDR ranges"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = [ingress.value]
    }
  }
}


// Lambda Role
resource "aws_iam_role" "default" {
  count              = var.enabled ? 1 : 0
  name               = module.role_label.id
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  tags               = module.role_label.tags
}

resource "aws_iam_role_policy_attachment" "default" {
  count      = var.enabled ? length(var.policy_arn) : 0
  role       = aws_iam_role.default.0.name
  policy_arn = element(var.policy_arn, count.index)
}
