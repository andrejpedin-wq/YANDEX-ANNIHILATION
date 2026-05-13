# Yandex Destroyer v4.5 🚀

An advanced debloating script for Android (Termux) designed to detect and completely remove all Yandex-related services and bloatware from your device.

## ⚡ Features
- **Deep Scanning**: Finds hidden analytics packages (AppMetrica) and all `ru.yandex` / `com.yandex` applications.
- **Multi-Level Annihilation**:
  1. **Silent Mode**: Attempts to uninstall via `pm uninstall`.
  2. **Freezing**: Clears data and disables the app (effective for system/non-removable apps).
  3. **System Trigger**: Launches the native Android uninstaller if silent methods are blocked.
- **User-Friendly Interface**: Uses native Android dialogs via Termux:API.

## 🛠 Installation & Usage

1. Install **Termux** and the **Termux:API** app (available on F-Droid).
2. Open Termux and run the following commands:

```bash
pkg update && pkg upgrade
pkg install termux-api python -y
git clone https://github.com/andrejpedin-wq/YANDEX-ANNIHILATION.git
cd Yandex-ANNIHILATION
bash yandex_clean.sh
