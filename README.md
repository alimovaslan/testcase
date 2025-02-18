# Тестовое задание на вакансию Junior DevOps / Effective Mobile

## Абсолютные пути файлов из репозитория:
- **testcase_monitor.sh** - `/usr/local/bin/testcase_monitor.sh`
- **testcase_monitor.service** - `/etc/systemd/system/testcase_monitor.service`
- **monitor_test.timer** - `/etc/systemd/system/monitor_test.timer`

## Демонстрация работы

### Запуск каждую минуту (health check)

![изображение](https://i.ibb.co/PL7Nsw3/image.png)

### Пример вывода, когда сервис недоступен

![изображение](https://i.ibb.co/R4kq0fRz/image2.png)

### Пример вывода лога при перезапуске процесса
```perl
aslan@aslan-VMware-Virtual-Platform:~$ ps aux | grep test | grep -v grep
root        1551  0.0  0.0  18700  3836 ?        Ss   01:11   0:00 /bin/bash /usr/local/bin/testcase.sh
aslan@aslan-VMware-Virtual-Platform:~$ sudo kill 1551
```

![изображение](https://i.ibb.co/cc5m1jp6/image3.png)

### Пример работы с процессом через командную строку


Извиняюсь за задержку сдачи тестового задания =( (период выполнения выпал на больничный)