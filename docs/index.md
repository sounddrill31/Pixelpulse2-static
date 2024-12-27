---
# https://vitepress.dev/reference/default-theme-home-page
layout: home

hero:
  name: "PixelPulse2 Linux AppImage"
  text: "(WIP/Untested)"
  tagline: PixelPulse2 AppImage Download
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
    link: https://github.com/sounddrill31/Pixelpulse2/releases/latest/download/Pixelpulse2-1.0-x86_64.AppImage
  - title: Download For aarch64 (Planned) 
    icon: <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#6a5acd"><path d="M791-55 686-160H240q-33 0-56.5-23.5T160-240v-120h80v120h366L503-343l-23 23-200-200 23-23L55-791l57-57 736 736-57 57ZM617-457l-57-57 64-64 56 58-63 63Zm-97-97-80-80v-166h80v246Zm280 280-80-80v-6h80v86Z"/></svg>
  #  link: https://github.com/sounddrill31/Pixelpulse2/releases/latest/download/Pixelpulse2-1.0-arm64.AppImage
---

### Instructions
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
