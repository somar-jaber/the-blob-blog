---
layout: "base-layout.njk"
title: "PC Games"
tags: ["DigitalContent"]
---
<style>
    .game-card { display: block; padding: 10px; /*border-bottom: 1px solid #ccc;*/ }
    .hidden { display: none; }
    #tag-filters { display: flex; flex-wrap: wrap; gap: 10px; padding: 10px 0; align-items: center;}
    .hashtag { margin-bottom: 0px; }
    /* .filter-btn { margin: 5px; padding: 8px 16px; cursor: pointer; } */
    .filter-btn.active { background: var(--bold-link-color, blue); color: white; }
    hr { margin-bottom: 13px; }
</style>



We have a very specific taste in games. We are from the 2000s gamers generation, where the gaming industry was at its peak. 
So every game you will see its name here is a game that deserve to be played or searched about at least. 

<a href="/pages/pc-games">Expanded vision</a>



<!-- Looping on all tags in the games and making the All tags array -->
{%- set allTags = [] -%}
{%- for game in pcGames.items -%}
    {%- for tag in game.tags -%}
    {%- if tag not in allTags -%}
        {%- set allTags = allTags.concat([tag]) -%} <!-- concat() merges an array into another -->
    {%- endif -%}
    {%- endfor -%}
{%- endfor -%}

<br>
<br>
<br>

<div id="filter-container">
    <h2>Filter</h2>
  <!-- Tag filter buttons -->
  <div id="tag-filters">
    <span class="filter-btn active hashtag" data-tag="all">All Games</span>
    
    {%- for tag in allTags -%}
      <span class="filter-btn hashtag" data-tag="{{ tag }}">{{ tag }}</span>
    {%- endfor -%}
  </div>

  <br>
  <br>

  <!-- Game cards -->
  <ul id="game-list">
    {%- for game in pcGames.items -%}
    <div class="game-card" data-tags="{{ game.tags | join(',') }}">
        <!-- game name -->
        {%- if game.link and game.link.length > 0 -%}
            <li><a href="{{ game.link }}" target="_blank">{{ game.name }}</a></li>
        {%- else -%}
            <li><b>{{ game.name }}</b></li>
        {%- endif -%}
        <p>{{ game.description }}</p>

        {%- if game.image.length > 0 -%}
            <img src="{{ game.image }}" />
        {%- else -%}
        {%- endif -%}
    </div>
    {%- endfor -%}
  </ul>
</div>

<br>
<br>

## Games Similar to Prototype Series :
The games here do not match the feeling of super power fantasy character 
with a good back story as much as prototype , but they are the closest
- Infamous Second Son (not for PC , you need emulator)
- Control 
- Dishonored
- Quantum Break
- Saints Row 4
- Batman Arkham series (maybe)
- Spider-Man Remastered
- Spider-Man 2

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