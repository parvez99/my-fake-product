# my-fake-product
Repo contains my fake product details

fake-product-app-docker is a nodejs docker app which consists of the webapp and postgres db.

## Local testing

    ### Web App

    >   Clone this repo and from the root dir run docker build -t <sometag> .
    >   Build image currently runs simple endpoint check where the expected o/p is : Hello Fake Product (See test.js file)
    >   Then run : docker-compose up
    >   App should be accessible at : http://localhost:8080/

    ###  Terraform

    >   Setup AWS access from your localhost
    >   Run Terraform init from root directory
    >   Terraform plan to verify global resources and terraform apply
    >   From staging dir - Run terraform init -> terraform plan to verify changes -> terraform apply
    >   From prod dir - Run terraform init -> erraform plan to verify changes -> terraform apply