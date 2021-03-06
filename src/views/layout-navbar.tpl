{{ target: layout-navbar }}
<mip-fixed type="top" class="layout-navbar-fixed">
  <div class="layout-navbar">
    <a data-type="mip" href="/"><div class="navbar-logo"></div></a>
    <div class="navbar-menu">
      <ul class="navbar-menu-wrapper">
      {{ for: ${navbar} as ${item}, ${index} }}
        {{ if: ${item.children} }}
        <li class="navbar-item">
          <span class="menu-name">${item.name}<i class="arrow"></i></span>
          <ul class="navbar-sub-menu">
            {{ for: ${item.children} as ${subItem} }}
            <li class="navbar-sub-item"><a data-type="mip" href="${subItem.url}">${subItem.name}</a></li>
            {{ /for }}
          </ul>
        </li>
        {{ else }}
        <li class="navbar-item"><a data-type="mip" href="${item.url}" class="menu-name">${item.name}</a></li>
        {{ /if }}
      {{ /for }}
      </ul>
      <div class="navbar-indicator" m-bind:style="navbarStyle"></div>
    </div>
    <div class="navbar-toggle" on="tap:nav-sidebar.open"><i class="iconfont icon-bars"></i></div>
  </div>
</mip-fixed>
