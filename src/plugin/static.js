/**
 * @file static.js
 * @author clark-t (clarktanglei@163.com)
 */

const fs = require('fs-extra')
const path = require('path')
const renderer = require('../utils/renderer')

const css = fs.readFileSync(path.resolve(__dirname, '../builder/dist/index.css'))

/* eslint-disable */
const navbar = [
  {
    "name": "首页",
    "url": "/index.html",
    "width": 32
  },
  {
    "name": "学习",
    "width": 32,
    "children": [
      {
        "name": "使用文档",
        "url": "/guide/index.html",
        "width": 64
      },
      {
        "name": "组件列表",
        "url": "/components/index.html",
        "width": 64
      },
      {
        "name": "API",
        "url": "/api/index.html"
      },
      {
        "name": "Codelab",
        "url": "/codelabs/index.html",
        "width": 60
      }
    ]
  },
  {
    "name": "帮助",
    "url": "/help",
    "width": 32
  },
  {
    "name": "常用链接",
    "children": [
      {
        "name": "MIP 官方博客",
        "url": "http://www.cnblogs.com/mipengine"
      },
      {
        "name": "MIP-CLI 本地开发工具",
        "url": "https://github.com/mipengine/mip2/tree/master/packages/mip-cli"
      },
      {
        "name": "MIP 代码校验工具",
        "url": "https://www.mipengine.org/validator/validate"
      },
      {
        "name": "MIP 效果预览工具",
        "url": "https://www.mipengine.org/validator/preview"
      },
      {
        "name": "MIP PATH 转换工具",
        "url": "https://www.mipengine.org/mippath.html"
      }
    ],
    "width": 82
  },
  {
    "name": "GitHub",
    "url": "https://github.com/mipengine/mip2",
    "width": 50
  }
]

/* eslint-enable */

module.exports = class Static {
  apply (on, app) {
    let cachedChangedFileList = []
    let dist = path.resolve(process.cwd())

    on(app.STAGES.CREATE_DOC_STORE_OBJECT, obj => {
      cachedChangedFileList.push(obj)
    }, 10150)

    on(app.STAGES.DONE, async () => {
      await Promise.all(cachedChangedFileList.map(async obj => {
        let pathname = path.resolve(dist, obj.url.replace(/^\//, '').replace(/\.html$/, '') + '.html')
        await fs.ensureDir(path.dirname(pathname))
        await fs.writeFile(pathname, obj.html, 'utf-8')
        if (obj.isFirst) {
          let url = obj.url.replace(/^\//, '').split('/').slice(0, 1).join('/') + '/index.html'
          let indexpath = path.resolve(dist, url)
          let info = await app.getDocByUrl('/' + url)
          if (!info) {
            await fs.writeFile(indexpath, obj.html, 'utf-8')
          } else {
            await fs.writeFile(indexpath, info.html, 'utf-8')
          }
        }
      }))

      let menuInfo = await app.getMenuByUrl('/codelabs')

      // 静态化首页
      let html = renderer.render('layout-index', {
        title: 'MIP官网_移动网页加速器_MIP(Mobile Instant Pages)',
        description: 'MIP（Mobile Instant Pages - 移动网页加速器）是一套应用于移动网页的开放性技术标准，使用 MIP无需等待加载，页面内容将以更友好的方式瞬时到达用户。',
        keywords: 'MIP2',
        originUrl: '',
        host: 'https://mip-project.github.io',
        navbar: navbar,
        css: css,
        menu: {},
        chapters: {},
        url: '',
        navIndex: 0,
        development: process.env.NODE_ENV === 'development'
      })

      // codelab 首页
      let htmlCodelab = renderer.render('layout-codelab', {
        title: 'MIP 文档_移动网页加速器_MIP(Mobile Instant Pages) | CODELAB',
        description: '我们在 Codelab 中提供了一系列基于 MIP 的编程小项目，内容包括项目起步、配置教学、功能实现等等',
        keywords: 'Codelab',
        originUrl: '',
        host: 'https://mip-project.github.io',
        navbar: navbar,
        css: css,
        menu: menuInfo,
        chapters: {},
        url: '/codelabs/index.html',
        navIndex: 3,
        development: process.env.NODE_ENV === 'development'
      })

      await fs.writeFile(path.resolve(dist, 'index.html'), html, 'utf-8')
      await fs.writeFile(path.resolve(dist, 'codelabs/index.html'), htmlCodelab, 'utf-8')
    }, 999999)
  }
}
