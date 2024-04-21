---
layout: home
title: Início
permalink: /
---

{%- assign name = 'lang' -%}
{%- include functions.html func='get_value' default='en' -%}
{%- assign lang = return -%}

{% if lang == 'pt' %}

# 🚧 Em contrução ...

{% else %}

# 🚧 In construction ...

{% endif %}