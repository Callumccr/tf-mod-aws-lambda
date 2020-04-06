module "label" {
  source             = "git::https://github.com/Callumccr/tf-mod-label.git?ref=master"
  namespace          = var.namespace
  environment        = var.environment
  name               = var.name
  attributes         = concat(var.attributes, [var.function_name], ["lambda"])
  delimiter          = "-"
  additional_tag_map = {} /* Additional attributes (e.g. 1) */
  label_order        = ["environment", "namespace", "name", "attributes"]
}

module "sg_label" {
  source             = "git::https://github.com/Callumccr/tf-mod-label.git?ref=master"
  namespace          = var.namespace
  environment        = var.environment
  name               = var.name
  delimiter          = "-"
  attributes         = concat(module.label.attributes, ["sg"])
  additional_tag_map = {} /* Additional attributes (e.g. 1) */
  label_order        = ["environment", "namespace", "name", "attributes"]
}

module "role_label" {
  source             = "git::https://github.com/Callumccr/tf-mod-label.git?ref=master"
  namespace          = var.namespace
  environment        = var.environment
  name               = var.name
  delimiter          = "-"
  attributes         = concat(module.label.attributes, ["role"])
  additional_tag_map = {} /* Additional attributes (e.g. 1) */
  label_order        = ["environment", "namespace", "name", "attributes"]
}

module "log_label" {
  source             = "git::https://github.com/Callumccr/tf-mod-label.git?ref=master"
  namespace          = var.namespace
  environment        = var.environment
  name               = var.name
  delimiter          = "-"
  attributes         = concat(module.label.attributes, ["log-group"])
  additional_tag_map = {} /* Additional attributes (e.g. 1) */
  label_order        = ["environment", "namespace", "name", "attributes"]
}


module "alarm_label" {
  source             = "git::https://github.com/Callumccr/tf-mod-label.git?ref=master"
  namespace          = var.namespace
  environment        = var.environment
  name               = var.name
  delimiter          = "-"
  attributes         = concat(module.label.attributes, ["alarm"])
  additional_tag_map = {} /* Additional attributes (e.g. 1) */
  label_order        = ["environment", "namespace", "name", "attributes"]
}

