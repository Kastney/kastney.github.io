---
layout: compress
---

<!DOCTYPE html>
<html lang="{{ page.lang | default: site.lang }}">
  {%- include head.html -%}
  <body>
    {%- include views/header.html -%}
    {%- include views/banner.html -%}
    {%- include views/click_to_top.html -%}
    <section>
    {{ content }}
    </section>
    <script >
    {%- include scripts/scroll-status.js -%}
    {%- include scripts/click-to-top.js -%}
    {%- include scripts/contextmenu-disabled.js -%}
    </script>
  </body>
</html>