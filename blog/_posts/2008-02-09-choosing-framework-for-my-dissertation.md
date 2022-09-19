---
 title: "Choosing framework for my dissertation"
 id: 116
 date: 2008-02-09 23:25:24.000000
 tags: writing
 category: blog
 excerpt: "Though my dissertation was just moved from May to September, I neww desperately to decide on the framework for which the material will be presented in. I want all my work (texts, music, videos, softwa..."
 author_profile: false
 show_date: true
 image: 
 related: true
 layout: single
 permalink: /:categories/:year/:month/:day/:title/
---
{% unless page.image contains 'spacer.gif' %}
{% endunless %}

Though my dissertation was just moved from May to September, I neww desperately to decide on the framework for which the material will be presented in. I want all my work (texts, music, videos, software demos) to be contained on a DVD and accessible in a non-linear, inter-linked and searchable fashion. These are my design considerations:
<ul>
<li>The repository must...
<ul>
<li>...run in a standard web browser (possibly limited to Firefox).</li>
<li>...be accessible off-line.</li>
<li>...only rely on open formats.</li>
<li>...require a minimal install effort on the part of the user,</li>
</ul>
<li>It would be nice if...</li>
<ul>
<li>...it could be syncable with an on-line server.</li>
<li>...it allowed for basic local persistent changes (comments, mark-as-read, etc)</li>
</ul>
</ul>
Offline <acronym title="Rich Internet Application">RIA</acronym>s (which is basically what I want) is a hot potato these days with initiatives such as <a href="http://wiki.mozilla.org/Firefox3">Firefox 3</a>, <a href="http://www.microsoft.com/silverlight/">Microsoft Silverlight</a>, <a href="http://www.adobe.com/products/air/">Adobe Air</a> and <a href="http://gears.google.com/">Google Gears</a>. But rather than relying on a large external framework such as these I would prefer to have something simple that is entirely embeddable.



I have found two solutions that may work for me:
<ol>
<li><a href="http://code.google.com/p/trimpath/wiki/TrimJunction">Junction</a> - a part of <a href="http://gears.google.com/">Google Gears</a> and designed to be a JavaScript only version of <a href="http://www.rubyonrails.org">Ruby on Rails</a>. 
<li>Embedding <a href="http://db.apache.org/derby">Apache Derby</a> in a Java Applet and letting JavaScript retrieve content and insert it in the HTML similar to <a href="http://developers.sun.com/javadb/overview/product_tour/">this demo</a>.
</ol>
I'm leaning towards the second solution and I'm working on a proof-of-concept. My concerns are how to deal with the local storage and the installation and signature of the applet.


Any suggestions are greatly appreciated!
