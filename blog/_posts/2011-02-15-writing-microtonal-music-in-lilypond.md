---
 title: "Writing microtonal music in Lilypond"
 id: 134
 date: 2011-02-15 09:57:21.000000
 tags: writing
 category: blog
 excerpt: "In the process of writing a second (and possibly a third) part to The Mystic Writing Pad I've been trying to figure out a way that allows me to improvise on the 43-tone scale it uses and easily transc..."
 author_profile: false
 show_date: true
 image: 
 layout: single
 permalink: /:categories/:year/:month/:day/:title/
---
{% unless page.image contains 'spacer.gif' %}
{% endunless %}

In the process of writing a second (and possibly a third) part to <a href="http://www.henrikfrisk.com/index.jsp?metaId=music&id=comp&field=id&query=12&show=1#12">The Mystic Writing Pad</a> I've been trying to figure out a way that allows me to improvise on the 43-tone scale it uses and easily transcribe the material into the notation program <a href="http://lilypond.org/">lilypond</a>. After som poking around in the Scheme interface to <a href="http://lilypond.org/">lilypond</a> I managed to get a transformer function working. The tranformer takes the input in which the 43-tone scale has been mapped unto the first 43 keys on the keyboard, starting with middle C (MIDI note number 60) and prints out each pitch, squeezed into its average chromatic value and prints a deviation in cents (+/- 99).

The heart of the transformation are these two functions which gets the pitch number from each note in the input. The rest is just mapping this to a list of output pitches and text scripts retrieved in the call to the (get-text <em>mapping-table index</em>) routine.

{% highlight lisp %}
#(define (add-text-script m)
 (if (equal? (ly:music-property m 'name) 'EventChord)
    (ly:music-set-property! m 'elements
          (cons (make-text-script (get-pitch m))
                (ly:music-property m 'elements)))
    (let ((es (ly:music-property m 'elements))
           (e (ly:music-property m 'element)))
      (if (pair? es)(ly:music-set-property! m 'elements
         (map add-text-script es)))
      (if (ly:music? e)(ly:music-set-property! m 'element
                                               (add-text-script e)))))
m)
{% endhighlight %}

{% highlight lisp %}
#(define (get-pitch music)
  (let* ((es (ly:music-property music 'elements))
         (p  (ly:music-property (car es) 'pitch)))
   (if (ly:pitch? p)(ly:pitch-semitones p) -1)))
{% endhighlight %}

{% highlight lisp %}
#(define (make-text-script x) 
(make-music 'TextScriptEvent
            'direction UP
            'text (markup #:line 
                          (#:fontsize -3
                                      (#:sans (get-text texts x))))))
{% endhighlight %}
