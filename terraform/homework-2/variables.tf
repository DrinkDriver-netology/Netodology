#variables in task 2
variable "vm_web_family" {
  type = string 
  default = "ubuntu-2004-lts"
  description = "yandex_compute_image, ubuntu 2004"
}

variable "vm_web_name" {
  type = string 
  default = "netology-develop-platform-web"
  description = "VM Name"
}

variable "vm_web_platform_id" {
  type = string 
  default = "standard-v1"
  description = "Platform for VM"
}

variable "vm_web_cores" {
  type = number 
  default = 2
  description = "Cores"
}

variable "vm_web_memory" {
  type = number 
  default = 1
  description = "Memory"
}

variable "vm_web_core_fraction" {
  type = number 
  default = 5
  description = "CPU Usage"
}


# variables in task 5

  variable "project" {
  type = string
  default = "netology"
  description = "Name of project"
}

variable "contur" {
  type = string
  default = "develop"
  description = "envirement like prod, test, develop"
}

variable "role" {
  type = string
  default = "platform"
  description = "server role"
}

variable "destdescweb" {
  type = string
  default = "web"
  description = "Destination Description for web"
}

  variable "destdescdb" {
  type = string
  default = "db"
  description = "Destination Description for DB"
}

# variables for tak 6

variable "config" {
  type = map(object({
    memory = number
    cores = number
    core_fraction = number
  }))
  default = {
    "web" = {
      cores = 2
      memory  = 1
      core_fraction = 5

    },
    "db" = {
      cores = 2
      memory  = 2
      core_fraction = 20

    }
  }
}

variable "metadata" {
  type = map
  default = {
    serial-port-enable = 1
    ssh-keys = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDBI6izVf/EKHJ6dfMLV7YGmUvDojow60Eq438C9lAzL aleksey@ubuntu22"
  }
}


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDBI6izVf/EKHJ6dfMLV7YGmUvDojow60Eq438C9lAzL aleksey@ubuntu22"
  description = "ssh-keygen -t ed25519"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

###cloud vars


variable "cloud_id" {
  type        = string
  default     = "b1gu11hlhaekvgdghiop"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1gskvdblc6ceq4ha1t3"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}
