---
title: "Space"
layout: splash
permalink: /splash-page/
date: 2022-09-05T11:48:41-04:00
permalink: /
header:
  overlay_color: "#162c40"
  overlay_filter: "0.5"
  overlay_image: /assets/images/unsplash-image-1.jpg
excerpt: "music, text and stuff about what I do as a musician, composer and researcher."
intro: 
  - excerpt: '*Space is the Place* is the name of the Afrofuturist movie featuring Sun Ra from 1972. Sun Ra is a strong influence on me. The new futurism is to find space that is not *a* place, but something open. Place is excluding but space is inclusive. Space for the environment, art and thinking. The future is space.'
feature_row:
  - title: "Music"
    excerpt: "Under the heading of 'listen' there is a large collection of various recordings, tracks from CDs, concert videos and the like. The material is quite unorganized and the main rationale behind publishing is that I publish things that are current. However, I don't take stuff out that is not current."
    url: "/music/"
    btn_label: "Browse"
    btn_class: "btn--primary"
  - title: "Writing"
    excerpt: "This is a similarly diverse collection of written texts ranging from technical notes, blog posts on to full articles. Most of these are in English but there are Swedish posts as well. Follow 'about' and on to publications for published articles. Though the list is complete all are not downloadable yet."
    url: "/blog/"
    btn_label: "Read More"
    btn_class: "btn--primary"
  - title: "Projects and works"
    excerpt: "Under 'projects and works' I have collected compositions as well as current projects (such as groups and other collabortions). Depending on the type of page the material differs a bit. These are in many occasions connected to the the recordings, so this is an entry point to listen to some of my music as well."
    url: "/portfolio/"
    btn_label: "Browse"
    btn_class: "btn--primary"
---

{% include feature_row id="intro" type="center" %}

{% include feature_row %}

{% assign entries_layout = page.entries_layout | default: 'list' %}
<a href="/tags/" class="btn btn--primary btn--small right">browse by tag</a>
<h2 class="archive__item-title">Recent posts</h2>
{% for post in site.posts limit:5 %}
  {% include archive-single.html type=entries_layout %}
{% endfor %}
