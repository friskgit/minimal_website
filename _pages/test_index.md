---
defaults:
# _pages
- scope:
path: ""
type: pages
values:
layout: home
author_profile: true
permalink: /testindex/
image_path: assets/images/MV2021_postal_web.jpg
---
This is index.

{% assign posts = site.posts %}
{% for post in posts %}
	<a class="post-link" href="{{ post.url | prepend: site.baseurl }}">
		{{post.title}}
	</a>
{% endfor %}

