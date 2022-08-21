---
 title: "Dissertation framework"
 id: 118
 date: 2008-02-09 23:23:26.000000
 tags: tag
 category: comp
 layout: single
 permalink: /:categories/:year/:month/:day/:title/
---
![image-right](/assets/images/){: .align-right .news-flash}

After some more research on embeddable databases and offline RIA and offline AJAX (or LAJAX as some refer to it - see <a href="http://blogs.sun.com/FrancoisOrsini/entry/client_side_services_in_the">http://blogs.sun.com/FrancoisOrsini/entry/client_side_services_in_the</a> and <a href="http://cse-mjmcl.cse.bris.ac.uk/blog/2006/10/30/1162236580795.html">http://cse-mjmcl.cse.bris.ac.uk/blog/2006/10/30/1162236580795.html</a>) I have come to the conclusion that, considering my requirements (see below), I should drop both of the two alternatives presented in my <a href="http://www.henrikfrisk.com/diary/archives/2008/02/choosing_framew.php">previous post</a>. The first one relies on Javascript which isn't, to say the least, among my preferred programming languages. The other one involves far too many potential road bumps concerning sequrity (applet needs to be signed to be allowed access to the locl file system) or OS idiosynchrasies (if the applet is not signed it needs to be installed in the lib/ext directory of the JRE). 
I want the chosen solution to be:
<ul>
<li>Easy to install.</li>
<li>Have a minimum of requirements on the hardware and software.</li>
</ul>




My current plan is to supply a small program that implements an embedded database server (<a href="http://db.apache.org/derby/">Apache Derby DB</a>) and a small XML-RPC servlet (<a href="http://ws.apache.org/xmlrpc/">Apache XML-RPC</a>). This program responds to requests sent from the WebbApp written using <a href="http://code.google.com/webtoolkit/">Google WebToolKit</a>. With these technologies I restrict all the implementation to Java, which I know well and have grown familiar to. Further, these concepts blend in well with some of the ideas I have for offline browsing of Integra XML archives and some of the code is likely to be re-usable in the Integra project. Finally, I have chosen well established and widely used libraries for my framework (<a href="http://www.apache.org/">Apache</a> and <a href="http://www.google.com">Google</a>). Further, the WebApp can easily be made to redirect its RPC requests to an online server if so demanded. IOW, with the extra layer of abstraction between the WebApp and the database, I can easily have a more developed database sitting on a server somewhere (Postgres or MySQL) in which updates and ammendments are being made and still keep the local, embedded database engine small and simple.

