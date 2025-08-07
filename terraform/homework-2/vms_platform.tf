#variables in task 4 for second vm

variable "vm_db_family" {
  type = string 
  default = "ubuntu-2004-lts"
  description = "yandex_compute_image, ubuntu 2004"
}

variable "vm_db_name" {
  type = string 
  default = "netology-develop-platform-db"
  description = "VM Name"
}

variable "vm_db_platform_id" {
  type = string 
  default = "standard-v1"
  description = "Platform for VM"
}

variable "vm_db_cores" {
  type = number 
  default = 2
  description = "Cores"
}

variable "vm_db_memory" {
  type = number 
  default = 2
  description = "Memory"
}

variable "vm_db_core_fraction" {
  type = number 
  default = 20
  description = "CPU Usage"
}

## Network


variable "default_zone_db" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr_db" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}
variable "vpc_name_db" {
  type        = string
  default     = "develop_db"
  description = "VPC network & subnet name"
}
