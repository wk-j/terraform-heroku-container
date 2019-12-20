## Container

```bash
terraform init
terraform apply -var example_app_name=wk-sushi
terraform show

terraform output example_app_url
terraform destroy -var example_app_name=wk-sushi
```