# BDGTrans - GIMP AI Translation Plugin

A GIMP plugin that translates text layers using a local AI model (like Ollama).

## Table of Contents / Tabla de Contenidos / Inhaltsverzeichnis

- [English](#english)
- [Español](#español)
- [Deutsch](#deutsch)
- [Français](#français)
- [中文](#中文)
- [Русский](#русский)

---

## English

### Description

BDGTrans is a GIMP Python-Fu plugin that translates text layers using a local AI model. It preserves the font and size of the original text while translating the content to the selected language.

### Features

- Translates text layers to: Spanish, German, Russian, French, Chinese
- Preserves original font and font size
- Creates a new layer with translated text
- Hides original layer, shows translated layer
- Configurable AI server and model

### Requirements

- GIMP 2.8 or higher
- Python support in GIMP
- A local AI server (recommended: [Ollama](https://ollama.ai/))

### Installation

#### Linux

1. Copy `bdgtrans.py` to your GIMP plug-ins directory:
   ```bash
   cp bdgtrans.py ~/.config/gimp/2.10/plug-ins/
   chmod +x ~/.config/gimp/2.10/plug-ins/bdgtrans.py
   ```

2. Restart GIMP

#### Windows

1. Copy `bdgtrans.py` to your GIMP plug-ins directory:
   ```
   C:\Users\<username>\.gimp-2.10\plug-ins\
   ```

2. Restart GIMP

#### macOS

1. Copy `bdgtrans.py` to your GIMP plug-ins directory:
   ```bash
   cp bdgtrans.py ~/Library/Application Support/GIMP/2.10/plug-ins/
   chmod +x ~/Library/Application Support/GIMP/2.10/plug-ins/bdgtrans.py
   ```

2. Restart GIMP

### Configuration

The plugin stores its configuration in `~/.config/gimp/BTGTrans.json` (Linux/macOS) or `%APPDATA%\GIMP\2.10\BTGTrans.json` (Windows).

Default configuration:
```json
{
  "server": "http://localhost:11434",
  "model": "llama3"
}
```

To change the server or model, edit this file or run the Configure option from the menu.

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

---

## Español

### Descripción

BDGTrans es un plugin de GIMP Python-Fu que traduce capas de texto usando un modelo de IA local. Preserva la fuente y el tamaño del texto original mientras traduce el contenido al idioma seleccionado.

### Características

- Traduce capas de texto a: Español, Alemán, Ruso, Francés, Chino
- Preserva la fuente original y el tamaño de fuente
- Crea una nueva capa con el texto traducido
- Oculta la capa original, muestra la capa traducida
- Servidor de IA y modelo configurables

### Requisitos

- GIMP 2.8 o superior
- Soporte de Python en GIMP
- Un servidor de IA local (recomendado: [Ollama](https://ollama.ai/))

### Instalación

Vea la sección de instalación en inglés y adapte las rutas a su sistema operativo.

### Configuración

El plugin guarda su configuración en `~/.config/gimp/BTGTrans.json` (Linux/macOS) o `%APPDATA%\GIMP\2.10\BTGTrans.json` (Windows).

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

---

## Deutsch

### Beschreibung

BDGTrans ist ein GIMP Python-Fu-Plugin, das Textschichten mit einem lokalen KI-Modell übersetzt. Es behält die Schriftart und Größe des ursprünglichen Textes bei und übersetzt den Inhalt in die ausgewählte Sprache.

### Funktionen

- Übersetzt Textschichten in: Spanisch, Deutsch, Russisch, Französisch, Chinesisch
- Behält Originalschriftart und -größe bei
- Erstellt eine neue Ebene mit übersetztem Text
- Blendet die Originalebene aus, zeigt die übersetzte Ebene
- Konfigurierbarer KI-Server und Modell

### Anforderungen

- GIMP 2.8 oder höher
- Python-Unterstützung in GIMP
- Ein lokaler KI-Server (empfohlen: [Ollama](https://ollama.ai/))

### Installation

Siehe den englischen Installationsabschnitt und passen Sie die Pfade an Ihr Betriebssystem an.

### Konfiguration

Das Plugin speichert seine Konfiguration in `~/.config/gimp/BTGTrans.json` (Linux/macOS) oder `%APPDATA%\GIMP\2.10\BTGTrans.json` (Windows).

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

---

## Français

### Description

BDGTrans est un plugin GIMP Python-Fu qui traduit les calques de texte en utilisant un modèle d'IA local. Il préserve la police et la taille du texte original tout en traduisant le contenu dans la langue sélectionnée.

### Caractéristiques

- Traduit les calques de texte en : Espagnol, Allemand, Russe, Français, Chinois
- Préserve la police et la taille de police originales
- Crée un nouveau calque avec le texte traduit
- Masque le calque original, affiche le calque traduit
- Serveur IA et modèle configurables

### Exigences

- GIMP 2.8 ou supérieur
- Support Python dans GIMP
- Un serveur IA local (recommandé : [Ollama](https://ollama.ai/))

### Installation

Voir la section d'installation en anglais et adaptez les chemins à votre système d'exploitation.

### Configuration

Le plugin stocke sa configuration dans `~/.config/gimp/BTGTrans.json` (Linux/macOS) ou `%APPDATA%\GIMP\2.10\BTGTrans.json` (Windows).

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

---

## 中文

### 描述

BDGTrans 是一个 GIMP Python-Fu 插件，使用本地 AI 模型翻译文本图层。它在将内容翻译成所选语言的同时，保留原始文本的字体和大小。

### 功能

- 将文本图层翻译为：西班牙语、德语、俄语、法语、中文
- 保留原始字体和字号
- 创建带有翻译文本的新图层
- 隐藏原始图层，显示翻译图层
- 可配置的 AI 服务器和模型

### 要求

- GIMP 2.8 或更高版本
- GIMP 中的 Python 支持
- 本地 AI 服务器（推荐：[Ollama](https://ollama.ai/)）

### 安装

请参阅英文安装部分，并根据您的操作系统调整路径。

### 配置

插件将其配置存储在 `~/.config/gimp/BTGTrans.json`（Linux/macOS）或 `%APPDATA%\GIMP\2.10\BTGTrans.json`（Windows）。

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

---

## Русский

### Описание

BDGTrans — это плагин GIMP Python-Fu, который переводит текстовые слои с использованием локальной модели ИИ. Он сохраняет шрифт и размер исходного текста, переводя содержимое на выбранный язык.

### Функции

- Переводит текстовые слои на: испанский, немецкий, русский, французский, китайский
- Сохраняет оригинальный шрифт и размер шрифта
- Создает новый слой с переведенным текстом
- Скрывает оригинальный слой, показывает переведенный слой
- Настраиваемый сервер ИИ и модель

### Требования

- GIMP 2.8 или выше
- Поддержка Python в GIMP
- Локальный сервер ИИ (рекомендуется: [Ollama](https://ollama.ai/))

### Установка

См. раздел установки на английском языке и адаптируйте пути к вашей операционной системе.

### Конфигурация

Плагин сохраняет свою конфигурацию в `~/.config/gimp/BTGTrans.json` (Linux/macOS) или `%APPDATA%\GIMP\2.10\BTGTrans.json` (Windows).

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

---

## License

MIT License - See LICENSE file for details

## GitHub Repository

https://github.com/bdmurphy73/BDGTrans
