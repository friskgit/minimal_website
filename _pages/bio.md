---
title: Biography
sidebar:
  nav: "bio"
type: pages
values:
breadcrumbs: true
layout: single
author_profile: true
breadcrumbs: true
permalink: /about/bio/
---
![mixer image]( /assets/images/mixer_high.jpg ){: .text_nowrap}

[  bio  ](#bio){: #bio .btn .btn--primary}
[short bio](#sbio){: #sbio .btn .btn--primary}
[swedish bio](#sebio){: #sebio .btn .btn--primary}
[short swedish bio](#sesbio){: #sesbio .btn .btn--primary}
  
<div>
{% assign bio = site.data.web_bio | sort: 'lang' %}
{% for member in bio %}
	<div id="bio_{{ member.id }}">
		<div style= "font-size: 0.7em; float: right;"> updated {{ member.date }} </div>
		<h4> {{ member.title }} </h4>
		<!-- <p style= "font-size: 0.6em"> | updated {{ member.date }} | </p> -->
		<p> {{ member.text }} </p>
		<p> {{ member.text2 }} </p>
		<p> {{ member.text3 }} </p>
	</div>
{% endfor %}
</div>


<script>
$( document ).ready(function() {
	$( "#bio_1" ).show();
	$( "#bio_2" ).hide();
	$( "#bio_3" ).hide();
	$( "#bio_4" ).hide();
});
$( "#bio" ).click(function() {
	$( "#bio_1" ).show();
	$( "#bio_2" ).hide();
	$( "#bio_3" ).hide();
	$( "#bio_4" ).hide();
});
$( "#sbio" ).click(function() {
	$( "#bio_1" ).hide();
	$( "#bio_2" ).show();
	$( "#bio_3" ).hide();
	$( "#bio_4" ).hide();
});
$( "#sebio" ).click(function() {
	$( "#bio_1" ).hide();
	$( "#bio_2" ).hide();
	$( "#bio_3" ).show();
	$( "#bio_4" ).hide();
});
$( "#sesbio" ).click(function() {
	$( "#bio_1" ).hide();
	$( "#bio_2" ).hide();
	$( "#bio_3" ).hide();
	$( "#bio_4" ).show();
});
</script>
