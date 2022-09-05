---
title: Selections of projects
layout: collection
permalink: /test/
---
<!-- Test page -->
<ul>
{% for proj in site.portfolio %}
	{% if proj.category == "electronic" %}
	<div class="cookie">
		<li>{{ proj.title }}</li>
	</div>
	{% endif %}
{% endfor %}
</ul>
