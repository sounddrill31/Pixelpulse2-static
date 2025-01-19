import { defineConfig } from 'vitepress'

// https://vitepress.dev/reference/site-config
export default defineConfig({
  base: '/Pixelpulse2',
  title: "PixelPulse2 AppImage",
  description: "A downloadable file for PixelPulse2 that is easy to run on Linux",
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    nav: [
      { text: 'Home', link: '/' },
      //{ text: 'Examples', link: '/markdown-examples' }
    ],
    cleanUrls: "true",

    sidebar: [
      {
        text: 'Site Navigation',
        items: [
          { text: 'Home', link: '/' },
          { text: 'See App Screenshots', link: '/screenshots' },
          { text: 'Debug Issues', link: '/debug' }
        ]
      }
    ],

    socialLinks: [
      { icon: 'github', link: 'https://github.com/sounddrill31/Pixelpulse2' },
    ]
  }
})
