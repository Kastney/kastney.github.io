---
layout: framework
sidebar: [
  library-category-list,
  google-adsense
]
---

<div class="articles">
  {% if page.banner == nil %}
    {% assign banner = page.title %}
  {% endif %}

  {{ content }}

  {% include views/library.html %}
</div>