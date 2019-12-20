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
    url     = "https://github.com/wk-j/terraform-heroku-container.git"
    version = "0.1.0"
  }
}

resource "heroku_formation" "example" {
  app        = "${heroku_app.example.name}"
  type       = "web"
  quantity   = 1
  size       = "free"
  depends_on = ["heroku_build.example"]
}

output "example_app_url" {
  value = "https://${heroku_app.example.name}.herokuapp.com"
}
