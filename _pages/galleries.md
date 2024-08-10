---
layout: page
title: Galleries
permalink: /galleries/
---

<style>
.gallery-container {
  display: flex;
  flex-wrap: wrap;
}
.gallery-item {
  width: 50%;
  padding: 10px;
  box-sizing: border-box;
}
.gallery-item img {
  width: 100%;
  height: 300px;
  object-fit: cover;
}
.gallery-item-title {
  text-align: center;
  font-size: 1.2em;
  margin-top: 10px;
}
</style>

<div class="gallery-container">
{% for gallery in site.galleries %}
  <div class="gallery-item">
    <a href="{{ gallery.url | relative_url }}">
      {% assign preview_image = gallery.preview_image | default: gallery.Preview_Image %}
      {% if preview_image %}
        {% assign image_path = preview_image %}
      {% else %}
        {% assign image_path = gallery.gallery_path | append: '/' | append: gallery.images.first %}
      {% endif %}
      
      {% assign image_file = site.static_files | where: "path", image_path | first %}
      {% if image_file %}
        <img src="{{ image_file.path | relative_url }}" alt="{{ gallery.title }}">
      {% else %}
        <div style="width: 100%; height: 300px; background-color: #f0f0f0; display: flex; justify-content: center; align-items: center;">No Image Found</div>
      {% endif %}
      
      <div class="gallery-item-title">{{ gallery.title }}</div>
    </a>
  </div>
{% endfor %}
</div>