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
      { text: 'Screenshots', link: '/screenshots' },
      { text: 'Quick Fixes', link: '/debug' },
      { text: 'Other Builds', link: 'https://m1k-builds.pages.dev' }
      //{ text: 'Examples', link: '/markdown-examples' }
    ],
    cleanUrls: "true",
    search: {
      provider: 'local'
    },

    sidebar: [
      {
        text: 'Site Navigation',
        items: [
          { text: 'Home', link: '/' },
          { text: 'App Screenshots', link: '/screenshots' },
          { text: 'Quick Fixes', link: '/debug' }
        ]
      }
    ],

    socialLinks: [
      { icon: 'github', link: 'https://github.com/sounddrill31/Pixelpulse2' },
    ]
  }
})
