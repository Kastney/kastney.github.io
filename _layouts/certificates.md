---
layout: default
---

{{ content }}

<div class="certificate-container unselectable">
    {%- for post in posts -%}
        <div class="certificate-card">
            {%- if post.type -%}
                {% if post.type == "course" %}
                    <div class="certificate-type">
                        <i class="fa-solid fa-graduation-cap"></i>
                        <p>{%- translate certificate.tag.course -%}</p>
                    </div>                    
                {% elsif post.type == "pendente" %}
                {% elsif post.type == "rejeitado" %}                    
                {% else %}
                    <p class="certificate-type">{{post.type}}</p>
                {% endif %}
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