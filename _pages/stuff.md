---
defaults:
# _pages
- scope:
path: ""
type: pages
values:
layout: home
author_profile: true	
permalink: /
image_path: assets/images/MV2021_postal_web.jpg
---

<h4>This is data</h4>

# Use of data files
<div class="newsFlash">
<ul>
{% assign news = site.data.web_news | sort: 'date' | reverse %}
{% for member in news %}
  <li>
	 <img src="{{ member.imgage  }}" />
     <h4> {{ member.title }} </h4>
	 <p> {{ member.date }} </p>
     <p> {{ member.text }} </p>
  </li>
{% endfor %}
</ul>
</div>
