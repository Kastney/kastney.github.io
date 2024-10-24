---
layout: compress
---

<!DOCTYPE html>
<html lang="{% translate core.lang %}">
  {%- include head.html -%}
  <body>
    {%- include views/header.html -%}
    <main>
      {%- include views/banner.html -%}
      {%- include views/click_to_top.html -%}
      <section class="content">
        {{ content }}
      </section>
    </main>
    {%- include views/footer.html -%}
    <script >
      {%- include scripts/core.js -%}
      {%- include scripts/scroll-status.js -%}
      {%- include scripts/click-to-top.js -%}
      {%- include scripts/click-to-more.js -%}
      {%- include scripts/contextmenu-disabled.js -%}
      {%- include scripts/dropdown.js -%}
    </script>
  </body>
</html>