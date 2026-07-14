# ☁️ Infra as Code Lab - Terraform + AWS

Este projeto faz parte de um laboratório DevOps e demonstra como provisionar infraestrutura na AWS utilizando Terraform.

Toda a infraestrutura necessária para hospedar a aplicação web é criada através de código (Infrastructure as Code).

---

## 🚀 Recursos Provisionados

- EC2
- Security Group
- IAM Role
- Instance Profile
- Amazon ECR
- User Data para configuração automática da instância

---

## 📚 Tecnologias

- Terraform
- AWS
- EC2
- ECR
- IAM
- Security Groups

---

## 📁 Estrutura

```
.
├── backend.tf
├── ec2.tf
├── ecr.tf
├── provider.tf
└── user_data.sh
```

---

## ⚙️ Pré-requisitos

- Terraform instalado
- AWS CLI configurada
- Credenciais AWS válidas

Verifique:

```bash
terraform version

aws configure
```

---

## 🚀 Inicializando

```bash
terraform init
```

---

## 🔍 Validando

```bash
terraform validate
```

---

## 📋 Planejamento

```bash
terraform plan
```

---

## ☁️ Provisionando

```bash
terraform apply
```

---

## 🗑️ Removendo infraestrutura

```bash
terraform destroy
```

---

## 📦 Arquivos

### provider.tf

Define o provider AWS e região.

---

### backend.tf

Responsável pelo backend remoto do Terraform State.

---

### ecr.tf

Cria o repositório do Amazon ECR onde a imagem Docker será armazenada.

---

### ec2.tf

Provisiona:

- Instância EC2
- Security Group
- IAM Role
- Instance Profile

Também executa o script de bootstrap utilizando:

```terraform
user_data = file("user_data.sh")
```

---

### user_data.sh

Automatiza a configuração inicial da máquina:

- instalação do Docker
- login no ECR
- download da imagem
- execução do container

---

## 🏗️ Arquitetura

```
Terraform
      │
      ▼
 AWS
 ├── ECR
 ├── IAM
 ├── Security Group
 └── EC2
          │
          ▼
 Docker
          │
          ▼
Website
```

---

## 🎯 Objetivos

- Aplicar Infrastructure as Code
- Automatizar criação de infraestrutura
- Provisionar ambiente reproduzível
- Eliminar configurações manuais
- Integrar com aplicação Docker

---

## 📷 Demonstração

Adicione aqui prints do:

- Terraform Apply
- Recursos criados na AWS
- EC2 em execução
- ECR

---

## 🔄 Fluxo completo

```
Código da Aplicação
        │
        ▼
Docker Build
        │
        ▼
Amazon ECR
        │
        ▼
Terraform
        │
        ▼
EC2 Provisionada
        │
        ▼
Container Executando
```

---

## 👨‍💻 Autor

Bruno Henrique de Abreu

LinkedIn: https://linkedin.com/in/bruno--abreu

GitHub: https://github.com/BrunoAbr

Laboratório pensado por: Maria Lazara
