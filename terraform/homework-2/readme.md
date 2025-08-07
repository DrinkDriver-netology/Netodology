### Задание 1. 

#### пункт 1.4. Инициализируйте проект, выполните код.

<img width="624" height="75" alt="image" src="https://github.com/user-attachments/assets/18ed53bc-25d7-48d3-9272-5ebb2585b2a5" />

#### пункт 1.4. Исправьте намеренно допущенные синтаксические ошибки.
##### Ошибка в   platform_id = "standart-v4"
Список доступных значения для параметра platform_id:
https://yandex.cloud/ru/docs/compute/concepts/vm-platforms
##### следующая ошибка:
│ Error: Error while requesting API to create instance: client-request-id = 2319e095-95db-435f-b136-82a768da3801 client-trace-id = dd570aac-a690-444c-be64-5623136a0307 rpc error: code = InvalidArgument desc = the specified number of cores is not available on platform "standard-v1"; allowed core number: 2, 4

Увеличиваем число ядер до 2х.

#### пункт 1.5. Подключитесь к консоли ВМ через ssh и выполните команду  curl ifconfig.me:

<img width="624" height="774" alt="image" src="https://github.com/user-attachments/assets/45198f74-9f73-407a-bc45-c915d87723f1" />

##### Подключение по SSH:

<img width="610" height="354" alt="image" src="https://github.com/user-attachments/assets/1e754a25-9711-4b9a-8bc8-48a6a3a90595" />

##### Результат выполнения curl

<img width="469" height="46" alt="image" src="https://github.com/user-attachments/assets/9b6f422f-6ce1-48a4-b56e-c32d280e0fe8" />

#### пункт 1.6. Ответьте, как в процессе обучения могут пригодиться параметры preemptible = true и core_fraction=5 в параметрах ВМ
preemptible = true. Прерываемые виртуальные машины — это виртуальные машины, которые могут быть принудительно остановлены в любой момент, по следующим событиям
1.	С момента запуска виртуальной машины прошло 24 часа. 
2.	Возникнет нехватка ресурсов для запуска обычной виртуальной машины в той же зоне доступности.
core_fraction=5 - уровень определяющий долю вычислительного времени физических ядер, которую гарантирует vCPU.
##### Эти функции позволят снизить затраты, рекомендуются Netology  во время обучения.

### Задание 2
#### 2.1 Замените все хардкод-значения для ресурсов yandex_compute_image и yandex_compute_instance на отдельные переменные. К названиям переменных ВМ добавьте в начало префикс vm_web_ . Пример: vm_web_name.
добавлен блок с переменными в файле variables.tf :
```
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
```
##### main.tf - На момент выполненя этого пункта
```
resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family
}
resource "yandex_compute_instance" "platform" {
  name = var.vm_web_name
  platform_id = var.vm_web_platform_id 
  resources {
    cores = var.vm_web_cores
    memory = var.vm_web_memory
    core_fraction = var.vm_web_core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
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
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

}
```
##### Проверка командой terraform plan

<img width="562" height="109" alt="image" src="https://github.com/user-attachments/assets/4f7c5b95-6c40-4588-817c-965283c4acd2" />

### Задание 3

файл 'vms_platform.tf' приложен, в следующих заданиях изменения не вносились.

результат применения:

<img width="624" height="84" alt="image" src="https://github.com/user-attachments/assets/69fad58d-35a2-4b92-949e-8d608c28db2f" />

### Задание 4

файл 'outputs.tf' приложен, в следующих заданиях изменения не вносились.

<img width="312" height="177" alt="image" src="https://github.com/user-attachments/assets/3cbff2b9-a002-4915-91b2-ea7b8674d2a3" />

### Задание 5

сделал по аналогии с лекцией, надейсь правильно понял задание

файл 'local.tf' приложен, в следующих заданиях изменения не вносились.

<img width="326" height="522" alt="image" src="https://github.com/user-attachments/assets/c991bd86-ee7b-4544-91fd-2db32554a4c3" />

изменения в файле variables.tf

<img width="297" height="321" alt="image" src="https://github.com/user-attachments/assets/ae2cee5d-3899-4284-9783-43208ca47d32" />

Apply выполнено при использовании var. (предварительно выполнен destroy)

Вторе применение apply при использовании local

<img width="602" height="336" alt="image" src="https://github.com/user-attachments/assets/d76efd70-b103-4bb2-b4a1-0efdfd6b51ba" />

### Задание 6

Проверили переменные перед с консоли

<img width="561" height="335" alt="image" src="https://github.com/user-attachments/assets/32b8554a-698f-4113-bd48-b564b3baab57" />

После применения plan изменений не найдено.

итоговый файл main.tf приложен.

### Задание 7

7.1 Напишите, какой командой можно отобразить второй элемент списка test_list.
leksey@ubuntu22:~/work_terraform2$ terraform console
> local.test_list[1]
"staging"

7.2 Найдите длину списка test_list с помощью функции length(<имя переменной>).
> length(["develop", "staging", "production"])
3

7.3 Напишите, какой командой можно отобразить значение ключа admin из map test_map.
>  local.test_map.admin
"John"
>  local.test_map.user
"Alex"

7.4 Напишите interpolation-выражение, результатом которого будет: "John is admin for production server based on OS ubuntu-20-04 with X vcpu, Y ram and Z virtual disks", используйте данные из переменных test_list, test_map, servers и функцию length() для подстановки значений.

> "${local.test_map.admin} is ${keys(local.test_map)[0]} for ${local.test_list[2]} server based on OS ${local.servers.production.image} with ${local.servers.production.cpu} vcpu ${local.servers.production.ram} ram and ${length(local.servers.production["disks"])} virtual ${keys(local.servers.production)[1]}"
"John is admin for production server based on OS ubuntu-20-04 with 10 vcpu 40 ram and 4 virtual disks"

### Задание 8
> var.test[0]["dev1"][0]
