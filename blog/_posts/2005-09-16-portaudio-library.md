---
 title: "PortAudio library"
 id: 72
 date: 2005-09-16 00:49:55.000000
 tags: writing
 category: blog
 excerpt: "After a long puase, I have now resumed working on my programming project to implement and test a speaker independent speach recognition algorithm suggested by Huang and Kuh, 1992.
Having only allowed ..."
 author_profile: false
 show_date: true
 image: 
 related: true
 layout: single
 permalink: /:categories/:year/:month/:day/:title/
---
{% unless page.image contains 'spacer.gif' %}
{% endunless %}

After a long puase, I have now resumed working on my programming project to implement and test a speaker independent speach recognition algorithm suggested by <i id="Zeehen Huang &amp; Anthony Kuh" title="A Combined Self-Organizing Feature Map and Multilayer Perceptron for Isolated Word Recognition" class="IEEE" style="1992" dir="vol 40, issue 11, pp2651-2657">Huang and Kuh, 1992</i>.
Having only allowed for soundfile playback in the early versions, I have now added support for real time audio input. I decided to make use of the <a href="http://www.portaudio.com/">PortAudio</a> I/O library. After fiddling around with it for a few hours, I must say it really works well and is extremely easy to work with as compared to Apple's native API which I find utterly confusing for anything other than the built in audio hardware.


