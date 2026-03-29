#!/bin/bash
# BDGTrans Installation Script for GIMP 3.x

SCRIPT_FU="BDGTrans.scm"
PYTHON_FU="bdgtrans.py"
PROMPT_FILE="BDGTrans-prompt.txt"

GIMP_VERSION="3.2"

# Detect OS and set plugin/script directory
case "$(uname -s)" in
    Linux*)
        PLUGIN_DIR="$HOME/.config/gimp/$GIMP_VERSION/plug-ins"
        SCRIPT_DIR="$HOME/.config/gimp/$GIMP_VERSION/scripts"
        CONFIG_DIR="$HOME/.config/gimp"
        ;;
    Darwin*)
        PLUGIN_DIR="$HOME/Library/Application Support/GIMP/$GIMP_VERSION/plug-ins"
        SCRIPT_DIR="$HOME/Library/Application Support/GIMP/$GIMP_VERSION/scripts"
        CONFIG_DIR="$HOME/Library/Application Support/GIMP"
        ;;
    CYGWIN*|MINGW*|MSYS*)
        PLUGIN_DIR="$APPDATA/GIMP/$GIMP_VERSION/plug-ins"
        SCRIPT_DIR="$APPDATA/GIMP/$GIMP_VERSION/scripts"
        CONFIG_DIR="$APPDATA/GIMP/$GIMP_VERSION"
        ;;
    *)
        echo "Unknown operating system"
        exit 1
        ;;
esac

echo "Installing BDGTrans for GIMP $GIMP_VERSION..."
echo "Python-Fu plug-ins: $PLUGIN_DIR"
echo "Script-Fu scripts: $SCRIPT_DIR"

# Create directories if they don't exist
mkdir -p "$PLUGIN_DIR"
mkdir -p "$SCRIPT_DIR"
mkdir -p "$CONFIG_DIR"

# Copy Python-Fu plugin
cp "$PYTHON_FU" "$PLUGIN_DIR/"
chmod +x "$PLUGIN_DIR/$PYTHON_FU"

# Copy Script-Fu script and prompt file
cp "$SCRIPT_FU" "$SCRIPT_DIR/"
cp "$PROMPT_FILE" "$SCRIPT_DIR/"

echo "BDGTrans installed successfully!"
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
