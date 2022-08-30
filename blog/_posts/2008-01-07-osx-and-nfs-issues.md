---
 title: "OSX and NFS issues"
 id: 115
 date: 2008-01-07 15:11:07.000000
 tags: writing
 category: blog
 excerpt: "When I need access to network services on my computers in my home/studio network, I usually set them up on GNUlinux and grant the other operating systems access as clients. This time, for several reas..."
 author_profile: false
 show_date: true
 image: 
 layout: single
 permalink: /:categories/:year/:month/:day/:title/
---
{% unless page.image contains 'spacer.gif' %}
{% endunless %}

When I need access to network services on my computers in my home/studio network, I usually set them up on GNUlinux and grant the other operating systems access as clients. This time, for several reasons, I had to set up my OS X machine to export an NFS directory as a server and I needed to access this directory from GNUlinux. Now, this shouldn't be a problem (in theory...).


In practice it took me four hours before I found helpful information at the very bottom of <a href="http://www.bresink.com/osx/143439/issues.html">this page</a>. A UFS formatted disk under OS X and shared with NFS can be mounted but not accessed from Linux. The solution is to "downgrade" to NFS2 when mounting the exported directory.


I can swear would I have done it thhe other way around, exporting directories in GNUlinux and mounting them in OS X it would have taken me no more than 15 minutes. Instead I ended up spending the better portion of my day resolving this issue. It's good to be reminded of the reasons for leaving Mac behind...
