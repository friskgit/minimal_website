---
 title: "timbreMap - re-writing the analysis code."
 id: 95
 date: 2007-01-06 00:05:38.000000
 tags: writing
 category: blog
 excerpt: "I have just started a complete re-write of the spectral analysis part of my main programming project - the timbreMap. After having optimized the DFT calculations for the AltiVec (also known as the Vel..."
 author_profile: false
 show_date: true
 image: 
 layout: single
 permalink: /:categories/:year/:month/:day/:title/
---
{% unless page.image contains 'spacer.gif' %}
{% endunless %}

I have just started a complete re-write of the spectral analysis part of my main programming project - the timbreMap. After having optimized the DFT calculations for the AltiVec (also known as the Velocity Engine) of the PPC processor, I have now decided to use the cross platform library <a href="http://ruby.gfd-dennou.org/products/ruby-fftw3/">FFTW3</a>. The main reason is I'm no longer using the PPC hardware... I have also started cleaning up the code and attempting to optimize parts of it. Other things that needs to be fixed are:
<ul>
<li>Pre-processing of the audio signal. The input should be high and low pass filtered.</li>
<li>Cleaning up the GUI and making all parameters settable, either in a .conf or .rc file or in the GUI.</li>
<li>Adding support for saving a vector of all the weights of the feature map. This particular one involves calling a routine in Fortran from Java going through C/C++ code. Oh well...</li>
<li>Many, many other little things....</li>
</ul>

