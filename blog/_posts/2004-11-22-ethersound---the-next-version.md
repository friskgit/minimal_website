---
 title: "etherSound - the next version"
 id: 39
 date: 2004-11-22 11:48:30.000000
 tags: writing
 category: blog
 excerpt: "Comments on the new version of my interactive sound installation etherSound...."
 author_profile: false
 show_date: true
 image: /assets/images/diary/mapping-table-thumb.gif
 related: true
 layout: single
 permalink: /:categories/:year/:month/:day/:title/
---
{% unless page.image contains 'spacer.gif' %}
   ![image-right]({{ page.image }}){: .align-right .news-flash}
{% endunless %}

<a href="http://www.henrikfrisk.com/diary/images/mapping-table.php" onclick="window.open('http://www.henrikfrisk.com/diary/images/mapping-table.php','popup','width=967,height=318,scrollbars=no,resizable=no,toolbar=no,directories=no,location=no,menubar=no,status=no,left=0,top=0'); return false"><img src="http://www.henrikfrisk.com/diary/images/mapping-table-thumb.gif" width="278" height="91" border="0" /></a>

Along with writing an article on my project <a href="http://www.henrikfrisk.com/index.jsp?id=proj&field=is_res&query=1">etherSound</a> I am also reworking the control program and the csound orchestra that synthesize the incoming messages. The sound synthesis for the first version, displayed and performed in August 2003, was consciously made simple for a number of reasons:
<ul>
<li>etherSound was (and still is) an experiment and I wanted the triggered sounds to be recognizable and plain.</li>
<li>the acoustics of the performance space was very lively, to say the least.</li>
<li>severe limitations on processing power only allowed me a few voices per message. I am using formant synthesis through the <em>fof</em> unit generator in csound which can be quite exhausting in real time usage.</li>
</ul>
For the second performance in May 2004 the performance space and the processing power was less limited. But instead I ran into an annoying bug which forced me to using the original version for that performance as well.


In December I am doing a recording of a perfromance of the messages sent to etherSound during the May -04 concert with improvisations by myself and drummer/percussionist Peter Nilsson. Since I am not limited by processing power (real time no necessary) nor acoustics, I am intending to develop and extend both the timbres and the text-to-sound translation. In the computer part I have two distinct instruments with their own distinct expression. What I am trying now is to map them to the letters in each message according to the table. Rhythm and timbre is derived from other parameters and octave placement in voice A is derived from the number of occurences of each letter.
