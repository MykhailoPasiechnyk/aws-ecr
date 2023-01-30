# ECR

### Requirements:
- [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- [Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

## Create ECR repository with Terraform:

#### Clone repository:

```
$ git clone https://github.com/MykhailoPasiechnyk/aws-ecr.git
```

#### Change terraform.tfvars:
- aws_region = "Your aws region"
- name       = "repository name"

### Set environment for Terraform:

#### for Windows:
```
$ set AWS_ACCESS_KEY_ID="Your AWS access key"
$ set AWS_SECRET_ACCESS_KEY="Your AWS secret key"
```

#### for Linux:
```
$ export AWS_ACCESS_KEY_ID="Your AWS access key"
$ export AWS_SECRET_ACCESS_KEY="Your AWS secret key"
```

#### Terraform apply:
In folder terraform:
```
$ terraform apply
```
---
## Push image to your repository:

1. Authenticate to your registry:
```
$ aws ecr get-login-password --region 'Your AWS region' | docker login --username AWS --password-stdin 'Your AWS account ID'.dkr.ecr.'Your AWS region'.amazonaws.com
```

2. Build image:
Go to folder with your Dockerfile
```
$ docker build -t 'image name' .
```

3. After the build completes, tag your image so you can push the image to this repository:
```
$ docker tag 'image name':latest 'Your AWS account ID'.dkr.ecr.'Your AWS region'.amazonaws.com/'image name':latest
```

4. Run the following command to push this image to your newly created AWS repository:
```
$ docker push 'Your AWS account ID'.dkr.ecr.'Your AWS region'.amazonaws.com/'image name':latest
```
---
## Pull image to your repository:
```
$ docker pull 'Your AWS account ID'.dkr.ecr.'Your AWS region'.amazonaws.com/'image name':latest
```