# Yandex Destroyer v4.5 🚀

Скрипт для Termux, который находит и помогает удалить абсолютно все сервисы Яндекса с вашего Android-устройства.

## ⚡ Особенности
- **Глубокий поиск**: Находит скрытые пакеты аналитики (Metrica) и все приложения `ru.yandex`.
- **Многоуровневое удаление**:
  1. Тихая аннигиляция (через `pm uninstall`).
  2. Заморозка и очистка данных (для системных приложений).
  3. Вызов системного деструктора (если тихий метод заблокирован).
- **Интерфейс**: Использует нативные диалоговые окна Android через Termux:API.

## 🛠 Установка и запуск

1. Установите **Termux** и приложение **Termux:API** (из F-Droid).
2. Откройте Termux и выполните следующие команды:

```bash
pkg update && pkg upgrade
pkg install termux-api python -y
git clone https://github.com/andrejpedin-wq/YANDEX-ANNIHILATION.git
cd Yandex-ANNIHILATION
bash yandex_clean.sh
