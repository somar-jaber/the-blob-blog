---
layout : "base-layout.njk"
title: "Tech"
---
<ul>
    {%- for post in collections["Tech"] -%}
        <li>
            <a href="{{ post.page.url }}">{{ post.data.title }}</a>
        </li>
    {%- endfor -%}
</ul>