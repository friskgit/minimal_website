#!/usr/bin/perl
use strict;
use warnings;
use v5.10; # for say() function

use DBI;
say "Perl MySQL Connect Demo";
# MySQL database configuration
my $dsn = "DBI:mysql:henrikfrisk_com";
my $username = "henrikfr";
my $password = 'leo9105L';

# connect to MySQL database
my %attr = ( PrintError=>0,  # turn off error reporting via warn()
             RaiseError=>1   # report error via die()
    );
my $dbh = DBI->connect($dsn,$username,$password,\%attr);

my $output_dir = "../music/_posts/";
my $id = 0;
my $blog_id = 0;
my $date = "2020-01-01";
my $title = "";
my $tag = " ";
my $text = "";
my $img = "/assets/images/";
my @types = ("bio", "comp", "disc", "docs", "news");
my $type = 1;
my $img_tag = "";
my $category_type = "music";
my $excerpt;

my $file_string ="";
my $img_start = "{% unless page.image contains 'spacer.gif' %}\n";
my $img_end = "{% endunless %}";
my $diary_img = "/assets/images/diary";
my $diary_file = "/assets/files/diary/";
my $youtube = "";
my $yt;
my $url;
# query data from the links table
query_links($dbh, $type);

# disconnect from the MySQL database
$dbh->disconnect();

sub query_links{
    # query from the links table

    my ($dbh) = @_;
    my $sql = "SELECT id,
       	      	      date,   
    		      lang,	      
    		      cat,
    		      name,
    		      url,
`desc`,
cntnt,
format,
upload
             FROM web_music; #WHERE id=6374;
    # WHERE entry_id = 105";
    my $sth = $dbh->prepare($sql);

    # execute the query
    $sth->execute();

    while(my @row = $sth->fetchrow_array()) {
	$file_string = "";
	$id = $row[0];
	$date = $row[1];
	$tag = $row[3];
	$title = $row[4];
	$title =~ s/"/'/g;
	$url = $row[5];
	$excerpt = $row[6];
	$text = $row[6].$row[7]; # combine bothe texts into one.
	$text =~ s/<p>|<.p>/\n/g; # remove p:s
	$text =~ s/<div.*>|<\/div>/\n/g; # remov div:s
	$text =~ m%<img[^>]*src="([^"]*)"%s; # Extract the img tag if any
	$img_tag = $1; # assign the image tag to img_tag
	if($img_tag =~ m/^bilder\/(.*?(jpe?g|gif|png))/) {
	    $img_tag = $img.$1;
	}
	if($img_tag =~ m%^.*?henrikfrisk.com/diary/images%) {
	    $img_tag =~ s/^.*?henrikfrisk\.com\/diary\/images/\/assets\/images\/diary/;
	}
	$text =~ s/<img.*<\/img>//; # remove image tag
	$text =~ s/http:\/\/www.henrikfrisk.com\/diary\/files/\/assets\/files\/diary/g; # change linked file url: diary/files to files/diary.
	$text =~ s/href=("|')(http:\/\/www.henrikfrisk.com\/documents\/|documents\/)/href="\/assets\/files\/documents/g; # change linked documents url.
#	$text =~ s/<iframe/\n\n<iframe/g; #fix iframe

	$text =~ s/http:\/\/www\.henrikfrisk\.com\/music\/media/\/assets\/files\/music\/media/g; # change linked file url.
	$text =~ s/href=("|')(http:\/\/www.henrikfrisk.com\/music\/)/href="\/assets\/files\//g; # change

	$url =~ s/http:\/\/www\.henrikfrisk\.com\/music\/media/\/assets\/files\/music\/media/g; # change linked file url.
	$url =~ s/href=("|')(http:\/\/www.henrikfrisk.com\/music\/)/href="\/assets\/files\//g; # change 
	# Youtube stuff

	$yt->{yid} = do { $text =~ m%www.youtube.com/embed/(.*?)('|")% ? $1 : undef }; # search for youtube links in the file.
	$youtube = "{% include video id='".$yt->{yid}."' provider='youtube' %}\n";

	$text =~ s/<iframe.*?www\.youtube\.com.*?<\/iframe>//; # remove youtube tag
	
	if($excerpt eq "") { # excerpt field is empty
	    $excerpt = substr($row[7], 0, 100);
	}
	$excerpt =~ s/<.*?>//g;
	$excerpt = substr($excerpt, 0, 200)."...";
	$excerpt =~ s/"/'/g;
	$excerpt = "\"".$excerpt."\"";
	fm_news_file($date);
	$file_string = $file_string.
	    "\n\n".	       
	    $text.
	    "\n";
	if( defined $yt->{yid}) {
	    $file_string = $file_string.$youtube."\n";
	}
	if( defined $url ) {
	    if($url =~ m/youtu/ ) {
		print("Is youtube");
		$url =~ s/^http.*youtu.*\/(.*?)$/$1/;
	    }
	    if (index($youtube, $url) != -1) {
		print($yt->{yid}."\n");
		print($url."\n");
		print("URL is duplicate");
	    } else {
		if($url =~ m/\//) {
		    print("url has slash");
		    $file_string = $file_string."\n![](".$url.")\n";
		} else {
		    print("URL is youtube");
		    $file_string = $file_string."{% include video id='".$url."' provider='youtube' %}\n";
		}
	    }
	}
	#print($file_string."\n");
	write_file();
    }
    $sth->finish();
}

sub fm_news_file {
    $file_string = "---\n title: \""
	.$title
	."\"\n id: "
	.$id
	."\n date: "
	.$date."\n";
    $file_string = $file_string
	." tags: "
	.$tag
	."\n category: "
	.$category_type
	."\n excerpt: ".$excerpt
	."\n author_profile: false\n"
	." show_date: true\n"
	." image: "
	.$img_tag
	."\n media: "
	.$url
	."\n related: true"
	."\n layout: single\n permalink: /:categories/:year/:month/:day/:title/\n";
    $file_string = $file_string."---\n";
    $file_string = $file_string.$img_start;
    if($img_tag ne "") {
	$file_string = $file_string."   ![image-right]({{ page.image }}){: .align-right .news-flash}\n";
    }
    $file_string = $file_string.$img_end;
}

sub write_file {
    my $file_name = substr($date, 0, 10);
    $title =~ s/<em>|<.em>//;
    $title =~ s/\//_/;
    $title =~ s/[\.-:,!]//;
    $title =~ s/[,()]//;
    $title =~ s/"//g;
    my @format_title = split ' ', lc $title;
    for my $i (0 .. @format_title)
    {
	if($i < @format_title) {
	    $file_name = $file_name."-".$format_title[$i];
	}
	else {
	    $file_name = $file_name.".md";
	}
    }



    my $filename = $output_dir.$file_name;
    # print $file_name;
    #    printf("%s", $filename);
    #    print $file_string;
    open(FH, '>', $filename) or die $!;
    print FH $file_string;
    close(FH);
    system("dos2unix ".$filename);
}



