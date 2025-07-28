## Задача 1
Установите на личный Linux-компьютер или учебную **локальную** ВМ с Linux следующие сервисы(желательно ОС ubuntu 20.04):

- [VirtualBox](https://www.virtualbox.org/),
- [Vagrant](https://github.com/netology-code/devops-materials), рекомендуем версию 2.3.4
- [Packer](https://github.com/netology-code/devops-materials/blob/master/README.md) версии 1.9.х + плагин от Яндекс Облако по [инструкции](https://cloud.yandex.ru/docs/tutorials/infrastructure-management/packer-quickstart)
- [уandex cloud cli](https://cloud.yandex.com/ru/docs/cli/quickstart) Так же инициализируйте профиль с помощью ```yc init``` .

### Ответы 1
### VirtualBox
<img width="482" height="165" alt="image" src="https://github.com/user-attachments/assets/3b3e2e44-ade0-4f65-905e-0a223f2e35c2" />

### Vagrant
<img width="561" height="211" alt="image" src="https://github.com/user-attachments/assets/dec70795-77c1-4d6a-b343-3ccd0dd09582" />

### Packer
<img width="624" height="497" alt="image" src="https://github.com/user-attachments/assets/7aa43bba-bfaf-41b1-aeb1-8167f46ea659" />

<img width="624" height="51" alt="image" src="https://github.com/user-attachments/assets/8ce6490a-c25a-44e1-adff-f98a1b5efd51" />

### уandex cloud cli
<img width="624" height="91" alt="image" src="https://github.com/user-attachments/assets/0d9d6fe5-5d53-477a-a3f7-8f88a6f6afe9" />

## Задача 2

### 1. Убедитесь, что у вас есть ssh ключ в ОС или создайте его с помощью команды ssh-keygen -t ed25519

### Директория с ключами.

<img width="1448" height="448" alt="image" src="https://github.com/user-attachments/assets/c9af3067-5549-4b6e-9c92-d45bc7b56aed" />

### 2.Создайте виртуальную машину Virtualbox с помощью Vagrant и Vagrantfile в директории src.

### загруженный образ:

<img width="619" height="60" alt="image" src="https://github.com/user-attachments/assets/1359bac6-165f-4431-9eb7-3a252ebc569d" />

### файл Vagrant в папке src, при запуске получаю следующее.
У меня такой стенд: в Windows установлен VMWare workstation Pro в нем Ubuntu-24-04.
при попытке запустить Vagrant up получаю ошибку:

aleksey@ubuntu22:~/work$ vagrant up

Bringing machine 'server1.netology' up with 'virtualbox' provider...

==> server1.netology: Importing base box 'bento/ubuntu-24.04'...

==> server1.netology: Matching MAC address for NAT networking...

==> server1.netology: Checking if box 'bento/ubuntu-24.04' version '1.0.0' is up to date...

==> server1.netology: Setting the name of the VM: server1.netology

==> server1.netology: Clearing any previously set network interfaces...

==> server1.netology: Preparing network interfaces based on configuration...

    server1.netology: Adapter 1: nat
    
    server1.netology: Adapter 2: hostonly
    
==> server1.netology: Forwarding ports...

    server1.netology: 22 (guest) => 20011 (host) (adapter 1)
    
    server1.netology: 22 (guest) => 2222 (host) (adapter 1)
    
==> server1.netology: Running 'pre-boot' VM customizations...

==> server1.netology: Booting VM...

==> server1.netology: Waiting for machine to boot. This may take a few minutes...

The guest machine entered an invalid state while waiting for it

to boot. Valid states are 'starting, running'. The machine is in the

'gurumeditation' state. Please verify everything is configured

properly and try again.


If the provider you're using has a GUI that comes with it,

it is often helpful to open that and watch the machine, since the

GUI often has more helpful error messages than Vagrant can retrieve.

For example, if you're using VirtualBox, run vagrant up while the

VirtualBox GUI is open.


The primary issue for this error is that the provider you're using

is not properly configured. This is very rarely a Vagrant issue.


### Состояние VirtualBox после выполнения.

<img width="1556" height="620" alt="image" src="https://github.com/user-attachments/assets/330b9b5d-ae64-4bd3-99d6-753223bba31c" />

### Победить не смог.

## Задача 3
1. Отредактируйте файл    [mydebian.json.pkr.hcl](https://github.com/netology-code/virtd-homeworks/blob/shvirtd-1/05-virt-02-iaac/src/mydebian.json.pkr.hcl)  или [mydebian.jsonl](https://github.com/netology-code/virtd-homeworks/blob/shvirtd-1/05-virt-02-iaac/src/mydebian.json) в директории src (packer умеет и в json, и в hcl форматы):
   - добавьте в скрипт установку docker. Возьмите скрипт установки для debian из  [документации](https://docs.docker.com/engine/install/debian/)  к docker, 
   - дополнительно установите в данном образе htop и tmux.(не забудьте про ключ автоматического подтверждения установки для apt)

### Отредактированный файл расположен в папке src

<img width="624" height="231" alt="image" src="https://github.com/user-attachments/assets/b5930381-64f9-4dba-ae73-d185ded25308" />

### Процесс установки

<img width="624" height="415" alt="image" src="https://github.com/user-attachments/assets/648d19af-83f1-404a-9aed-132bddab06dd" />

<img width="624" height="334" alt="image" src="https://github.com/user-attachments/assets/7e353d44-8178-4f80-92d9-0e5b9ab3a7ca" />

<img width="624" height="381" alt="image" src="https://github.com/user-attachments/assets/1d4ebf0d-8a9b-4121-ab92-d52b43dcf6b7" />

### 2.	Найдите свой образ в web консоли yandex_cloud

<img width="624" height="101" alt="image" src="https://github.com/user-attachments/assets/468bda6f-57f0-465c-95ef-8391d6c86e88" />

### 3.	Необязательное задание(*): найдите в документации yandex cloud как найти свой образ с помощью утилиты командной строки "yc cli".

### yc compute image list

<img width="624" height="138" alt="image" src="https://github.com/user-attachments/assets/7a72031a-e1eb-448b-b4dd-2c42c5ab3db6" />

### 4.	Создайте новую ВМ (минимальные параметры) в облаке, используя данный образ

<img width="624" height="40" alt="image" src="https://github.com/user-attachments/assets/092dcbc3-0df1-4405-bc9e-05cacb72f4bb" />

### просмотр из командной строки 

### yc compute instance list

<img width="624" height="192" alt="image" src="https://github.com/user-attachments/assets/f45aec8d-a7f4-4ee0-90d4-0cdbab5e527c" />

### 5.	Подключитесь по ssh и убедитесь в наличии установленного docker.

<img width="624" height="571" alt="image" src="https://github.com/user-attachments/assets/143e1355-ccfb-4965-8e2f-c99349601b13" />
<img width="490" height="456" alt="image" src="https://github.com/user-attachments/assets/a823139d-bda6-4b5b-a461-511f22bae500" />

## 6.	Удалите ВМ и образ.

### Выполнено.
