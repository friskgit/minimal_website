---
 title: "Working with score layout in SVG"
 id: 76
 date: 2006-01-04 10:08:29.000000
 tags: writing
 category: blog
 excerpt: "I'm using Lilypond as my music typesetting software since a year. It works great for standard notation but has some limitations when it comes to graphical notation of, for example, tape parts. It has ..."
 author_profile: false
 show_date: true
 image: 
 layout: single
 permalink: /:categories/:year/:month/:day/:title/
---
{% unless page.image contains 'spacer.gif' %}
{% endunless %}

I'm using Lilypond as my music typesetting software since a year. It works great for standard notation but has some limitations when it comes to graphical notation of, for example, tape parts. It has the option of exporting the score to SVG format, but I wasn't able to get either Scribus nor Inkscape to find the Feta font that Lilypond uses for its music symbols on my OSX/Fink system. Nevertheless, after some fiddling around I managed to get an SVG file in which the fonts are embedded out of my score in which I can edit every symbol as a vector. These are the steps:
<ul>
<li>Run <code>convert lilypondOutput.ps lilypondOutput.eps</code>
<li>Include the EPS in an image box in Scribus</li>
<li>Save the file as SVG</li>
<li>Open the file in Inkscape or any other SVG compliant software, or just keep working in Scribus.</li>
</ul>
Remember that SVG, as of yet, only supports single page files.
