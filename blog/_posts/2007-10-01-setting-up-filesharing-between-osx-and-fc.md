---
 title: "Setting up filesharing between OSX and FC5"
 id: 107
 date: 2007-10-01 23:39:52.000000
 tags: writing
 category: blog
 excerpt: "Now, this is somewhat unrelated to this blog, but I'll put it here anyways - mainly because I need to make notes about how I did it...

I need to be able to access and share files between all my compu..."
 author_profile: false
 show_date: true
 image: 
 related: true
 layout: single
 permalink: /:categories/:year/:month/:day/:title/
---
{% unless page.image contains 'spacer.gif' %}
{% endunless %}

Now, this is somewhat unrelated to this blog, but I'll put it here anyways - mainly because I need to make notes about how I did it...



I need to be able to access and share files between all my computers - some of which are running Linux (FC5) and some which are running OSX. After fiddling around a little bit I decided to go with Samba as it seemed to be the most straight forward and usable solution.



I began by installing Samba and all its dependencies on my FC5 system by running:



<code>$ yum install samba</code>



In FC5 the samba deamons can be started by running:


<code>$ service smb start</code>


and (optionally) 


<code>$ service winbind start</code>


To make the deamons are started at boot time run


<code>$ chkconfig smb on


$ chkconfig winbind on</code>



The main configuration is done in <code>/etc/samba/smb.conf</code> and great help for <em>how</em> to configure it can be found in <a href="http://www.samba.org/samba/docs/Samba-HOWTO-Collection.pdf">this</a> document. I wanted a singel directory that would work as a shared volume on the local network so I added restrictions to the <code>hosts allow</code> section (setting its value to 192.168.1. 127. will allow connections only from localhost and the 192.168.1. namespace on the network).



I created a shared volume with adding the following to the smb.conf: 


<code>
[data]<br />
   comment = Data<br />
   path = /path/to/shared/directory<br />
   force user = username<br />
   read only = No<br />
   guest ok = No<br />
   writable = yes<br />
   printable = no<br />
</code>



Test the config file with:


<code>$ testparm /etc/samba/smb.conf</code>


Add a user to smbpasswd by running:


<code>$ smbpasswd -a user</code>





Now, restart the Samba server and test your configuration:


<code>$ smbclient -L servername</code> 


where <code>servername</code> is the address of the server that Samba is running on. If your are issueing the command from the same machine, <code>localhost</code> would be a woring servername. If this works you can try to connect to your service by running


<code>$ smbclient //localhost/data</code>
and enter the password you added for the user edited above. In the example, <code>localhost</code> is the server and <code>data</code> is the name of the server as it is defined in the smb.conf.



Now, in OSX use the 'Connect to server...' command and enter:
<code>smb://servername/data</code>


as the address. If everything worked out you will now be prompted for your password and onced this is enetered and verified, the volume will appear in the Finder.
