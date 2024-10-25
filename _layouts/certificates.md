---
layout: default
---

{{ content }}

<div class="certificate-container unselectable">
    {%- for post in posts -%}
        <div class="certificate-card">
            {%- if post.type -%}
                <div class="certificate-type">
                    {% if post.type == "course" %}
                        <i class="fa-solid fa-graduation-cap"></i>
                        <p>{%- translate certificate.tags.course -%}</p>
                    {% elsif post.type == "project" %}
                        <i class="fa-solid fa-rocket"></i>
                        <p>{%- translate certificate.tags.project -%}</p>
                    {% elsif post.type == "webinar" %}
                        <i class="fa-solid fa-users-viewfinder"></i>
                        <p>{%- translate certificate.tags.webinar -%}</p>
                    {% elsif post.type == "bootcamp" %}
                        <i class="fa-solid fa-users-gear"></i>
                        <p>{%- translate certificate.tags.bootcamp -%}</p>
                    {% endif %}
                </div>
            {%- endif -%}
            <img src="/assets/banner/banner.jpg" />
            <div class="certificate-content">
                <p><strong>{{post.certificate.name}}</strong></p>
                <p>{{post.authority.name}}</p>
                <div>
                    <span>Azure</span>
                </div>
            </div>
        </div>
    {%- endfor -%}
</div>