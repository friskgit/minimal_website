---
 title: "Max implementation of qlist"
 id: 54
 date: 2005-04-16 01:36:31.000000
 tags: tag
 category: comp
 layout: single
 permalink: /:categories/:year/:month/:day/:title/
---
![image-right](/assets/images/){: .align-right .news-flash}

After having problems with the adaption for <a href="http://www.cycling74.com/">Max</a> of Miller Puckette's <code>qlist</code> object I finally decided to implement the basic idea of <code>qlist</code> in an abstraction using the standard library <code>coll</code> object. The idea is to have a list of cues where each cue contains a set of messages to be sent at the time the cue was received or at a specified time. The syntax for writing the text file to load into the <code>collist</code> object is simple and very similar to the syntax for <code>qlist</code>. Here is an example:
<blockquote>
<code>
0, ------------------------ 1;
1, 0 print *** this is a message from collist ***;
2, print cue 1;
3, 2200 strt_spl 4 1;
4, ------------------------ 2;
5, 0 print *** this is a message from collist ***;
6, print cue 2;
7, pt_vce_ctrl 2;
8, 500 strt_spl 4 1;
9, ------------------------ 3;
</code>
</blockquote>
On cue 1 <code>collist</code> will print &ldquo;*** this is a message from collist ***&rdquo; and &ldquo;cue 1&rdquo; in the Max window and 2200 ms later it will send the list 4 1 to the <code>receive</code> object named <code>strt_spl</code>.



The object takes one argument - the name of the text file to be read. This is just an abstraction so doubleclicking on the object will open a patcher window where there is a readme subpatcher with documentation. One thing that is good to know is that although the lines in the collfile may be numbered consecutively, you can always insert new rows anywhere and send the <code>renumber</code> message to the rightmost inlet of the <code>collist</code> object. For example, if you want to insert a message between lines 3 and 4 in the example above just write:
<blockquote>
<code>
0, ------------------------ 1;
1, 0 print *** this is a message from collist ***;
2, print cue 1;
3, 2200 strt_spl 4 1;
31, do_this 1;
4, ------------------------ 2;
...
</code>
</blockquote>
and than send the <code>renumber</code> message and the rows will be nicely renumbered consecutively




I also wrote a little Perl script that changes a original qlist file to the collsyntax. It needs some cleaning up, but feel free to send me an email if you want it and maybe I can get my act together and make nice and tidy. Download the object from <a href="http://www.henrikfrisk.com/diary/files/collist.zip">here</a> but remember, although it works for me, I can in no way garantee that it will work for you but feel free to use it and change it as you wish.

