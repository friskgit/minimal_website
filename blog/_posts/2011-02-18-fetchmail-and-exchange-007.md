---
 title: "fetchmail and Exchange 2007"
 id: 135
 date: 2011-02-18 14:10:56.000000
 tags: writing
 category: blog
 excerpt: "Lund University upgraded their email server to Exchange 2007 which suddenly made it impossible to fetch my email over IMAP via fetchmail using my old settings. It turns out I have to specify the autor..."
 author_profile: false
 show_date: true
 image: 
 layout: single
 permalink: /:categories/:year/:month/:day/:title/
---
{% unless page.image contains 'spacer.gif' %}
{% endunless %}

Lund University upgraded their email server to Exchange 2007 which suddenly made it impossible to fetch my email over IMAP via fetchmail using my old settings. It turns out I have to specify the autorization method, which is not 'password' by default as it says in the man page for fetchmail (the default is 'defualt' though I'm not sure what that means), and set it to 'password':

{% highlight bash %}
poll imap.lu.se proto imap
auth password
user [remote-user], with password [password], is [local-user] here ssl;
{% endhighlight %}

Now it works!

