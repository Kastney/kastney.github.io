---
layout: default
---

{{content}}

<h2>{%- translate page.certificates.section_certificates -%}</h2>

<div class="certificate-container">
    {%- for post in posts -%}
        <div class="certificate-card">
            <!-- Tipo do certificado -->
            {%- if post.type -%}
                <div class="certificate-type">
                    {% if post.type == "course" %}
                        <i class="fa-solid fa-graduation-cap"></i>
                        <span>
                            {%- translate certificate.tags.course -%}
                            {%- if post.certificate.workload %} • {{post.certificate.workload | extract_hours}}h{%- endif -%}
                        </span>
                    {% elsif post.type == "project" %}
                        <i class="fa-solid fa-rocket"></i>
                        <span>
                            {%- translate certificate.tags.project -%}
                            {%- if post.certificate.workload %} • {{post.certificate.workload | extract_hours}}h{%- endif -%}
                        </span>
                    {% elsif post.type == "webinar" %}
                        <i class="fa-solid fa-users-viewfinder"></i>
                        <span>
                            {%- translate certificate.tags.webinar -%}
                            {%- if post.certificate.workload %} • {{post.certificate.workload | extract_hours}}h{%- endif -%}
                        </span>
                    {% elsif post.type == "bootcamp" %}
                        <i class="fa-solid fa-users-gear"></i>
                        <span>
                            {%- translate certificate.tags.bootcamp -%}
                            {%- if post.certificate.workload %} • {{post.certificate.workload | extract_hours}}h{%- endif -%}
                        </span>
                    {% endif %}
                </div>
            {%- endif -%}
            <!-- Imagem ilustrativa do certificado -->
            <img class="thumbnail" src="/assets/images/certificates/{{post.code}}/thumb.jpeg" />
            <!-- Conteúdos do certificado -->
            <div class="certificate-content">
                <!-- Competências do certificado -->
                {%- if post.competencies -%}
                    <div class="certificate-competencies">
                        {%- for item in post.competencies -%}
                            {%- if forloop.index <= 4 -%}
                                {%- assign competence = site.data.competencies[item] -%}
                                {%- if competence -%}
                                    <img src="{{competence.logo}}" style="background-color:{{competence.color}}" />
                                {%- endif -%}
                            {%- endif -%}
                        {%- endfor -%}
                    </div>
                {% endif- -%}
                <!-- Área para o conteúdo principal do certificado -->
                <div class="certificate-area">
                    <!-- Empresa emissora do certificado -->
                    {%- assign authority = site.data.authority[post.authority] -%}
                    {%- if authority -%}
                        <div class="certificate-authority">
                            <img src="{{authority.logo}}" />
                            <span>{{authority.name}}</span>
                        </div>
                    {%- endif -%}
                    <!-- Nome do certificado -->
                    <p><strong>{{post.certificate.name}}</strong></p>
                    <!-- Data de emissão do certificado -->
                    <span>{{post.date | localized_date: site.translations[site.lang].core.lang}}</span>
                </div>
            </div>
        </div>
    {%- endfor -%}
</div>