---
 title: "etherSound"
 id: 38
 date: 2004-11-18 01:20:35.000000
 tags: tag
 category: comp
 layout: single
 permalink: /:categories/:year/:month/:day/:title/
---
![image-right](/assets/images/){: .align-right .news-flash}

I have been working with the translation and re-writing of the article I wrote on <a href="http://www.henrikfrisk.com/index.jsp?id=proj&field=is_res&query=1">etherSound</a> in Swedish earlier this year. This version will also serve as a starting point for a paper co-written with the curator for the project for which etherSound was commisioned, <a href="http://www.flatness.net">Miya Yoshida</a>. I have found some interesting angles that I am following which proved to be very time consuming but also inspiring. MIC and STIM have published the original Swedish version of the article on their site. Read it <a href="http://www.mic.stim.se/avd/mic/prod/jazzfacts.nsf/WebNewsHiddenSwe/etherSound+-+en+interaktiv+ljudinstallation+-+Henrik+Frisk?OpenDocument">here</a>.


In parallel with writing I am reworking the csound score that generate the sound for etherSound. I will also rewrite and expand the Java program that does the text interpretation. In the original version I used two <acronym title="Fonction d'Onde Formantique">FOF</acronym> synthesis unit generators - I was limited to two by processing power. I am doing a recording of an improvisation along with etherSound and the text messages that was sent during a performance in May this year and for this I have access to much more processing power. In the new version I will have five FOF unit generators in paralell following the vowels as given by the current text message.


Originally I could only allow the computer to play back one message at a time. In the new version I will let the messages overlap but I will probably have to work out a way to limit the number of simultaneous sound objects in some way. If not because of processing power limitations, for reasons of sonic clarity.

