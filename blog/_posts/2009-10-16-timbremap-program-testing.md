---
 title: "timbreMap program testing"
 id: 114
 date: 2009-10-16 21:19:48.000000
 tags: writing
 category: blog
 excerpt: "The timbreMap program is part of PhD project and is designed to organize timbral features of its audio input in its 2D output space. It uses the JetNet implementation of Artificial Neural Networks by ..."
 author_profile: false
 show_date: true
 image: 
 layout: single
 permalink: /:categories/:year/:month/:day/:title/
---
{% unless page.image contains 'spacer.gif' %}
{% endunless %}

The <em>timbreMap</em> program is part of PhD project and is designed to organize timbral features of its audio input in its 2D output space. It uses the JetNet implementation of Artificial Neural Networks by LÃ¶nnblad et al., in particular the Kohonan feature map. The Kohonan net is a self organizing (unsupervised training) feature map widely used in speach recognition. In the <em>timbreMap</em> program the network is fed a Bark scale transform of the input. In the screenshots below the output, the winning node, is represented by the black dot in the center window. There is no pre-conceived mapping of input to output and although a similar input will result in correspondingly similar output the trained weights may differ from and cause a different area in the output to respond to the same sound in two different training sets.



In the following screen capture we can observe the program while it attempts to organize its weights in response to three sine wave oscillators, crossfaded and tuned to three different frequencies. Thanks to the simplicity of the input the network organizes itself fairly quickly and optimizes its responses so that the winning node travels along the borders of the output map. Once the map is trained the network responds with the same output no matter the order or speed of its input.



<p id="player1"><a href="http://www.macromedia.com/go/getflashplayer">Get the Flash Player</a> to see this player.

<script type="text/javascript">
	var s1 = new SWFObject("http://www.henrikfrisk.com/script/flvplayer.swf","single","290","240","7");
	s1.addParam("allowfullscreen","true");
s1.addVariable("file","/assets/files/diary/sine-edited.flv");
	s1.addVariable("width","290");
	s1.addVariable("height","240");
	s1.write("player1");
</script>




In the next example the network has been trained on six different saxophone samples: Two ordinarily played notes, two "growled" notes and two multiphonics. What we see in the screen capture is the response of an already trained network. Though the output is noisier than the previous example there is a clear pattern to the responses. About halfway I add a simple synthesizer with a pitch tracker (using Miller Puckette's fiddle object in PD). The synthesis algorithm is a simple implementation of Phase Aligned Formant synthesis taken from the PD documentation (Chapter 3, F12). Then, I map the X axis of the network output to the synthesis formant center frequency, and the Y axis to the index parameter.



<p id="player2"><a href="http://www.macromedia.com/go/getflashplayer">Get the Flash Player</a> to see this player.

<script type="text/javascript">
	var s1 = new SWFObject("http://www.henrikfrisk.com/script/flvplayer.swf","single","290","240","7");
	s1.addParam("allowfullscreen","true");
s1.addVariable("file","/assets/files/diary/sax-edited.flv");
	s1.addVariable("width","290");
	s1.addVariable("height","240");
	s1.write("player2");
</script>




The mapping was done more or less arbitrarily, merely making sure the parameters would stay within reasonable ranges. Though the mapping is less sucessful on the multiphonics and the noisy growles, it makes perfect sense on the ordinary notes. Letting properties of the input control aspects of the output that belong to the same class of events, in this case seems to imply that the details of the mapping are less important. However for the noisy input, what we perceive as one sound in the input (a growl or a multiphonic), in the synthesis becomes an oscillation between two different sounds. Here, more care in the mapping is needed, or a "smearing" of the data to couteract the "jumpiness" of the output. 
