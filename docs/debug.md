# Common Issues with Fixes

## Improper Rendering

If your top bar is broken or you see any other similar UI issues, try forcing xcb rendering while running the app:

```bash
QT_QPA_PLATFORM=xcb ./Pixelpulse2-test-anylinux-*.AppImage
``` 


Before:

![The app with a broken top bar](assets/brokentopbar.png)

After:

![App respecting OS settings](assets/measuringitself.png)

Now, the app renders correctly and respects OS theming 