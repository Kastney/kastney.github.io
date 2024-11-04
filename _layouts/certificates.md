---
layout: default
---

{{content}}

<h2>{%- translate page.certificates.section_certificates -%}</h2>

<div class="certificate-container">
    {%- for post in posts -%}
        {% assign card_post = post %}
        {% include cards/certificate.html %}
    {%- endfor -%}
</div>