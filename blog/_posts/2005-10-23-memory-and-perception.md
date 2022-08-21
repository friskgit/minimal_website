---
 title: "Memory and perception"
 id: 74
 date: 2005-10-23 00:08:07.000000
 tags: tag
 category: comp
 layout: single
 permalink: /:categories/:year/:month/:day/:title/
---
![image-right](/assets/images/){: .align-right .news-flash}

I am spending most of my time programming these days working on a piece of software that will allow me to investigate different models of <acronym title="Artificial Neural Network">ANN</acronym> and their use for real time timbre tracking in an audio signal. Meanwhile I am reading "La m&eacute;moire, l'histoire, l'oubli" by Paul Ricoeur <i id="Ricoeur, Paul" title="La m&eacute;moire, l'histoire, l'oubli" class="&Eacute;ditions du Seuil" style="2000">Ricoeur, 2005</i> (in a Swedish translation) and realizing just how complicated the idea of memory, immediate memory or retention in particular, is to understand let alone when trying to implement it in a computer program. Now, don't get me wrong; it's not like I thought this was a simple matter - I somehow thought some kind of feedback algorithm would do the trick (IOW, I will have to admit I haven't spent that much time thinking about it). Reading this book has made me think that the way we choose to implement short time memory in this sytem will be crucial to the outcome.


Again it's the difference by the atomized nature of computer processing as opposed to the continous experience of man that contitutes the very core of the problem. As I am hearing a tone it is as if everything between the beginning and the end is <em>one</em> temporal object, one 'now'. Although I can spot changes of timbre in time as the tone is being played it doesn't disrupt my notion of the sound as <emph>one</emph> tone. The computer will treat any and all 'frames' of sound samples as equally important and as an instance of an infinite series of frames. The problem may be formalized as how to let the computer know that this frame is part of <em>N</em> previous frames and an unknown number of forthcoming frames, <em>without</em> loosing definition of the small scale changes of timbre in short time and without having to try to track note onsets.

