<!-- ---
layout : "base-layout.njk"
title: "PC Games"
tags: ["DigitalContent"]
---

We have a very specific taste in games. We are from the 2000s gamers generation, where the gaming industry was at its peak. So every game you will see its name here is a game deserve to be played or searched about at least. 

**The Index**

<style>
</style>

<ul>
    {%- for game in pcGames.items -%}
    <div class="game-card">
        <img src="{{ game.image }}" />
        {% if game.link and game.link.length > 0 %}
            <a href="{{ game.url }}" target="_blank">{{ game.name }}</a>
        {% else %}
            <b>{{ game.name }}</b> 
        {%- endif -%}
        <br>

        {%- for tag in game.tags -%}
        <a>{{ tag }}</a> &nbsp;
        {%- endfor -%}
    </div>
    {%- endfor -%}
</ul> -->


---
layout: "base-layout.njk"
title: "PC Games"
tags: ["DigitalContent"]
---

<div id="filter-container">
  <!-- Tag filter buttons -->
  <div id="tag-filters">
    <button class="filter-btn active" data-tag="all">All Games</button>

    <!-- Looping on all tags in the games and making the All tags array -->
    {% set allTags = [] %}
    {% for game in pcGames.items %}
      {% for tag in game.tags %}
        {% if tag not in allTags %}
          {% set allTags = allTags.concat([tag]) %} // concat() merges an array into another
        {% endif %}
      {% endfor %}
    {% endfor %}
    
    {% for tag in allTags %}
      <button class="filter-btn" data-tag="{{ tag }}">{{ tag }}</button>
    {% endfor %}
  </div>

  <!-- Game cards -->
  <ul id="game-list">
    {% for game in pcGames.items %}
    <div class="game-card" data-tags="{{ game.tags | join(',') }}">
      <img src="{{ game.image }}" />
      {% if game.link and game.link.length > 0 %}
        <a href="{{ game.url }}" target="_blank">{{ game.name }}</a>
      {% else %}
        <b>{{ game.name }}</b> 
      {% endif %}

      <br>

      {% for tag in game.tags %}
        <span class="game-tag">{{ tag }}</span> &nbsp;
      {% endfor %}
    </div>
    {% endfor %}
  </ul>
</div>


<style>
    .game-card { display: inline-block; margin: 10px; padding: 10px; border: 1px solid #ccc; }
    .hidden { display: none; }
    .filter-btn { margin: 5px; padding: 8px 16px; cursor: pointer; }
    .filter-btn.active { background: #007bff; color: white; }
</style>


<script>
document.addEventListener('DOMContentLoaded', function() {
  const filterButtons = document.querySelectorAll('.filter-btn');
  const gameCards = document.querySelectorAll('.game-card');
  
  filterButtons.forEach(button => {
    button.addEventListener('click', function() {
      // Update active button
      filterButtons.forEach(btn => btn.classList.remove('active'));
      this.classList.add('active');
      
      const selectedTag = this.dataset.tag;
      
      gameCards.forEach(card => {
        if (selectedTag === 'all') {
          card.classList.remove('hidden');
        } else {
          const tags = card.dataset.tags.split(',');
          if (tags.includes(selectedTag)) {
            card.classList.remove('hidden');
          } else {
            card.classList.add('hidden');
          }
        }
      });
    });
  });
});
</script>