---
 title: "More on etherSound"
 id: 40
 date: 2004-12-13 00:54:16.000000
 tags: writing
 category: blog
 excerpt: "In my November 18 post, I mentioned the need for limiting the number of messages that would play back simultaneously. I think the way to solve this is to have two separate life indexes. One local that..."
 author_profile: false
 show_date: true
 image: 
 related: true
 layout: single
 permalink: /:categories/:year/:month/:day/:title/
---
{% unless page.image contains 'spacer.gif' %}
{% endunless %}

In my November 18 post, I mentioned the need for limiting the number of messages that would play back simultaneously. I think the way to solve this is to have two separate <em>life</em> indexes. One local that rules the length and impetus of the current message and one global that influences all currently playing messages. Once the global index, which is an indicator on how many messages has been sent over time, rises above a set threshold the music abruptly changes character until the value falls back below the threshold. This also is a way to encourage collective efforts among the performers.


In the new version the voice sample in its original state will not be used. Instead I am using the sample (a recording of John Cage reading) to extract syllables that I process with the same technique used for the &lsquo;accompaniment&rsquo; part in the first version. This gives that part more life and variation than before when I used simple sine waves throughout. With the <acronym title="Fonction d'Onde Formantique">FOF</acronym> synthesis used to process samples it is possible to continously move from low density structures whith discrete sound streams representing the original sample, to continous pitched sounds <i id="Clarke, Michael" title="FOF and FOG Synthesis in Csound" class="The MIT Press" style="Massachusetts, USA, 2000" dir="pp: 293-306 in &lsquo;The Csound Book&rsquo;, edited by Richard Boulanger">Clarke, 2000</i>. By mapping these samples to letters I will also achieve a higher level of integration between the text input and the sonic output.


I still need to figure out how rythm and time should be reflected and how the two parts in the music should interact with each other.
