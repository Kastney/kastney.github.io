---
layout: default
---

{{ content }}

<div class="certificate-container unselectable">
    {%- for post in posts -%}
        <div class="certificate-card">
            <p class="certificate-type">Curso</p>
            <img src="/assets/banner/banner.jpg" />
        </div>
    {%- endfor -%}
</div>