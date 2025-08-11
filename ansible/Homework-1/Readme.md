# Домашнее задание к занятию 1 «Введение в Ansible»

## Подготовка к выполнению

1. Установите Ansible версии 2.10 или выше.
2. Создайте свой публичный репозиторий на GitHub с произвольным именем.
3. Скачайте [Playbook](./playbook/) из репозитория с домашним заданием и перенесите его в свой репозиторий.

## Основная часть

1. Попробуйте запустить playbook на окружении из `test.yml`, зафиксируйте значение, которое имеет факт `some_fact` для указанного хоста при выполнении playbook.
   
<img width="551" height="213" alt="image" src="https://github.com/user-attachments/assets/3bbf2b47-b6d3-46d8-b343-e27a92f00e94" />

2. Найдите файл с переменными (group_vars), в котором задаётся найденное в первом пункте значение, и поменяйте его на `all default fact`.

<img width="624" height="731" alt="image" src="https://github.com/user-attachments/assets/e563a976-0346-4d61-9535-57e17c1314cb" />

3. Воспользуйтесь подготовленным (используется `docker`) или создайте собственное окружение для проведения дальнейших испытаний.
   
<img width="624" height="102" alt="image" src="https://github.com/user-attachments/assets/3826fc83-b5be-481f-b46b-dfb772805cf6" />

4. Проведите запуск playbook на окружении из `prod.yml`. Зафиксируйте полученные значения `some_fact` для каждого из `managed host`.

<img width="624" height="700" alt="image" src="https://github.com/user-attachments/assets/95553253-a9af-48e8-b720-5e29a016b8bb" />

5. Добавьте факты в `group_vars` каждой из групп хостов так, чтобы для `some_fact` получились значения: для `deb` — `deb default fact`, для `el` — `el default fact`.

<img width="418" height="165" alt="image" src="https://github.com/user-attachments/assets/6346d3d3-49de-4491-b4ef-ec5f1e46cbb0" />

.

<img width="424" height="200" alt="image" src="https://github.com/user-attachments/assets/4c4beca0-8db6-40b9-a211-173ed64a4a45" />

6.  Повторите запуск playbook на окружении `prod.yml`. Убедитесь, что выдаются корректные значения для всех хостов.

<img width="531" height="273" alt="image" src="https://github.com/user-attachments/assets/7fca2aae-8969-483f-8c05-e0627cb56d65" />

7. При помощи `ansible-vault` зашифруйте факты в `group_vars/deb` и `group_vars/el` с паролем `netology`.

<img width="407" height="89" alt="image" src="https://github.com/user-attachments/assets/10986389-49d4-42ae-b30b-5f6b3a38e9f1" />

.

<img width="553" height="165" alt="image" src="https://github.com/user-attachments/assets/425c2e60-11d0-4812-b1fd-32e3f74cd5f6" />

.

<img width="561" height="175" alt="image" src="https://github.com/user-attachments/assets/b026693d-20a2-462f-a285-df20511cf6aa" />
 
8. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь в работоспособности.

<img width="603" height="273" alt="image" src="https://github.com/user-attachments/assets/797c05ba-c47a-4418-a901-c21f701fbd0f" />

9. Посмотрите при помощи `ansible-doc` список плагинов для подключения. Выберите подходящий для работы на `control node`.

<img width="409" height="299" alt="image" src="https://github.com/user-attachments/assets/68b34fa1-6c91-4e64-90ea-8722bb18917d" />

10. В `prod.yml` добавьте новую группу хостов с именем  `local`, в ней разместите localhost с необходимым типом подключения.

<img width="472" height="207" alt="image" src="https://github.com/user-attachments/assets/136f25f7-c3bd-4c0d-85b3-642badcd2db9" />
 
11. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь, что факты `some_fact` для каждого из хостов определены из верных `group_vars`.

<img width="624" height="312" alt="image" src="https://github.com/user-attachments/assets/4ec8f3a8-8876-4770-9b32-c577f8953fad" />
 
13. Заполните `README.md` ответами на вопросы. Сделайте `git push` в ветку `master`. В ответе отправьте ссылку на ваш открытый репозиторий с изменённым `playbook` и заполненным `README.md`.
14. Предоставьте скриншоты результатов запуска команд.

## Необязательная часть

1. При помощи `ansible-vault` расшифруйте все зашифрованные файлы с переменными.

<img width="411" height="73" alt="image" src="https://github.com/user-attachments/assets/91238820-aa0d-4fda-baa7-30ecaa39bb83" />

2. Зашифруйте отдельное значение `PaSSw0rd` для переменной `some_fact` паролем `netology`. Добавьте полученное значение в `group_vars/all/exmp.yml`.
   
3. Запустите `playbook`, убедитесь, что для нужных хостов применился новый `fact`.
   
<img width="624" height="672" alt="image" src="https://github.com/user-attachments/assets/fb5e0e72-e8fe-4a6f-8b63-d354bd5746e3" />

4. Добавьте новую группу хостов `fedora`, самостоятельно придумайте для неё переменную. В качестве образа можно использовать [этот вариант](https://hub.docker.com/r/pycontribs/fedora).

6. Напишите скрипт на bash: автоматизируйте поднятие необходимых контейнеров, запуск ansible-playbook и остановку контейнеров.

7. Все изменения должны быть зафиксированы и отправлены в ваш личный репозиторий.


---

### Как оформить решение задания

Приложите ссылку на ваше решение в поле «Ссылка на решение» и нажмите «Отправить решение»
---
