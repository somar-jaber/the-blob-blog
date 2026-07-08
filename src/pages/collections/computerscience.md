---
layout : "base-layout.njk"
title: "ComputerScience"
---
<ul>
    {%- for post in collections["ComputerScience"] -%}
        <li>
            <a href="{{ post.page.url }}">{{ post.data.title }}</a>
        </li>
    {%- endfor -%}
</ul>