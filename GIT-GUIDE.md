# 📚 Гід по Git для початківця

## Що таке Git?

Git — це система контролю версій. Уяви що це як "машина часу" для твого коду:
- Ти можеш зберегти стан проєкту в будь-який момент (це називається **коміт**)
- Ти можеш повернутись до будь-якого збереженого стану
- Ти можеш бачити всю історію змін

**GitHub** — це сайт, де зберігаються Git-репозиторії онлайн (як хмарне сховище для коду).

---

## 🚀 Початкове налаштування (один раз)

### 1. Встанови Git на Mac

Git зазвичай вже встановлений на macOS. Перевір в Terminal:
```bash
git --version
```

Якщо не встановлений, Xcode Command Line Tools встановить його:
```bash
xcode-select --install
```

### 2. Налаштуй своє імʼя та email

```bash
git config --global user.name "Igor"
git config --global user.email "твій-email@example.com"
```

> ⚠️ Використовуй той самий email, що і на GitHub

### 3. Створи SSH ключ (для зʼєднання з GitHub)

```bash
ssh-keygen -t ed25519 -C "твій-email@example.com"
```

Натисни Enter на всі питання (можна без пароля для зручності).

Потім скопіюй публічний ключ:
```bash
cat ~/.ssh/id_ed25519.pub
```

Скопіюй весь вивід та додай його на GitHub:
1. Зайди на github.com → Settings → SSH and GPG keys
2. Натисни "New SSH key"
3. Встав ключ та збережи

---

## 📁 Створення репозиторію

### Варіант A: Створити на GitHub і клонувати (рекомендовано)

1. Зайди на github.com
2. Натисни "+" → "New repository"
3. Назва: `100-days-of-swiftui`
4. Опис: "Мій щоденник навчання iOS-розробки"
5. Вибери "Public" (щоб інші могли бачити твій прогрес)
6. ✅ Постав галочку "Add a README file"
7. Натисни "Create repository"

Потім клонуй на свій Mac:
```bash
cd ~/Developer
git clone git@github.com:ТВІЙ-USERNAME/100-days-of-swiftui.git
cd 100-days-of-swiftui
```

> 💡 Папка `~/Developer` — хороше місце для проєктів на Mac

### Варіант B: Створити локально і завантажити на GitHub

```bash
cd ~/Developer/100-days-of-swiftui
git init
git add .
git commit -m "Initial commit: project structure"
git branch -M main
git remote add origin git@github.com:ТВІЙ-USERNAME/100-days-of-swiftui.git
git push -u origin main
```

---

## 📅 Щоденне використання (3 команди!)

Кожен день після навчання виконуй ці 3 команди:

```bash
# 1. Додай всі зміни
git add .

# 2. Збережи з описом
git commit -m "Day 1: Variables, constants, and strings"

# 3. Завантаж на GitHub
git push
```

**Це все!** Три команди — і твій прогрес збережений назавжди.

---

## 🔍 Корисні команди

```bash
# Подивитись статус (які файли змінені)
git status

# Подивитись історію комітів
git log --oneline

# Подивитись що змінилось
git diff

# Скасувати зміни в файлі (повернути до останнього коміту)
git checkout -- filename.swift
```

---

## 📂 Як додавати новий день

```bash
# 1. Створи папку для нового дня
mkdir Day-002

# 2. Скопіюй шаблон
cp TEMPLATE-DAY/README.md Day-002/README.md

# 3. Відредагуй README.md — заповни свої нотатки

# 4. Додай файли з кодом

# 5. Закоміть
git add .
git commit -m "Day 2: Booleans, string interpolation, checkpoint 1"
git push
```

---

## 📱 Як додавати Xcode проєкти

Коли в курсі почнуться повноцінні проєкти (з Дня 16), ти будеш створювати їх в Xcode. Ось як додати проєкт в репозиторій:

1. **Створи проєкт в Xcode** всередині папки дня:
   - File → New → Project
   - Збережи в `100-days-of-swiftui/Day-016-WeSplit/`

2. **Файл .gitignore вже налаштований** — він автоматично ігнорує тимчасові файли Xcode

3. **Закоміть як зазвичай:**
   ```bash
   git add .
   git commit -m "Day 16: WeSplit project - Part 1"
   git push
   ```

### Що потрапить в Git (✅) і що ні (❌):

```
Day-016-WeSplit/
├── WeSplit/
│   ├── WeSplitApp.swift          ✅ Твій код
│   ├── ContentView.swift         ✅ Твій код
│   ├── Assets.xcassets/          ✅ Ресурси (іконки, кольори)
│   └── Info.plist                ✅ Налаштування додатку
├── WeSplit.xcodeproj/
│   ├── project.pbxproj           ✅ Структура проєкту
│   └── xcuserdata/               ❌ Ігнорується (.gitignore)
├── build/                        ❌ Ігнорується (.gitignore)
├── DerivedData/                  ❌ Ігнорується (.gitignore)
└── README.md                     ✅ Твої нотатки
```

**Чому ігноруємо?**
- `xcuserdata/` — це твої персональні налаштування Xcode (позиція вікна, breakpoints). Вони не потрібні нікому іншому.
- `build/` та `DerivedData/` — скомпільований код. Може займати гігабайти. Перестворюється автоматично при збірці.
- `.DS_Store` — службовий файл macOS. Не має відношення до коду.

---

## ❓ Часті питання

### "Я зробив помилку в коміті, що робити?"
```bash
# Змінити повідомлення останнього коміту
git commit --amend -m "Нове повідомлення"

# Скасувати останній коміт (зберігши зміни)
git reset --soft HEAD~1
```

### "Я випадково додав великий файл"
```bash
# Видали файл з Git (але не з диску)
git rm --cached великий-файл.zip
git commit -m "Remove large file"
git push
```

### "GitHub показує конфлікт"
Це рідко трапляється коли працюєш один. Але якщо сталось:
```bash
git pull
# Відредагуй конфліктні файли
git add .
git commit -m "Resolve conflict"
git push
```

---

## 🎯 Підсумок

Щоденний ритуал — **3 команди після кожного уроку:**

```bash
git add .
git commit -m "Day X: Тема дня"
git push
```

Це все що потрібно знати для початку! З часом ти вивчиш більше команд Git, але ці три — твій фундамент. 🚀
