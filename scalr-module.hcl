version = "v1"

variable "region" {
  policy = "cloud.locations"
  conditions = {
  cloud = "azure"
 }
}  

variable "instance_type" {
  policy = "cloud.instance.types"
  conditions = {
  cloud = "azure"
  cloud.location = var.region
 }
}
