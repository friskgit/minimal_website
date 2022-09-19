---
 title: "Footpedal..."
 id: 57
 date: 2005-04-23 01:07:16.000000
 tags: writing
 category: blog
 excerpt: "When I perform saxophone and computer improvisations I can usually get most of the parameters that I want to control in the synthesis from my saxophone audio input. However, I can't seem to do without..."
 author_profile: false
 show_date: true
 image: 
 related: true
 layout: single
 permalink: /:categories/:year/:month/:day/:title/
---
{% unless page.image contains 'spacer.gif' %}
{% endunless %}

When I perform saxophone and computer improvisations I can usually get most of the parameters that I want to control in the synthesis from my saxophone audio input. However, I can't seem to do without one pedal to control events in the larger time scale. This is something I am pretty confident I will be able to get rid of in due time. Even if it is just one single pedal it is annoying to have to keep pressing a pedal. It does take some of your focus away from playing. Also, on a conceptual level, I believe it bears some significance that interaction is solely based on what is being played on the instrument.


Until I have resolved this issue I will have to live with using a pedal which is in many cases also a technical problem. Either you can use a MIDI program change pedal which usually has five or more switches on it and is relatively large. Or you can use some kind of sustain pedal in which case you will have to connect it to some MIDI device. Either way you have to deal with MIDI which is something I want to avoid. After a suggestion was made to me by <a href="http://www-crca.ucsd.edu/~msp/">Miller Puckette</a> I have now finally resolved this in a rediculously simple way.


By taking a standard on/off pedal switch and making a cable where the switch breaks the signal between two 1/4 inch jacks, connecting the two jacks to an input and an output of my audio interface and sending a sine wave through the output, I can measure the signal at the input and detect a pressed pedal. I made a simple <a href="http://www.cycling74.com">Max/MSP</a> patch that outputs a &lsquo;bang&rsquo;, a toggle or an incrementing index at each pedal press. Download the patch <a href="/assets/files/diary/pedal.pat.zip">here</a>. If you want to listen to some recent work for saxophone and computer follow <a href="http://www.henrikfrisk.com/music/archives/2005/01/saxophone_and_c.html">this link</a>.
