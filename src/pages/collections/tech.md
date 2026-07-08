---
layout : "base-layout.njk"
title: "Tech"
---
<link rel="stylesheet" href="/css/external-links.css">


<ul>
    {%- for post in collections["Tech"] -%}
        <li>
            <a href="{{ post.page.url }}">{{ post.data.title }}</a>
        </li>
    {%- endfor -%}
</ul>


{% set tag = "Tech" %} 

<ul>
  {%- for link in externalLinks.items -%}
    {%- if tag in link.tags -%}
      <li>
        <a href="{{ link.url }}" target="_blank" rel="noopener noreferrer">
          {{ link.title }}
        </a>
        <!-- <span class="tags">{{ link.tags | join(", ") }}</span> -->
      </li>
    {%- endif -%}
  {%- endfor -%}
</ul>