## Container

```bash
terraform init
terraform apply -var example_app_name=wk-container
terraform show

terraform output example_app_url
terraform destroy -var example_app_name=wk-container

heroku logs --tail --app wk-container
```

## Check

- http://localhost/WeatherForecast