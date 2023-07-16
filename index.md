---
title: "sound, space and more"
layout: splash
permalink: /splash-page/
date: 2022-09-05T11:48:41-04:00
permalink: /
header:
  overlay_color: "#162c40"
  overlay_filter: "0.5"
  overlay_image: 
excerpt: ""
intro: 
  - excerpt: '*Space is the Place* is the name of the Afrofuturist movie featuring Sun Ra from 1972. The new futurism is to find space that is not *a* place, but something open: unexplored yet familiar. Space is not a place. The future is space and so is the past.'
feature_row:
  - title: <i class="fas fa-headphones fa-2x" aria-hidden="true"></i>
    excerpt: ""
    url: "/music/"
    btn_label: "Listen"
    btn_class: "btn--primary"
  - title: <i class="fas fa-cogs fa-2x" aria-hidden="true"></i>
    excerpt: ""
    url: "/portfolio/"
    btn_label: "Works"
    btn_class: "btn--primary"
  - title: <i class="fas fa-edit fa-2x" aria-hidden="true"></i>
    excerpt: ""
    url: "/blog/"
    btn_label: "Writing"
    btn_class: "btn--primary"

---

{% include feature_row %}

{% include feature_row id="intro" type="center" %}

<!--
{% assign entries_layout = page.entries_layout | default: 'list' %}
<a href="/tags/" class="btn btn--primary btn--small right">browse by tag</a>
<h2 class="archive__item-title">Recent posts</h2>
{% for post in site.posts limit:5 %}
  {% include archive-single.html type=entries_layout %}
{% endfor %}
-->
