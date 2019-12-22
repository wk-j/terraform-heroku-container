## Container

```bash
terraform init
terraform show

terraform plan
terraform output app_url

terraform apply -auto-approve
terraform destroy -auto-approve

heroku logs --tail --app wk-container
heroku logs --app wk-container
```

## Check

- http://localhost/WeatherForecast
- https://myweb-101.herokuapp.com/WeatherForecast

## Search

```bash
container heroku_build filename:main.tf
```