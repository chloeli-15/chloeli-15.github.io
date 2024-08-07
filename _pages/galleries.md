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
        {% assign image_file = site.static_files | where_exp: "file", "file.path contains preview_image" | first %}
        {% unless image_file %}
          {% assign image_file = site.static_files | where_exp: "file", "file.path contains preview_image and file.extname == '.JPG'" | first %}
        {% endunless %}
        {% unless image_file %}
          {% assign image_file = site.static_files | where_exp: "file", "file.path contains preview_image and file.extname == '.jpg'" | first %}
        {% endunless %}
        {% if image_file %}
          <img src="{{ image_file.path | relative_url }}" alt="{{ gallery.title }}">
        {% else %}
          {% assign gallery_images = site.static_files | where_exp: "file", "file.path contains gallery.gallery_path" %}
          {% if gallery_images.size > 0 %}
            <img src="{{ gallery_images.first.path | relative_url }}" alt="{{ gallery.title }}">
          {% else %}
            <div style="width: 100%; height: 300px; background-color: #f0f0f0; display: flex; justify-content: center; align-items: center;">No Images Found</div>
          {% endif %}
        {% endif %}
      {% else %}
        {% assign gallery_images = site.static_files | where_exp: "file", "file.path contains gallery.gallery_path" %}
        {% if gallery_images.size > 0 %}
          <img src="{{ gallery_images.first.path | relative_url }}" alt="{{ gallery.title }}">
        {% else %}
          <div style="width: 100%; height: 300px; background-color: #f0f0f0; display: flex; justify-content: center; align-items: center;">No Images Found</div>
        {% endif %}
      {% endif %}
      <div class="gallery-item-title">{{ gallery.title }}</div>
    </a>
  </div>
{% endfor %}
</div>