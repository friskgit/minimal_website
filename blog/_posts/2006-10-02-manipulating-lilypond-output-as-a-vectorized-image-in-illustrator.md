---
 title: "Manipulating Lilypond output as a vectorized image in Illustrator"
 id: 89
 date: 2006-10-02 14:25:09.000000
 tags: writing
 category: blog
 excerpt: "So I finally managed to get my output from LilyPond into Illustrator without having to install the fonts included in my LilyPond file. The problem was resolved by simply removing the embedded fonts fr..."
 author_profile: false
 show_date: true
 image: 
 layout: single
 permalink: /:categories/:year/:month/:day/:title/
---
{% unless page.image contains 'spacer.gif' %}
{% endunless %}

So I finally managed to get my output from <a href="lilypond.org">LilyPond</a> into Illustrator without having to install the fonts included in my LilyPond file. The problem was resolved by simply removing the embedded fonts from the PDF output of LilyPond using <a href="http://www.ghostscript.com/awki">GhostScript</a>. Ifound the tip at <a href="http://darkwing.uoregon.edu/~noeckel/Illustrator.html">this site</a> which contains a lot of information on LaTeX and how to manipulate its output in Illustrator. The command to run is:



<code>
gs -sDEVICE=pswrite -dNOCACHE -sOutputFile=nofont-MyScore.ps -q -dbatch -dNOPAUSE MyScore.pdf -c quit
</code>




Now you can open the PS file in Illustrator and all fonts will be converted to paths that can be manipulated like any other path in Illustrator.

