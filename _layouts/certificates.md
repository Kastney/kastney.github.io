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
                        <span>{%- translate certificate.tags.course -%}</span>
                    {% elsif post.type == "project" %}
                        <i class="fa-solid fa-rocket"></i>
                        <span>{%- translate certificate.tags.project -%}</span>
                    {% elsif post.type == "webinar" %}
                        <i class="fa-solid fa-users-viewfinder"></i>
                        <span>{%- translate certificate.tags.webinar -%}</span>
                    {% elsif post.type == "bootcamp" %}
                        <i class="fa-solid fa-users-gear"></i>
                        <span>{%- translate certificate.tags.bootcamp -%}</span>
                    {% endif %}
                </div>
            {%- endif -%}
            <img class="thumbnail" src="/assets/banner/banner.jpg" />
            <div class="certificate-content">
                {%- assign business = site.data.business[post.authority] -%}
                {%- if business -%}
                    <div class="authority">
                        <img src="{{business.logo}}" />
                        <span>{{business.name}}</span>
                    </div>
                {%- endif -%}
                <p><strong>{{post.certificate.name}}</strong></p>
                <span>{{post.date | localized_date: site.translations[site.lang].core.lang}}</span>
            </div>
        </div>
    {%- endfor -%}
</div>