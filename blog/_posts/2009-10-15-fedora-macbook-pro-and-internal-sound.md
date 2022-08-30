---
 title: "Fedora, MacBook Pro, and internal sound"
 id: 123
 date: 2009-10-15 21:17:22.000000
 tags: writing
 category: blog
 excerpt: "Since I received my brand new MacBook Pro (17'') I haven't figured out how to get sound routed to the internal speakers using PulseAudio. The headphone outlet produced sound though and for that reason..."
 author_profile: false
 show_date: true
 image: 
 layout: single
 permalink: /:categories/:year/:month/:day/:title/
---
{% unless page.image contains 'spacer.gif' %}
{% endunless %}

Since I received my brand new MacBook Pro (17'') I haven't figured out how to get sound routed to the internal speakers using PulseAudio. The headphone outlet produced sound though and for that reason I hadn't bothered too much (it was kind of nice to not have to listen to all the little Gnome sounds; swishes and poffs and what not). But tonight I decided to do something about it. 



From using Jack I had noticed that sound output from the internal sound card (a HDA NVidia with a Realtek ALC889A chip) was sent to the headphone outlet on channel 1 and 2, and to the internal speakers on channel 3 and 4. For PulseAudio the remedy proved to be some settings easily made in the ALSA mixer.



Start the ALSA mixer by simply typing 
<blockquote>
$ alsamixer
</blockquote>
at the command line. If the right soundcard is not displayed choose the internal one by pressing F6. Once the settings for the right soundcard are displayed, set it in 4ch mode (the rightmost option in the playback section). Then, raise the volume of the 'surround' channel. 



That's it. Now there should be sound coming out of the speakers, the volume of which is controllable by the keyboard shortcuts.
