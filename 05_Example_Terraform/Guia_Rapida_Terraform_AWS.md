
# 🌐 Guía Rápida de Terraform con AWS

Esta guía te ayudará a identificar los recursos más comunes en AWS usando Terraform y los atributos clave de cada uno.

---

## 🧱 Formato general de un recurso

```hcl
resource "<proveedor>_<tipo_recurso>" "<nombre_local>" {
  # atributos y configuraciones
}
```

---

## 📘 Recursos comunes de AWS en Terraform

### 1. EC2 Instance
```hcl
resource "aws_instance" "example" {
  ami           = "ami-xxxxxxx"
  instance_type = "t2.micro"

  tags = {
    Name = "MyEC2"
  }
}
```
- **Atributos clave:** `ami`, `instance_type`, `key_name`, `vpc_security_group_ids`, `subnet_id`, `tags`

---

### 2. S3 Bucket
```hcl
resource "aws_s3_bucket" "example" {
  bucket = "nombre-del-bucket"
  acl    = "private"

  tags = {
    Name        = "MyBucket"
    Environment = "Dev"
  }
}
```
- **Atributos clave:** `bucket`, `acl`, `force_destroy`, `versioning`, `tags`

---

### 3. Security Group
```hcl
resource "aws_security_group" "web_sg" {
  name        = "allow_web"
  description = "Allow HTTP and HTTPS"
  vpc_id      = "vpc-xxxxxx"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "WebSG"
  }
}
```
- **Atributos clave:** `name`, `description`, `vpc_id`, `ingress`, `egress`, `tags`

---

### 4. IAM Role
```hcl
resource "aws_iam_role" "lambda_exec" {
  name = "lambda_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}
```
- **Atributos clave:** `name`, `assume_role_policy`, `tags`

---

### 5. Outputs
```hcl
output "bucket_name" {
  value = aws_s3_bucket.example.id
}
```
- Muestra información útil después del `apply`.

---

### 6. Variables
```hcl
variable "instance_type" {
  default = "t2.micro"
}
```
- Usadas para parametrizar configuraciones.

---

## 🛠️ Tips para buscar más recursos

- Usa Google con:  
  `terraform aws <nombre recurso> site:registry.terraform.io`
- O visita:  
  [https://registry.terraform.io/providers/hashicorp/aws/latest/docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

---

## 🏷️ Etiquetas comunes (tags)

```hcl
tags = {
  Name        = "my-resource"
  Environment = "Dev"
  Owner       = "ricardo"
}
```

---

¡Sigue practicando con `terraform plan`, `apply` y `destroy` para dominar Terraform con AWS!
