---
 title: "Migrating to java 1.5 - update"
 id: 100
 date: 2007-01-15 22:34:52.000000
 tags: tag
 category: comp
 layout: single
 permalink: /:categories/:year/:month/:day/:title/
---
![image-right](/assets/images/){: .align-right .news-flash}

Going home after having written <a href="http://www.henrikfrisk.com/diary/archives/2007/01/migrating_to_ja.php">this</a>
I realized what was the problem. In essence it is the difference between <em>all free software</em> and <em>almost all free software</em>. IOW the java environment included in Fedora Core 5 (which is the distro I have on my new laptop) has the <em>free</em> <a href="http://gcc.gnu.org/java/">java-gcj</a> and not the <em>non-free</em> <a href="http://java.sun.com/">Sun JDK</a>.



I seem to remember reading about Sun going open source with the core Java API but I guess it's not come through yet. Anyhow, following <a href="http://ccl.net/cca/software/SOURCES/JAVA/JSDK-1.5/index5.shtml">these </a>excellent instructions I managed to install the <a href="http://java.sun.com/">Sun Java</a> alongside the <a href="http://gcc.gnu.org/java/">Gnu Java</a>. My project, including the NumberFormatter objects, now compiles without errors.

