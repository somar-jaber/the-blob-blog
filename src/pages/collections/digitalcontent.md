---
layout : "base-layout.njk"
title: "DigitalContent"
---
<ul>
    {%- for post in collections["DigitalContent"] -%}
        <li>
            <a href="{{ post.page.url }}">{{ post.data.title }}</a>
        </li>
    {%- endfor -%}
</ul>