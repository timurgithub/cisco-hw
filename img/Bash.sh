#!/bin/bash

# Проверка доступности порта веб-сервера и наличия файла index.html

# Проверка доступности порта 80 (nginx)
nc -z 127.0.0.1 80
RESULT=$?

if [ $RESULT -ne 0 ]; then
    exit 1
fi

# Проверка наличия файла index.html в корне веб-сервера
if [ ! -f /var/www/html/index.html ]; then
    exit 1
fi

exit 0