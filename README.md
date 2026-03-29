# BDGTrans - GIMP AI Translation Plugin

A GIMP plugin that translates text layers using a local AI model (like Ollama).

## Table of Contents / Tabla de Contenidos / Inhaltsverzeichnis / Table des matières

- [English](#english)
- [Español](#español)
- [Deutsch](#deutsch)
- [Français](#français)
- [中文](#中文)
- [Русский](#русский)

---

## English

### Description

BDGTrans is a GIMP 3.x plugin (both Python-Fu and Script-Fu) that translates text layers using a local AI model. It preserves the font and size of the original text while translating the content to the selected language.

### Features

- Translates text layers to: Spanish, German, Russian, French, Chinese
- Preserves original font and font size
- Creates a new layer with translated text
- Hides original layer, shows translated layer
- Configurable AI server and model
- Connection verification during configuration

### Requirements

- GIMP 3.0 or higher
- Python 3 support in GIMP (for Python-Fu)
- A local AI server (recommended: [Ollama](https://ollama.ai/))

### Installation

#### Linux

1. Copy the Python-Fu plugin to your GIMP plug-ins directory:
   ```bash
   cp bdgtrans.py ~/.config/gimp/3.2/plug-ins/
   chmod +x ~/.config/gimp/3.2/plug-ins/bdgtrans.py
   ```

2. Copy the Script-Fu script and prompt file to your GIMP scripts directory:
   ```bash
   cp BDGTrans.scm BDGTrans-prompt.txt ~/.config/gimp/3.2/scripts/
   ```

3. Restart GIMP

#### Windows

1. Copy the Python-Fu plugin to your GIMP plug-ins directory:
   ```
   C:\Users\<username>\AppData\Roaming\GIMP\3.2\plug-ins\
   ```

2. Copy the Script-Fu script and prompt file to your GIMP scripts directory:
   ```
   C:\Users\<username>\AppData\Roaming\GIMP\3.2\scripts\
   ```

3. Restart GIMP

#### macOS

1. Copy the Python-Fu plugin to your GIMP plug-ins directory:
   ```bash
   cp bdgtrans.py ~/Library/Application\ Support/GIMP/3.2/plug-ins/
   chmod +x ~/Library/Application\ Support/GIMP/3.2/plug-ins/bdgtrans.py
   ```

2. Copy the Script-Fu script and prompt file to your GIMP scripts directory:
   ```bash
   cp BDGTrans.scm BDGTrans-prompt.txt ~/Library/Application\ Support/GIMP/3.2/scripts/
   ```

3. Restart GIMP

Or simply run the installation script:
```bash
chmod +x install.sh
./install.sh
```

### Configuration

The plugin stores its configuration in `~/.config/gimp/BTGTrans.json` (Linux/macOS) or `%APPDATA%\GIMP\3.2\BTGTrans.json` (Windows).

Default configuration:
```json
{
  "server": "http://localhost:11434",
  "model": "llama3"
}
```

To change the server or model, edit this file or run the Configure option from the menu (Filters > BDGTrans > Configure).

### Usage

1. Open an image in GIMP
2. Select a text layer
3. Go to `Filters > BDGTrans > Translate Text...`
4. Select the target language
5. Click OK

The plugin will:
- Duplicate the text layer
- Translate the text using the AI model
- Name the new layer with the language suffix
- Hide the original layer
- Show the translated layer

### AI Server Setup

The plugin requires a local AI server. We recommend [Ollama](https://ollama.ai/):

1. Install Ollama
2. Pull a model: `ollama pull llama3` (or your preferred model)
3. Start Ollama: `ollama serve`
4. The server will be available at `http://localhost:11434`

### Support

You can support me by buying me a coffee. https://buymeacoffee.com/bdmurph73i.

My website is: https://authorbdmurphy.com/

---

## Español

### Descripción

BDGTrans es un plugin de GIMP 3.x (Python-Fu y Script-Fu) que traduce capas de texto usando un modelo de IA local. Preserva la fuente y el tamaño del texto original mientras traduce el contenido al idioma seleccionado.

### Características

- Traduce capas de texto a: Español, Alemán, Ruso, Francés, Chino
- Preserva la fuente original y el tamaño de fuente
- Crea una nueva capa con el texto traducido
- Oculta la capa original, muestra la capa traducida
- Servidor de IA y modelo configurables
- Verificación de conexión durante la configuración

### Requisitos

- GIMP 3.0 o superior
- Soporte de Python 3 en GIMP
- Un servidor de IA local (recomendado: [Ollama](https://ollama.ai/))

### Instalación

Vea la sección de instalación en inglés y adapte las rutas a su sistema operativo.

### Configuración

El plugin guarda su configuración en `~/.config/gimp/BTGTrans.json` (Linux/macOS) o `%APPDATA%\GIMP\BTGTrans.json` (Windows).

Configuración predeterminada:
```json
{
  "server": "http://localhost:11434",
  "model": "llama3"
}
```

### Uso

1. Abra una imagen en GIMP
2. Seleccione una capa de texto
3. Vaya a `Filtros > BDGTrans > Traducir Texto...`
4. Seleccione el idioma objetivo
5. Haga clic en Aceptar

### Soporte

Puedes apoyarme invitándome a un café. https://buymeacoffee.com/bdmurph73i.

Mi sitio web es: https://authorbdmurphy.com/

---

## Deutsch

### Beschreibung

BDGTrans ist ein GIMP 3.x Plugin (sowohl Python-Fu als auch Script-Fu), das Textschichten mit einem lokalen KI-Modell übersetzt. Es behält die Schriftart und Größe des ursprünglichen Textes bei und übersetzt den Inhalt in die ausgewählte Sprache.

### Funktionen

- Übersetzt Textschichten in: Spanisch, Deutsch, Russisch, Französisch, Chinesisch
- Behält Originalschriftart und -größe bei
- Erstellt eine neue Ebene mit übersetztem Text
- Blendet die Originalebene aus, zeigt die übersetzte Ebene
- Konfigurierbarer KI-Server und Modell
- Verbindungsüberprüfung während der Konfiguration

### Anforderungen

- GIMP 3.0 oder höher
- Python 3-Unterstützung in GIMP
- Ein lokaler KI-Server (empfohlen: [Ollama](https://ollama.ai/))

### Installation

Siehe den englischen Installationsabschnitt und passen Sie die Pfade an Ihr Betriebssystem an.

### Konfiguration

Das Plugin speichert seine Konfiguration in `~/.config/gimp/BTGTrans.json` (Linux/macOS) oder `%APPDATA%\GIMP\BTGTrans.json` (Windows).

Standardkonfiguration:
```json
{
  "server": "http://localhost:11434",
  "model": "llama3"
}
```

### Verwendung

1. Öffnen Sie ein Bild in GIMP
2. Wählen Sie eine Textebene
3. Gehen Sie zu `Filter > BDGTrans > Text übersetzen...`
4. Zielsprache auswählen
5. Klicken Sie auf OK

### Unterstützung

Sie können mich unterstützen, indem Sie mir einen Kaffee kaufen. https://buymeacoffee.com/bdmurph73i.

Meine Website ist: https://authorbdmurphy.com/

---

## Français

### Description

BDGTrans est un plugin GIMP 3.x (Python-Fu et Script-Fu) qui traduit les calques de texte en utilisant un modèle d'IA local. Il préserve la police et la taille du texte original tout en traduisant le contenu dans la langue sélectionnée.

### Caractéristiques

- Traduit les calques de texte en : Espagnol, Allemand, Russe, Français, Chinois
- Préserve la police et la taille de police originales
- Crée un nouveau calque avec le texte traduit
- Masque le calque original, affiche le calque traduit
- Serveur IA et modèle configurables
- Vérification de connexion pendant la configuration

### Exigences

- GIMP 3.0 ou supérieur
- Support Python 3 dans GIMP
- Un serveur IA local (recommandé : [Ollama](https://ollama.ai/))

### Installation

Voir la section d'installation en anglais et adaptez les chemins à votre système d'exploitation.

### Configuration

Le plugin stocke sa configuration dans `~/.config/gimp/BTGTrans.json` (Linux/macOS) ou `%APPDATA%\GIMP\BTGTrans.json` (Windows).

Configuration par défaut :
```json
{
  "server": "http://localhost:11434",
  "model": "llama3"
}
```

### Utilisation

1. Ouvrez une image dans GIMP
2. Sélectionnez un calque de texte
3. Allez dans `Filtres > BDGTrans > Traduire le texte...`
4. Sélectionnez la langue cible
5. Cliquez sur OK

### Soutenir

Vous pouvez me soutenir en m'achetant un café. https://buymeacoffee.com/bdmurph73i.

Mon site web est : https://authorbdmurphy.com/

---

## 中文

### 描述

BDGTrans 是一个 GIMP 3.x 插件（Python-Fu 和 Script-Fu），使用本地 AI 模型翻译文本图层。它在将内容翻译成所选语言的同时，保留原始文本的字体和大小。

### 功能

- 将文本图层翻译为：西班牙语、德语、俄语、法语、中文
- 保留原始字体和字号
- 创建带有翻译文本的新图层
- 隐藏原始图层，显示翻译图层
- 可配置的 AI 服务器和模型
- 配置期间进行连接验证

### 要求

- GIMP 3.0 或更高版本
- GIMP 中的 Python 3 支持
- 本地 AI 服务器（推荐：[Ollama](https://ollama.ai/)）

### 安装

请参阅英文安装部分，并根据您的操作系统调整路径。

### 配置

插件将其配置存储在 `~/.config/gimp/BTGTrans.json`（Linux/macOS）或 `%APPDATA%\GIMP\BTGTrans.json`（Windows）。

默认配置：
```json
{
  "server": "http://localhost:11434",
  "model": "llama3"
}
```

### 使用方法

1. 在 GIMP 中打开图像
2. 选择文本图层
3. 转到 `滤镜 > BDGTrans > 翻译文本...`
4. 选择目标语言
5. 点击确定

### 支持

您可以通过给我买杯咖啡来支持我。 https://buymeacoffee.com/bdmurph73i。

我的网站是： https://authorbdmurphy.com/

---

## Русский

### Описание

BDGTrans — это плагин GIMP 3.x (Python-Fu и Script-Fu), который переводит текстовые слои с использованием локальной модели ИИ. Он сохраняет шрифт и размер исходного текста, переводя содержимое на выбранный язык.

### Функции

- Переводит текстовые слои на: испанский, немецкий, русский, французский, китайский
- Сохраняет оригинальный шрифт и размер шрифта
- Создает новый слой с переведенным текстом
- Скрывает оригинальный слой, показывает переведенный слой
- Настраиваемый сервер ИИ и модель
- Проверка подключения во время настройки

### Требования

- GIMP 3.0 или выше
- Поддержка Python 3 в GIMP
- Локальный сервер ИИ (рекомендуется: [Ollama](https://ollama.ai/))

### Установка

См. раздел установки на английском языке и адаптируйте пути к вашей операционной системе.

### Конфигурация

Плагин сохраняет свою конфигурацию в `~/.config/gimp/BTGTrans.json` (Linux/macOS) или `%APPDATA%\GIMP\BTGTrans.json` (Windows).

Конфигурация по умолчанию:
```json
{
  "server": "http://localhost:11434",
  "model": "llama3"
}
```

### Использование

1. Откройте изображение в GIMP
2. Выберите текстовый слой
3. Перейдите в `Фильтры > BDGTrans > Перевести текст...`
4. Выберите целевой язык
5. Нажмите ОК

### Поддержка

Вы можете поддержать меня, купив мне кофе. https://buymeacoffee.com/bdmurph73i.

Мой веб-сайт: https://authorbdmurphy.com/

---

## License

MIT License - See LICENSE file for details

## GitHub Repository

https://github.com/bdmurphy73/BDGTrans

## Privacy & Terms of Service

[Privacy_TermsOfService.txt](https://github.com/bdmurphy73/BDGTrans/blob/master/Privacy_TermsOfService.txt)
