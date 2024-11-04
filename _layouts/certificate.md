---
layout: default
---

<div class="certificate-container">
    {% assign card_post = page %}
    {% assign card_is_linkable = false %}
    {% include cards/certificate.html %}
</div>

{{content}}