---
layout: compress
---

<!DOCTYPE html>
<html lang="{% translate core.full-lang %}">
  {%- include head.html -%}
  <body>
    {%- include views/header.html -%}
    {%- include views/banner.html -%}
    {%- include views/click_to_top.html -%}
    <section>
    {{ content }}
    </section>
    <script >
    {%- include scripts/core.js -%}
    {%- include scripts/scroll-status.js -%}
    {%- include scripts/click-to-top.js -%}
    {%- include scripts/click-to-more.js -%}
    {%- include scripts/contextmenu-disabled.js -%}
    </script>
  </body>
</html>