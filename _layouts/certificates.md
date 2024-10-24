---
layout: default
---

{{ content }}

<div class="container">
    {%- for post in posts -%}
        <div class="card">
            <p>{{ post.certificate.name }}</p>
        </div>
    {%- endfor -%}
</div>