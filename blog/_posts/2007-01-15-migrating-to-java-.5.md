---
 title: "Migrating to java 1.5"
 id: 99
 date: 2007-01-15 22:24:14.000000
 tags: writing
 category: blog
 excerpt: "I have spent the entire day fixing up my Java code in my timbreMap project. Not only am I moving to Linux (from OpenDarwin) but I'm also updating to Java 1.5. There was a weird problem I ran into that..."
 author_profile: false
 show_date: true
 image: 
 layout: single
 permalink: /:categories/:year/:month/:day/:title/
---
{% unless page.image contains 'spacer.gif' %}
{% endunless %}

I have spent the entire day fixing up my Java code in my timbreMap project. Not only am I moving to Linux (from OpenDarwin) but I'm also updating to Java 1.5. There was a weird problem I ran into that I haven't been able to solve as gracefully as I wanted. For the GUI fields displaying numbers I have used the following technique:

<br />


<textarea cols="80" name="text" rows="8">
java.text.NumberFormat numberFormatBeta =
    java.text.NumberFormat.getInstance();

javax.swing.text.NumberFormatter formatterBeta = 
    new javax.swing.text.NumberFormatter(numberFormatBeta);

formatterBeta.setMinimum(new Double((double)learningRate.getMinimum()*.002));

formatterBeta.setMaximum(new Double((double)learningRate.getMaximum()*.002));

JFormattedTextField betaField = new JFormattedTextField(formatterBeta);
</textarea>


<br />

On my current system, the java compiler (which happens to be the Eclipse compiler which may be a problem - in any event I don't use Eclipse) can't find the javax.swing.text.NumberFormatter class. Now, it may have been removed in 1.5 but I can't seem to find any references to that either.
