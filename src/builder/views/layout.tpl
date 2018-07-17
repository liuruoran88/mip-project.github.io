{{ target: layout }}
<!DOCTYPE html>
<html mip>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,minimum-scale=1,initial-scale=1">
    <title>MIP page</title>
    <link rel="canonical" href="对应的原页面地址">
    <!-- <link rel="stylesheet" type="text/css" href="https://c.mipcdn.com/static/v1/mip.css"> -->
    <!-- <link rel="stylesheet" href="https://bos.nj.bpc.baidu.com/assets/mip/projects/mip.css"> -->
    <link rel="stylesheet" href="http://127.0.0.1:8080/dist/mip.css">
    <style mip-custom>
      ${css|raw}
    </style>
  </head>
  <body>
    {{ block: content }}{{ /block }}
    <mip-shell on="ready:MIP.setData({ready:m.ready+1})">
      <script type="application/json">
        {
          "routes": [
            {
              "pattern": "*",
              "meta": {
                 "header": {
                  "show": false
                }
              }
            }
          ]
        }
      </script>
      <mip-fixed type="top" class="layout-navbar-fixed" mip-shell>
        {{ use:layout-navbar(navbar = ${navbar}) }}
      </mip-fixed>
      <mip-fixed type="left" top="50px" class="layout-sidebar" mip-shell>
        <mip-sidenav m-bind:menu="menu" m-bind:chapters="chapters" m-bind:url="url">
        </mip-sidenav>
      </mip-fixed>
      <mip-data mip-shell>
        <script type="application/json">
          {
            "ready": 0,
            "menu": [{
              "name": "基础教程",
              "path": "docs",
              "children": [{
                "name": "简介",
                "path": "docs/announcement.md",
                "url": "/docs/announcement.html"
              }, {
                "name": "2.0 新增功能",
                "path": "docs/demo.md",
                "url": "/docs/demo.html"
              }, {
                "name": "安装",
                "path": "lavas/v2/basic/install.md",
                "url": "/guide/v2/basic/install"
              }, {
                "name": "基本功能",
                "path": "lavas/v2/basic/init.md",
                "url": "/guide/v2/basic/init"
              }, {
                "name": "Lavas 命令介绍",
                "path": "lavas/v2/basic/cli.md",
                "url": "/guide/v2/basic/cli"
              }]
            }, {
              "name": "进阶教程",
              "path": "lavas/v2/advanced",
              "children": [{
                "name": "构建配置",
                "path": "lavas/v2/advanced/build-config.md",
                "url": "/guide/v2/advanced/build-config"
              }, {
                "name": "错误处理",
                "path": "lavas/v2/advanced/error-handler.md",
                "url": "/guide/v2/advanced/error-handler"
              }, {
                "name": "core 目录",
                "path": "lavas/v2/advanced/core.md",
                "url": "/guide/v2/advanced/core"
              }, {
                "name": "中间件",
                "path": "lavas/v2/advanced/middleware.md",
                "url": "/guide/v2/advanced/middleware"
              }, {
                "name": "路由配置项",
                "path": "lavas/v2/advanced/router.md",
                "url": "/guide/v2/advanced/router"
              }, {
                "name": "Vuex 状态树",
                "path": "lavas/v2/advanced/store.md",
                "url": "/guide/v2/advanced/store"
              }, {
                "name": "Service Worker",
                "path": "lavas/v2/advanced/service-worker.md",
                "url": "/guide/v2/advanced/service-worker"
              }, {
                "name": "Skeleton 和 App Shell 模型",
                "path": "lavas/v2/advanced/appshell.md",
                "url": "/guide/v2/advanced/appshell"
              }, {
                "name": "多个 Lavas 项目整合",
                "path": "lavas/v2/advanced/multi-lavas.md",
                "url": "/guide/v2/advanced/multi-lavas"
              }, {
                "name": "以编程方式使用 Lavas",
                "path": "lavas/v2/advanced/core-api.md",
                "url": "/guide/v2/advanced/core-api"
              }]
            }, {
              "name": "webpack 相关",
              "path": "lavas/v2/webpack",
              "children": [{
                "name": "sw-register-webpack-plugin 插件",
                "path": "lavas/v2/webpack/sw-register-webpack-plugin.md",
                "url": "/guide/v2/webpack/sw-register-webpack-plugin"
              }, {
                "name": "vue-skeleton-webpack-plugin 介绍",
                "path": "lavas/v2/webpack/vue-skeleton-webpack-plugin.md",
                "url": "/guide/v2/webpack/vue-skeleton-webpack-plugin"
              }]
            }, {
              "name": "更多",
              "path": "lavas/v2/more",
              "children": [{
                "name": "检验 PWA 站点",
                "path": "lavas/v2/more/check-your-pwa-website.md",
                "url": "/guide/v2/more/check-your-pwa-website"
              }, {
                "name": "最佳实践建议",
                "path": "lavas/v2/more/good-parts.md",
                "url": "/guide/v2/more/good-parts"
              }]
            }],
            "level": 0,
            "chapters": [
              {
              "level": 1,
              "hash": "#路由配置项",
              "text": "路由配置项",
              "children": [{
                "level": 2,
                "hash": "#路由模式和基准路由",
                "text": "路由模式和基准路由"
              },
              {
                "level": 2,
                "hash": "#页面切换动画",
                "text": "页面切换动画",
                "children": [{
                  "level": 3,
                  "hash": "#渐隐渐现",
                  "text": "渐隐渐现"
                }, {
                  "level": 3,
                  "hash": "#左右滑动",
                  "text": "左右滑动"
                }, {
                  "level": 3,
                  "hash": "#自定义动画",
                  "text": "自定义动画"
                }]
              }, {
                "level": 2,
                "hash": "#重写路由对象",
                "text": "重写路由对象",
                "children": [{
                  "level": 3,
                  "hash": "#使用-rewrite-修改路由路径",
                  "text": "使用 rewrite 修改路由路径",
                  "children": [{
                    "level": 4,
                    "hash": "#注意事项",
                    "text": "注意事项"
                  }]
                }, {
                  "level": 3,
                  "hash": "#使用-routes-修改路由对象",
                  "text": "使用 routes 修改路由对象"
                }]
              }]
            }],
            url: "/guide/v2/basic/introduction"
          }
        </script>
      </mip-data>
      <mip-script mip-shell>
        MIP.watch('url', function (val) {
          console.log(val)
        })

        MIP.setData({
          url: location.pathname
        })
      </mip-script>
    </mip-shell>
    <script src="http://127.0.0.1:8080/dist/mip.js"></script>
    <!-- <script src="https://c.mipcdn.com/static/v1/mip.js"></script> -->
    <!-- <script src="https://bos.nj.bpc.baidu.com/assets/mip/projects/mip.js"></script> -->
    <script src="http://127.0.0.1:8111/mip-sidenav/mip-sidenav.js"></script>
    <script src="https://c.mipcdn.com/static/v1/mip-fixed/mip-fixed.js"></script>
    <script src="https://c.mipcdn.com/static/v1/mip-nav-slidedown/mip-nav-slidedown.js"></script>
    <script src="https://c.mipcdn.com/static/v2/mip-script/mip-script.js"></script>
  </body>
</html>
