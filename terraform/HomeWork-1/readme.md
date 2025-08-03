#### Задание 1
###	1. Перейдите в каталог src. Скачайте все необходимые зависимости, использованные в проекте.
Выполнено

###	2. Изучите файл .gitignore. В каком terraform-файле, согласно этому .gitignore, допустимо сохранить личную, секретную информацию?(логины,пароли,ключи,токены итд)

```#own secret vars store```

```personal.auto.tfvars```

###	3.  Выполните код проекта. Найдите в state-файле секретное содержимое созданного ресурса random_password, пришлите в качестве ответа конкретный ключ и его значение.
Значение:
"result": "JcWUpecyWNtH8I9l"

<img width="545" height="553" alt="image" src="https://github.com/user-attachments/assets/51e9971f-94c3-4af8-b7ec-a910a5a2fa2e" />

### 4.	Раскомментируйте блок кода, примерно расположенный на строчках 29–42 файла main.tf. Выполните команду terraform validate. Объясните, в чём заключаются намеренно допущенные ошибки. Исправьте их.

При выполнении  terraform validate ошитбок не обнаружено.

Error: Missing name for resource
│ 
│   on main.tf line 24, in resource "docker_image":

│   24: resource "docker_image" {

│ 

│ All resource blocks must have 2 labels (type, name).


Все ресурсные блоки должны иметь два значения: Тип и имя. Добавляем произвольное имя (myname)


Error: Invalid resource name
│ 

│   on main.tf line 29, in resource "docker_container" "1nginx":

│   29: resource "docker_container" "1nginx" {

│ 

│ A name must start with a letter or underscore and may contain only letters, digits, underscores, and dashes.


##### Имя должно начинаться с буквы, убираем цифру.

Опечатки и ошибки в строке:

name = "example_${random_password.random_string_FAKE.resulT}"

Исправленный:

name  = "example_${random_password.random_string.result}"

### 5.	Выполните код. В качестве ответа приложите: исправленный фрагмент кода и вывод команды docker ps

aleksey@ubuntu22:~/work_terraform$ docker ps

CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS          PORTS                  NAMES

696fbd8eca3c   2cd1d97f893f   "/docker-entrypoint.…"   29 seconds ago   Up 28 seconds   0.0.0.0:9090->80/tcp   example_JcWUpecyWNtH8I9l

aleksey@ubuntu22:~/work_terraform$

<img width="583" height="51" alt="image" src="https://github.com/user-attachments/assets/2164350e-5b94-4605-b1f6-09cdd24cded4" />

### 6.	Замените имя docker-контейнера в блоке кода на hello_world. Не перепутайте имя контейнера и имя образа. Мы всё ещё продолжаем использовать name = "nginx:latest". Выполните команду terraform apply -auto-approve. Объясните своими словами, в чём может быть опасность применения ключа -auto-approve. Догадайтесь или нагуглите зачем может пригодиться данный ключ? В качестве ответа дополнительно приложите вывод команды docker ps.

<img width="624" height="658" alt="image" src="https://github.com/user-attachments/assets/940ce62c-9ab8-4751-a83f-670ada1e4501" />

Команда выполнилась без запроса на подтверждении.

Можно использовать при обучении или локальном тестировании.

### 7.	Уничтожьте созданные ресурсы с помощью terraform. Убедитесь, что все ресурсы удалены. Приложите содержимое файла terraform.tfstate.

<img width="554" height="386" alt="image" src="https://github.com/user-attachments/assets/b247504a-6b92-4f6c-8728-2075001dffd0" />

{

  "version": 4,
  
  "terraform_version": "1.8.4",
  
  "serial": 23,
  
  "lineage": "cf606892-b042-e85a-7808-35e753f9f0a7",
  
  "outputs": {},
  
  "resources": [],
  
  "check_results": null
  
}

<img width="470" height="163" alt="image" src="https://github.com/user-attachments/assets/1b4ec6f4-726d-40d0-b300-ce7616cb8040" />

### 8.8.	Объясните, почему при этом не был удалён docker-образ nginx:latest. Ответ ОБЯЗАТЕЛЬНО НАЙДИТЕ В ПРЕДОСТАВЛЕННОМ КОДЕ, а затем ОБЯЗАТЕЛЬНО ПОДКРЕПИТЕ строчкой из документации terraform провайдера docker. (ищите в классификаторе resource docker_image )

Образ не удаляется потому что в конфигурационном файле задан аргумент: 

```keep_locally – true```

если его сменить на false, то при уничтожении ресурсов с помощью terraform образы тоже удалятся.

keep_locally (Boolean) If true, then the Docker image won't be deleted on destroy operation. 

If this is false, it will delete the image from the docker local storage on destroy operation.

