#!/usr/bin/env bash

# Variables
APPIMAGE_URL="https://github.com/sounddrill31/Pixelpulse2/releases/download/12312028114/Pixelpulse2-1.0-x86_64.AppImage"
PP2_SCRIPT_URL="https://cdn.jsdelivr.net/gh/sounddrill31/Pixelpulse2@gh-pages/pp2.sh" 
UDEV_RULES_URL="https://cdn.jsdelivr.net/gh/sounddrill31/Pixelpulse2@gh-pages/53-adi-m1k-usb.rules"
UDEV_RULES_PATH="/etc/udev/rules.d/53-adi-m1k-usb.rules"
BIN_DIR="$HOME/bin"
APPIMAGE_FILE="Pixelpulse2-1.0-x86_64.AppImage"

# Check for x86_64 architecture
if [[ "$(uname -m)" != "x86_64" ]]; then
    echo "This script can only run on x86_64 systems."
    exit 1
fi

# Function to prompt for user input
prompt() {
    read -p "$1 (yes/no): " response
    echo "$response"
}

# Function to download a file
download_file() {
    local url=$1
    local file_name=$(basename "$url")

    if [[ -f "$file_name" ]]; then
        echo "$file_name already exists."
        if [[ "$(prompt "Do you want to remove it?")" == "yes" ]]; then
            rm -rf "$file_name" && echo "$file_name removed."
        else
            return
        fi
    fi

    if [[ "$(prompt "Do you want to download $file_name from $url?")" == "yes" ]]; then
        wget "$url" && echo "$file_name downloaded successfully." || echo "Failed to download $file_name."
    fi
}

# Function to set up the pp2 command
setup_pp2_command() {
    mkdir -p "$BIN_DIR"
    cp "$APPIMAGE_FILE" $BIN_DIR
    wget "$PP2_SCRIPT_URL" -O "$BIN_DIR/pp2"
    chmod +x "$BIN_DIR/pp2" $APPIMAGE_FILE
    echo "pp2 command set up successfully."
}

# Function to set up udev rules
setup_udev_rules() {
    if [[ -f "$UDEV_RULES_PATH" ]]; then
        echo "Udev rules already exist."
        if [[ "$(prompt "Do you want to reinstall the udev rules?")" == "yes" ]]; then
            rm -f "$UDEV_RULES_PATH"
        else
            return
        fi
    fi

    wget "$UDEV_RULES_URL" -O "$UDEV_RULES_PATH" && echo "Udev rules installed successfully."
    udevadm control --reload-rules && echo "Udev rules reloaded."
}

# Main script execution
if [[ "$1" == "--unattended" || "$1" == "-ci" ]]; then
    unattended=true
else
    unattended=false
fi

download_file "$APPIMAGE_URL"

if $unattended || [[ "$(prompt "Do you want to make it easier to run (setup pp2 command)?")" == "yes" ]]; then
    setup_pp2_command
fi

if $unattended || [[ "$(prompt "Do you want to set up udev rules for easy device detection?")" == "yes" ]]; then
    setup_udev_rules
fi

# Help section
if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    echo "Supported commands:"
    echo "  help        - Show this help message"
    echo "  unattended   - Automatically answer yes to all prompts"
fi