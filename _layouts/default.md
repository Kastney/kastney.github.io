---
layout: compress
---

<!DOCTYPE html>
<html lang="{{ page.lang | default: site.lang }}">
  {%- include head.html -%}
  <body>
    {%- include views/header.html -%}
    {%- include views/banner.html -%}
    {{ content }}
  </body>
</html>