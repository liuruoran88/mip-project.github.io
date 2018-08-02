{{ target: markdown-paginator }}
<div class="markdown-paginator">

  <div class="markdown-paginator-item" data-type="mip" href="${last.url}">
    {{ if: ${last} != null }}
    <p class="label">上一页</p>
    <p class="title">${last.name}</p>
    {{ /if }}
  </div>
  <a class="markdown-paginator-item" data-type="mip" href="${next.url}">
    {{ if: ${next} != null }}
    <p class="label">下一页</p>
    <p class="title">${next.name}</p>
    {{ /if }}
  </a>
</div>
