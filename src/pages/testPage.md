---
layout: "base-layout.njk"
title: "TestPage"
---


<div class="youtube-video" >
    <img src="/assets/images/building-a-startup-in-your-20s.jpg" />
    
    <div class="text">
        <h4><a style="color: var(--text-color);" href="https://www.youtube.com/watch?v=IGK0wYXebmc">Title</a></h4>
        <p>
            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Consequuntur quaerat velit necessitatibus itaque sed temporibus ullam corrupti, similique minus quia officia modi animi accusamus.
        </p>
    </div>
</div>

<br>
<br>


{% set parameters = {
        "title": "tournament", 
        "link": "https://www.youtube.com/watch?v=IGK0wYXebmc",
        "imageLink" : "/assets/images/videoImage2.jpg" , 
        "text" : "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab omnis et itaque consequatur recusandae temporibus." 
    } 
%}
{% include 'youtube-element.njk' %}


### Pass Parameters To The njk File
let's say you have the `targetPage` which will displays the template 
and you have the `Template1` which is the template.
You write in the `targetPage`

{% raw %}
```cmd
{% set parameters = {"title": "tournament", "imageLink" : "/path/to/image.jpg"} %}
{% include 'youtube-element.njk' %}
```
{% endraw %}

and then access those parameters in the `Template1`:

{% raw %}
```cmd
{{parameters.Parameter_Name}}
```
{% endraw %}


