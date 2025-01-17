---
# https://vitepress.dev/reference/default-theme-home-page
layout: home

hero:
  name: "PixelPulse2 Linux AppImage"
  #text: "(WIP/Untested)"
  tagline: Set up Pixelpulse2 in minutes! No need to fumble with dependencies before class
  actions:
  #  - theme: Installation Guide
  #    text: Markdown Examples
  #    link: /markdown-examples
  #  - theme: alt
  #    text: API Examples
  #    link: /api-examples

features:
  - title: Download For x86_64
    icon: <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#6a5acd"><path d="M480-320 280-520l56-58 104 104v-326h80v326l104-104 56 58-200 200ZM240-160q-33 0-56.5-23.5T160-240v-120h80v120h480v-120h80v120q0 33-23.5 56.5T720-160H240Z"/></svg>
    link: https://github.com/sounddrill31/Pixelpulse2/releases/latest/download/Pixelpulse2-test-anylinux-x86_64.AppImage
  - title: Download For aarch64 (WIP/Untested) 
    icon: <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#6a5acd"><path d="M791-55 686-160H240q-33 0-56.5-23.5T160-240v-120h80v120h366L503-343l-23 23-200-200 23-23L55-791l57-57 736 736-57 57ZM617-457l-57-57 64-64 56 58-63 63Zm-97-97-80-80v-166h80v246Zm280 280-80-80v-6h80v86Z"/></svg>
    link: https://github.com/sounddrill31/Pixelpulse2/releases/latest/download/Pixelpulse2-test-anylinux-aarch64.AppImage
---

> [!WARNING]
> This repository is undergoing significant changes, things may break. This warning will be removed after the build is stable again.


### Pre-Setup Instructions
> [!WARNING]
> This step is important if the Pixelpulse2 app crashes after connecting to your system

> [!IMPORTANT]
> This step needs root access through sudo. If your system uses doas or doesn't have access to sudo, adjust the command to match your needs.

- Install the ADALM1000 udev rule to your system
  - This udev rule will allow the system to access the ADALM1000 Kit when connected 
    ```bash
    echo -e "# allow \"plugdev\" group read/write access to ADALM1000 devices\nSUBSYSTEM==\"usb\", ATTRS{idVendor}==\"064b\", ATTRS{idProduct}==\"784c\", MODE=\"0664\", GROUP=\"plugdev\", TAG+=\"uaccess\"\n# allow \"plugdev\" group read/write access to ADALM1000 devices in SAM-BA mode\nSUBSYSTEM==\"usb\", ATTRS{idVendor}==\"03eb\", ATTRS{idProduct}==\"6124\", MODE=\"0664\", GROUP=\"plugdev\", TAG+=\"uaccess\"" | sudo tee /etc/udev/rules.d/53-adi-m1k-usb.rules
    ```
-   Reload udev rules to ensure the change takes place
    ```bash
    sudo udevadm control --reload-rules
    ```
- To verify that it worked, run
    ```bash
    cat /etc/udev/rules.d/53-adi-m1k-usb.rules
    ```
  - This should output the contents of the file we just wrote to
  - Expected output:
    ```bash
    # allow "plugdev" group read/write access to ADALM1000 devices
    SUBSYSTEM=="usb", ATTRS{idVendor}=="064b", ATTRS{idProduct}=="784c", MODE="0664", GROUP="plugdev", TAG+="uaccess"
    # allow "plugdev" group read/write access to ADALM1000 devices in SAM-BA mode
    SUBSYSTEM=="usb", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="6124", MODE="0664", GROUP="plugdev", TAG+="uaccess"
    ```

### Setup Instructions
- Remove Previous versions of the AppImage(Optional, replace with correct path as needed)
  ```bash
  rm Downloads/Pixelpulse2*.AppImage
  ```
- Download the version compatible with your system from above
- Go to the folder you saved it to(replace with correct path)
  ```bash
  cd Downloads
  ```
- Give it executable permissions
  ```bash
  chmod +x Pixelpulse2*.AppImage
  ```
- Run the AppImage
  ```bash
  ./Pixelpulse2*.AppImage
  ```

> [!TIP]
> To Install it systemwide, [install a tool called soar](https://soar.qaidvoid.dev/installation) and run `soar install path/to/Pixelpulse2*.AppImage`

### Known Issues:
1. The app is known to crash after being open for some time
  - This can be replicated on some distros by connecting a device and letting it run for a while
    - This happens on:
      - OpenSUSE Tumbleweed(Jan 2025, x86_64 build)
      - Fedora(Testimony by @vishal-ahirwar [(issues/266)](https://github.com/analogdevicesinc/Pixelpulse2/issues/266#issuecomment-2563701732))
      
  - This is likely not an issue caused by my packaging
  - There is an issue opened upstream [(issues/266)](https://github.com/analogdevicesinc/Pixelpulse2/issues/266) that tracks this problem

### Notes:
Tested on:
- OpenSUSE tumbleweed on Jan 2025(x86_64 build)
