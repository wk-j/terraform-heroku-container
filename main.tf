provider "heroku" {
  version = "~> 2.0"
}

variable "example_app_name" {
  description = "App name"
}

resource "heroku_app" "example" {
  name   = "${var.example_app_name}"
  region = "us"
  stack  = "container"
}

resource "heroku_build" "example" {
  app = "${heroku_app.example.name}"
  source = {
    path = "./"
  }
}

output "example_app_url" {
  value = "https://${heroku_app.example.name}.herokuapp.com"
}
