variable "aws-profile" {
    type = string
    description = "Profile for AWS Credentials, e.g. default"
}
variable "aws-region" {
    type = string
    description = "Region to configure aws provider with"
}
variable "public_key" {
    type = string
    description = "ssh public key (what would go in an authorized_keys file"
}
variable "ami_image" {
    type = string
    description = "AMI Image (region specific)"
}
variable "instance_type" {
    type = string
    description = "AWS EC2 Instance Type"
}
variable "zone_id" {
    type = string
    description = "AWS Route53 ZoneID for Domain"
}
variable "jitsi_domain_name" {
    type = string
    description = "FQDN name for jitsi service"
}
