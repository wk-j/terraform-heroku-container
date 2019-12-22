provider "heroku" {
  version = "~> 2.0"
}

variable "app_name" {
  default = "myweb-101"
}

resource "heroku_app" "myweb" {
  name   = "${var.app_name}"
  region = "us"
  stack  = "container"
}

resource "heroku_build" "myweb" {
  app = "${heroku_app.myweb.name}"
  source = {
    path = "./"
  }
}

output "app_url" {
  value = "https://${heroku_app.myweb.name}.herokuapp.com"
}
