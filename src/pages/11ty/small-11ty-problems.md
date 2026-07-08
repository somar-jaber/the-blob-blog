---
layout: "base-layout.njk"
title: "Small 11ty problems"
tags: ["ComputerScience"]
---

## Problem Number 1
if you see an extra empty `<p></p>` tags in your code that usually coming from the white spaces , to 
get ride of them and if you are using Nunjucks you need to do this :
{% raw %}
replace `{% %}` by `{%- -%}` . 
and for variables replace the `{{ }}` by `{{- -}}` .
{% endraw %}
