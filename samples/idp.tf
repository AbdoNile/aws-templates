variable "pool-name" {
  type = "string"
}

variable "callback-urls" {
  type = "list"
}

variable "google-client-id" {}
variable "google-client-secret" {}
variable "login-custom-domain" {}

variable "hosted-zone" {}

module "idp" {
  source               = "../modules/cognito-google-pool"
  google-client-secret = "${var.google-client-secret}"
  google-client-id     = "${var.google-client-id}"
  pool-name            = "${var.pool-name}"
  callback-urls        = "${var.callback-urls}"
  login-custom-domain  = "${var.login-custom-domain}"
  ssl-certificate-arn  = "${module.certificate.arn}"
  hosted-zone          = "${var.hosted-zone}"
}
