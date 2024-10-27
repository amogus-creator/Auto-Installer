#!/bin/bash

echo "Установка необходимых зависимостей... (curl, tar, alsa-lib)"
sudo pacman -S --noconfirm curl tar alsa-lib

cd ~/Downloads || { echo "Не удалось перейти в папку загрузок. ~/Downloads"; exit 1; }

echo "Загрузка Firefox..."
curl -L -o firefox.tar.bz2 "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US&_gl=1*1irdmrv*_ga*Nzg1NTczMTE0LjE3Mjk5Mzc4NDA.*_ga_MQ7767QQQW*MTcyOTkzNzg0MC4xLjEuMTcyOTkzODA0MS4wLjAuMA.."

echo "Извлечение Firefox..."
tar xjf firefox.tar.bz2

echo "Перемещение Firefox в /opt..."
sudo mv firefox /opt

echo "Создание символической ссылки..."
sudo ln -s /opt/firefox/firefox /usr/local/bin/firefox

echo "Firefox установлен успешно! Вы можете запустить его, введя 'firefox' в терминале."

cd

git clone https://github.com/vinceliuice/WhiteSur-firefox-theme

cd ~/WhiteSur-firefox-theme

./install.sh

cd

git clone https://github.com/amogus-creator/Firefox-theme

cd Firefox-theme

chmod +x custom-firefox.sh

mv custom-firefox.sh ~/WhiteSur-firefox-theme

cd ~/WhiteSur-firefox-theme

./custom-firefox.sh
