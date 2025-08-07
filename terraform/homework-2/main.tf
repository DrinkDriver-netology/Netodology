resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

resource "yandex_vpc_subnet" "developdb" {
  name           = var.vpc_name_db
  zone           = var.default_zone_db
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr_db
}

data "yandex_compute_image" "ubuntu_db" {
  family = var.vm_db_family
}
resource "yandex_compute_instance" "platformdb" {
  name = local.wm_name_db
  platform_id = var.vm_db_platform_id 
  zone = var.default_zone_db
  resources {
    #cores = var.vm_db_cores
    #memory = var.vm_db_memory
    #core_fraction = var.vm_db_core_fraction
    cores = var.config["db"].cores 
    memory = var.config["db"].memory
    core_fraction = var.config["db"].core_fraction
  }
boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu_db.image_id
    }
  }

  scheduling_policy {
    preemptible = true
  }
  
  network_interface {
    subnet_id = yandex_vpc_subnet.developdb.id
    nat       = true
  }
  
  metadata = {
    serial-port-enable = var.metadata.serial-port-enable
    ssh-keys           = var.metadata.ssh-keys
  }
}


data "yandex_compute_image" "ubuntu_vm" {
  family = var.vm_web_family
}
resource "yandex_compute_instance" "platform" {
  name = local.vmn_name_web
  platform_id = var.vm_web_platform_id 
  resources {
    cores = var.config[web].cores 
    memory = var.config[web].memory
    core_fraction = var.config[web].core_fraction
    #cores = var.vm_web_cores
    #memory = var.vm_web_memory
    #core_fraction = var.vm_web_core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu_vm.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.metadata.serial-port-enable
    ssh-keys           = var.metadata.ssh-keys
  }

}
