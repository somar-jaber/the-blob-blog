---
layout : "base-layout.njk"
title: "ComputerScience"
---

<link rel="stylesheet" href="/css/external-links.css">

<ul>
    {%- for post in collections["ComputerScience"] -%}
    <li>
        <a href="{{ post.page.url }}">{{ post.data.title }}</a>
    </li>
    {%- endfor -%}
</ul>


{%- set tag = "ComputerScience" -%}

<ul>
    {%- for link in externalLinks.items -%}
    {%- if tag in link.tags -%}
    <li>
        <a href="{{ link.url }}" target="_blank">{{ link.title }}</a>
    </li>
    {%- endif -%}
    {%- endfor -%}
</ul>