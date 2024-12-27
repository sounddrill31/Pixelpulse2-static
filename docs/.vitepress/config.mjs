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

   /* sidebar: [
      {
        text: 'Examples',
        items: [
          { text: 'Markdown Examples', link: '/markdown-examples' },
          { text: 'Runtime API Examples', link: '/api-examples' }
        ]
      }
    ],*/

    socialLinks: [
      { icon: 'github', link: 'https://github.com/sounddrill31/Pixelpulse2' },
    ]
  }
})
