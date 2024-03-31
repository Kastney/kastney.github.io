---
layout: framework
banner:
banner_html: post-header.html
hidden: []
sidebar: [
  paper-menu,
  google-adsense
]
---

<div class="post">
  <section>
    {%- assign name = 'banner' -%}
    {%- include functions.html func='get_value' -%}
    {%- assign banner = return -%}

    {%- assign name = 'hidden' -%}
    {%- include functions.html func='get_value' -%}
    {%- assign hidden = return -%}

    {%- assign result = hidden | where_exp: "item", "item == 'header'" -%}
    {%- if banner == nil and result.size == 0 -%}
    {%- include views/post-header.html -%}
    {%- endif -%}

    <!-- Conteúdo do Artigo -->
    {%- include views/paper.html -%}
    
    <!-- Próximo e Anterior Artigo -->
    {%- assign result = hidden | where_exp: "item", "item == 'navigator'" -%}
    {%- if result.size == 0 -%}
    <div class="post-nav">    
      <!-- Artigo Anterior -->
      {%- if page.previous -%}
        <a class="previous" href="{{ page.previous.url | relative_url }}" title="{{page.previous.title | escape }}{%- if page.previous.subtitle != null -%}: {{ page.previous.subtitle | escape}}{%- endif -%}">
          {{ page.previous.title | escape | truncatewords: 4 }}
          {%- if page.previous.subtitle != null -%}
          : {{ page.previous.subtitle | escape | truncatewords: 4 }}
          {%- endif -%}
        </a>
      {%- else -%}
        <span></span>
      {%- endif -%}
      <!-- Próximo Artigo -->
      {%- if page.next -%}
        <a class="next" href="{{ page.next.url | relative_url }}" title="{{ page.next.title | escape }}{%- if page.next.subtitle != null -%}: {{ page.next.subtitle | escape}}{%- endif -%}">
          {{ page.next.title | escape | truncatewords: 4 }}
          {%- if page.next.subtitle != null -%}
          : {{ page.next.subtitle | escape | truncatewords: 4 }}
          {%- endif -%}
        </a>
      {%- else -%}
        <span></span>
      {%- endif -%}
    </div>
    {%- endif -%}

    <!-- Artigos Relacionados -->
    {%- assign result = hidden | where_exp: "item", "item == 'related_posts'" -%}
    {%- if result.size == 0 -%}
    <div class="post-related">      
      {% if lang == 'pt' %}
        <div>Artigos Relacionados</div>
      {% else %}
        <div>Related Articles</div>
      {% endif %}
      <ul>
        {% assign posts = site[page.collection] | sample:4 %}
        {%- for post in posts -%}
        <li><a class="post-link" href="{{post.url | relative_url}}" title="{{ page.next.title | escape }}">
          {{ post.title | escape | truncatewords: 12 }}
          {%- if post.subtitle != null -%}
          : {{ post.subtitle | escape | truncatewords: 12 }}
          {%- endif -%}
        </a></li>
        {%- endfor -%}
      </ul>
    </div>
    {%- endif -%}

    <!-- Comentários -->
    {%- assign result = hidden | where_exp: "item", "item == 'comments'" -%}
    {%- if result.size == 0 -%}
    <div class="post-comments">
      {%- if page.comments != false -%}
        {%- if site.disqus.shortname -%}
          {%- include extensions/comments/disqus.html -%}
        {%- endif -%}

        {%- if site.gitment.username -%}
          {%- include extensions/comments/gitment.html -%}
        {%- endif -%}

        {%- if site.utterances.repo -%}
          {%- include extensions/comments/utterances.html -%}
        {%- endif -%}
      {%- endif -%}
    </div>
    {%- endif -%}
  </section>
</div>