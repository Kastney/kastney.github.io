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
        {%- include views/profile-header.html -%}
        {%- endif -%}

        <div class="post-content">
        {{ content }}
        </div>
    </section>
</div>