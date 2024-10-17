---
layout: certificates
posters: certificates
title: page.certificates.title
title_header: page.certificates.title
subtitle: page.certificates.subtitle
permalink: "/certificados/"
permalink_us: "/certificates/"
menu_enabled: true
per_page: 3
banner:
    title: page.certificates.banner.title
    image: "/assets/banner/banner.jpg"
---

<div>
    {%- for post in posters -%}
        <div>
            <p>{{ post.name }}</p>
        </div>
    {%- endfor -%}
</div>