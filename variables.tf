variable "do-token" {
  description = "Digital Ocean api token for Terraform to connect with."
}
variable "region" {
  description = "Digital Ocean region to deploy in."
}
variable "vpc-name" {
  description = "Digital Ocean VPC name to deploy the Digital Ocean Kubernetes Service in."
}
variable "kubernetes-cluster-name" {
  description = "Name that will be set for the Kubernetes cluster in Digital Ocean."
}