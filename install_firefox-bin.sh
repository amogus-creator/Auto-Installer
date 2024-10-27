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

readonly REPO_DIR="$(dirname "$(readlink -m "${0}")")"
MY_USERNAME="${SUDO_USER:-$(logname 2> /dev/null || echo "${USER}")}"
MY_HOME=$(getent passwd "${MY_USERNAME}" | cut -d: -f6)

THEME_NAME="WhiteSur"
SRC_DIR="${REPO_DIR}/src"

# Firefox
FIREFOX_DIR_HOME="${MY_HOME}/.mozilla/firefox"
FIREFOX_THEME_DIR="${MY_HOME}/.mozilla/firefox/firefox-themes"

# Создание каталогов
mkdir -p "${FIREFOX_THEME_DIR}"

# Установка темы
install_firefox_theme() {
  local target="${FIREFOX_THEME_DIR}"

  echo "Установка темы '${THEME_NAME}' для Firefox..."

  mkdir -p "${target}"
  cp -rf "${SRC_DIR}/${THEME_NAME}" "${target}"
  cp -rf "${SRC_DIR}/customChrome.css" "${target}"
  cp -rf "${SRC_DIR}/userChrome-${THEME_NAME}.css" "${target}/userChrome.css"
  cp -rf "${SRC_DIR}/userContent-${THEME_NAME}.css" "${target}/userContent.css"

  echo "Тема '${THEME_NAME}' успешно установлена."
}

# Установка темы
install_firefox_theme
cd

git clone https://github.com/amogus-creator/Firefox-theme

chmod +x custom-firefox.sh

./custom-firefox.sh
