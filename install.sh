#!/bin/bash
# BDGTrans Installation Script for GIMP 3.x

SCRIPT_FU="BDGTrans.scm"
PYTHON_FU="bdgtrans.py"
PROMPT_FILE="BDGTrans-prompt.txt"

GIMP_VERSION="3.0"

# Detect OS and set plugin directory
case "$(uname -s)" in
    Linux*)
        PLUGIN_DIR="$HOME/.config/gimp/{}/plug-ins".format(GIMP_VERSION)
        CONFIG_DIR="$HOME/.config/gimp"
        ;;
    Darwin*)
        PLUGIN_DIR="$HOME/Library/Application Support/GIMP/{}/plug-ins".format(GIMP_VERSION)
        CONFIG_DIR="$HOME/Library/Application Support/GIMP"
        ;;
    CYGWIN*|MINGW*|MSYS*)
        PLUGIN_DIR="$APPDATA/GIMP/{}/plug-ins".format(GIMP_VERSION)
        CONFIG_DIR="$APPDATA/GIMP"
        ;;
    *)
        echo "Unknown operating system"
        exit 1
        ;;
esac

# Expand the path properly for Linux
PLUGIN_DIR=$(eval echo $PLUGIN_DIR)
CONFIG_DIR=$(eval echo $CONFIG_DIR)

echo "Installing BDGTrans for GIMP 3.x..."
echo "Plugin directory: $PLUGIN_DIR"

# Create directory if it doesn't exist
mkdir -p "$PLUGIN_DIR"
mkdir -p "$CONFIG_DIR"

# Copy plugin files
cp "$SCRIPT_FU" "$PLUGIN_DIR/"
cp "$PYTHON_FU" "$PLUGIN_DIR/"
cp "$PROMPT_FILE" "$CONFIG_DIR/"

chmod +x "$PLUGIN_DIR/$PYTHON_FU"

echo "BDGTrans installed successfully to: $PLUGIN_DIR"
echo "Please restart GIMP to use the plugin."

# Create default config if it doesn't exist
CONFIG_FILE="$CONFIG_DIR/BTGTrans.json"

if [ ! -f "$CONFIG_FILE" ]; then
    echo "Creating default configuration..."
    cat > "$CONFIG_FILE" << EOF
{
  "server": "http://localhost:11434",
  "model": "llama3"
}
EOF
    echo "Configuration created at: $CONFIG_FILE"
fi

echo ""
echo "To translate text:"
echo "1. Open an image in GIMP"
echo "2. Select a text layer"
echo "3. Go to Filters > BDGTrans > Translate Text..."
echo "4. Select the target language and click OK"
echo ""
echo "To configure the AI server:"
echo "1. Edit $CONFIG_FILE"
echo "2. Or use Filters > BDGTrans > Configure..."
