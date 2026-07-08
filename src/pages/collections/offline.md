---
layout : "base-layout.njk"
title: "Offline"
---
<ul>
    {%- for post in collections["Offline"] -%}
        <li>
            <a href="{{ post.page.url }}">{{ post.data.title }}</a>
        </li>
    {%- endfor -%}
</ul>