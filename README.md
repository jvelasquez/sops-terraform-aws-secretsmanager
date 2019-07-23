# sops-terraform-aws-secretsmanager

Execute the following commands:

```
# Change with appropriate value(s)
SECRET_KMS=arn:aws:kms:eu-west-1:******:alias/sops-key

# Encode secrets
sops --encrypt --kms ${SECRET_KMS} secrets.dec.yaml > secrets.enc.yaml

# Generate Terraform code for secrets
gomplate --datasource secrets=secrets.dec.yaml --file secrets.tf.tpl --out secrets.tf

# Generate Terraform variables file for secrets
gomplate --datasource secrets=secrets.dec.yaml --file secrets.tfvars.tpl --out secrets.dec.tfvars

# Plan terraform using the var file generated
terraform plan -var-file=secrets.dec.tfvars
```

Never commit the `secrets.dec.*` files! They are included here only for demonstration purposes.
