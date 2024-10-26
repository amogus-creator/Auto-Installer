#!/bin/bash

echo "Установка необходимых зависимостей... / curl и tar \"
sudo pacman -S --noconfirm curl tar

cd ~/Downloads || { echo "Не удалось перейти в папку загрузок. / ~/Downloads \"; exit 1; }

echo "Копирование Firefox..."
curl -L -o firefox.tar.bz2 "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US&_gl=1*1irdmrv*_ga*Nzg1NTczMTE0LjE3Mjk5Mzc4NDA.*_ga_MQ7767QQQW*MTcyOTkzNzg0MC4xLjEuMTcyOTkzODA0MS4wLjAuMA.."

echo "Извлечение Firefox..."
tar xjf firefox.tar.bz2

echo "Перемещение Firefox в /opt..."
sudo mv firefox /opt

echo "Создание символической ссылки..."
sudo ln -s /opt/firefox/firefox /usr/local/bin/firefox

echo "Очистка временных файлов..."
rm firefox.tar.bz2

echo "Firefox установлен успешно! Вы можете запустить его, введя 'firefox' в терминале."
