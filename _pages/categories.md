---
title: Selections of projects
layout: collection
permalink: /test/
---
<ul>
{% for proj in site.portfolio %}
	{% if proj.category == "electronic" %}
	<div class="cookie">
		<li>{{ proj.title }}</li>
	</div>
	{% endif %}
{% endfor %}
</ul>
