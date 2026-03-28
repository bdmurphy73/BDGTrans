#!/bin/bash
# BDGTrans Installation Script

PLUGIN_FILE="bdgtrans.py"

# Detect OS and set plugin directory
case "$(uname -s)" in
    Linux*)
        PLUGIN_DIR="$HOME/.config/gimp/2.10/plug-ins"
        ;;
    Darwin*)
        PLUGIN_DIR="$HOME/Library/Application Support/GIMP/2.10/plug-ins"
        ;;
    CYGWIN*|MINGW*|MSYS*)
        PLUGIN_DIR="$APPDATA/.gimp-2.10/plug-ins"
        ;;
    *)
        echo "Unknown operating system"
        exit 1
        ;;
esac

# Create directory if it doesn't exist
mkdir -p "$PLUGIN_DIR"

# Copy plugin
cp "$PLUGIN_FILE" "$PLUGIN_DIR/"
chmod +x "$PLUGIN_DIR/$PLUGIN_FILE"

echo "BDGTrans installed successfully to: $PLUGIN_DIR"
echo "Please restart GIMP to use the plugin."

# Create default config if it doesn't exist
CONFIG_DIR="$(dirname "$PLUGIN_DIR")"
CONFIG_FILE="$CONFIG_DIR/BTGTrans.json"

if [ ! -f "$CONFIG_FILE" ]; then
    echo "Creating default configuration..."
    mkdir -p "$CONFIG_DIR"
    cat > "$CONFIG_FILE" << EOF
{
  "server": "http://localhost:11434",
  "model": "llama3"
}
EOF
    echo "Configuration created at: $CONFIG_FILE"
fi
