---
 title: "Perspicio - score following in Max/MSP"
 id: 55
 date: 2005-04-17 00:11:13.000000
 tags: writing
 category: blog
 excerpt: "Two years ago Stockholm Saxophone Quartet premiered my piece Persicio for saxophone quartet and computer. I am very glad to have a second performance of it in two weeks - especially since the computer..."
 author_profile: false
 show_date: true
 image: http://www.henrikfrisk.com/diary/files/perspicio_excerpt-thumb.gif
 layout: single
 permalink: /:categories/:year/:month/:day/:title/
---
{% unless page.image contains 'spacer.gif' %}
   ![image-right]({{ page.image }}){: .align-right .news-flash}
{% endunless %}

Two years ago Stockholm Saxophone Quartet premiered my piece Persicio for saxophone quartet and computer. I am very glad to have a second performance of it in two weeks - especially since the computer went down for the second part of the piece. For this piece I have implemented a basic score following that alligns the computer part with the saxophone quartet in order to avoid click track or pedals. As I am reworking the computer part (I don't want the computer to go down again...) I was astonished at how well the score following actually works.

<a href="/assets/files/diary/perspicio_excerpt.php" onclick="window.open('/assets/files/diary/perspicio_excerpt.php','popup','width= 694,height=423,scrollbars=no,resizable=no,toolbar=no,directories=no,location=no,menubar=no,status=no,left=0,top=0'); return false"><img src="/assets/files/diary/perspicio_excerpt-thumb.gif" width="347" height="211" border="0" /></a>


I have used the same technique in another piece (Det Goda / Det Onda for flute and computer), but for Perspicio I had to deal with the fact that there are four instruments playing simultaneously, something which complicates the matter. The saxophones all have their own close range microphone and by employing some quite radical gating on all four inputs I have a fairly stable signal with output almost only when the respective instrument is playing. The computer only listens to one instrument at a time. In the score excerpt (the score is transposed - Eb alto, Bb tenor, Eb baritone, Bb bass) the cue notes are marked with a horizontal arrow.


The technique is quite simple. I chose a window of a few beats up to a few bars in which I look for a discrete pitch or pattern that only occurs once within this window and I set the computer to wait for this pitch. Once it is found the window is moved forward in the score and the computer is waiting for the next pitch. Obviously, between the first cue note and the second cue note the second pitch to look for must not occur until the actual cue. Some attention has to paid to what the other parts are playing since, although the signals are gated some over hearing may occur and result in a &lsquo;false&rsquo; trigger. In some sections I have to &lsquo;mute&rsquo; the input signal altogether for a few seconds in between cues in order to avoid dubbel triggering.


The computer part is done in Max/MSP and I am using Ted Apel's port of Miller Puckette's <code>fiddle~</code> object which works well for what I need. In the new version I had some trouble with getting Puckette's <code>qlist</code> object working so I ended up doing my own adaption of it (read bout that <a href="http://www.henrikfrisk.com/diary/archives/2005/04/max_implementat.php">here</a>). For each cue I have also entered a &lsquo;time out&rsquo; value - if the note was not found in within this time frame the system will cue itself and start looking for the next cue note. By calculating the time between the cues and compare this to the intended time according to the score, I can extract relevant tempo information that will adjust the time out values but also adjust the timing of events in the compter part.


For basic performer-computer temporal alignment I can recomend this method. It does have flaws, but the great advantage is the low computation cost and the stability. As soon as I have finished the reworking of the patch I will upload the whole thing here.
