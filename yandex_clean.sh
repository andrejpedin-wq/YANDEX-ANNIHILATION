#!/bin/bash

termux-wake-lock
clear

echo "=========================================="
echo "    YANDEX DESTROYER v4.5 - STABLE      "
echo "=========================================="

# Ищем цели, подавляя ошибки доступа к чужим профилям
apps=$(cmd package list packages --user 0 2>/dev/null | grep -Ei "yandex|metrica" | cut -d ":" -f 2)

if [ -z "$apps" ]; then
    echo "[+] СИСТЕМА ЧИСТА. ГАДЫ НЕ ОБНАРУЖЕНЫ."
    termux-wake-unlock
    exit 0
fi

echo "[!] ЦЕЛЕЙ В ЗОНЕ ПОРАЖЕНИЯ: $(echo "$apps" | wc -l)"
echo "------------------------------------------"

for app in $apps; do
    echo "[ID] Цель: $app"
    
    result=$(termux-dialog confirm -t "АННИГИЛЯЦИЯ" -i "Уничтожить $app?")
    
    if echo "$result" | grep -q '"text": "yes"'; then
        echo "[*] ФАЗА 1: Попытка тихого удаления..."
        pm uninstall --user 0 $app > /dev/null 2>&1
        
        # Небольшая пауза для обработки системой
        sleep 0.5
        
        if cmd package list packages --user 0 2>/dev/null | grep -q "$app"; then
            echo "[!] Объект сопротивляется. Применяю принудительную деактивацию..."
            am force-stop $app > /dev/null 2>&1
            pm clear $app > /dev/null 2>&1
            pm disable-user --user 0 $app > /dev/null 2>&1
            
            echo "[*] ФАЗА 3: Вызов системного деструктора..."
            am start -a android.intent.action.DELETE -d package:$app > /dev/null 2>&1
            echo "[?] ПОДТВЕРДИ УДАЛЕНИЕ НА ЭКРАНЕ!"
        else
            echo "[+++] УСПЕХ: Объект стерт втихую."
            termux-toast -c green "$app: DELETED"
        fi
    else
        echo "[#] ПРОПУЩЕНО: Гад пощажен."
    fi
    echo "------------------------------------------"
done

termux-wake-unlock
echo "ОПЕРАЦИЯ ЗАВЕРШЕНА."
