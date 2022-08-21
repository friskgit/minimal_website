---
defaults:
# _pages
- scope:
path: ""
sidebar:
  nav: "bio"
type: pages
values:
layout: single
author_profile: false
breadcrumbs: false
permalink: /about/
---
<img src="../assets/images/orat.jpg">

This site is dedicated to sharing information about what I do as a musician, composer and researcher. The site is an infinite work-in-progress and perhaps more of an archive than a promotion for myself. I do however use this site, among other things, as a virtual stage posting new recordings and pieces every now and then.

<!-- <a href="about.html">bio</a> |  -->
<!-- <a href="short_bio.html">short bio</a> |  -->
<!-- <a href="swed_bio.html">Swedish bio</a> |  -->
<!-- <a href="short_swed_bio.html">short Swedish bio</a> | -->


<div>
{% assign bio = site.data.web_bio | sort: 'lang' %}
{% for member in bio %}
{% if member.id == 1 %}
	<h4> {{ member.title }} </h4>
	<!-- <p style= "font-size: 0.6em"> | updated {{ member.date }} | </p> -->
	<p class="update_text"> | updated {{ member.date }} | </p>
	<p> {{ member.text }} </p>
	<p> {{ member.text2 }} </p>
	<p> {{ member.text3 }} </p>
	{% endif %}
{% endfor %}
</div>

<p> {{ page.url }} </p>
