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

my $output_dir = "../news/_posts/"
my $id = 0;
my $date = "2020-01-01";
my $title = "";
my $tag = " ";
my $img = "/assets/images/";
my @types = ("bio", "comp", "disc", "docs", "news");
my $type = 4;

my $file_string ="";

# query data from the links table
query_links($dbh, $type);

# disconnect from the MySQL database
$dbh->disconnect();

sub query_links{
    # query from the links table

    my ($dbh) = @_;
    my $sql = "SELECT id,
     	    	    date,
		    cat,
		    title,
		    text,
		    image
             FROM web_news";
    my $sth = $dbh->prepare($sql);

    # execute the query
    $sth->execute();

    if($type == 4) {
	while(my @row = $sth->fetchrow_array()){
	    $file_string = "";
	    $id = $row[0];
	    $date = $row[1];
	    $tag = $row[2];
	    $title = $row[3];
	    $img = $row[5];
	    fm_news_file($date);
	    $file_string = $file_string.
		"\n\n".	       
		$row[4].
		"\n\n";
	    #	    printf("%s\n", $id);
	    write_file();
	    #	    printf("%s", $file_string);
	    #	    printf("%s\n\n", $row[4]);
	}
    }
    if($type == 2) {
	while(my @row = $sth->fetchrow_array()){
	    $id = $row[0];
	    $date = $row[1];
	    $tag = $row[2];
	    $title = $row[3];
	    fm_collection($date);
	    printf("%s\n\n", $row[4]);
	}
    }
    $sth->finish();
}

sub fm_collection {
    fm_common_start();
    printf("tags: news %s\n", $tag);
    printf("layout: collection\n");
    printf("permalink: /portfolio/\n");
    printf("collection: portfolio\n");
    printf("entries_layout: grid\n");
    fm_common_end();
}

sub fm_news {
    fm_common_start();
    printf("tags: news %s\n", $tag);
    printf("layout: posts\n");
    printf("permalink: pretty\n");
    fm_common_end();
}
sub fm_news_file {
    $img =~ s/.*bilder/\/assets\/images/;
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
	.$types[$type]
	."\n layout: single\n permalink: /:categories/:year/:month/:day/:title/\n";
    $file_string = $file_string."---\n";
    $file_string = $file_string."![image-right](".$img."){: .align-right .news-flash}";
}

sub fm_common_start {
    printf("---\n");
    printf("title: %s\n", $title);
    printf("id: %s\n", $id);
    printf("date: %s\n", $date);
}

sub fm_common_end {
    printf("---\n\n");
}

sub write_file {
    my $file_name = $date;
    $title =~ s/<em>|<.em>//;
    $title =~ s/\//_/;
    $title =~ s/[\.-:,!]//;
    $title =~ s/[,()]//;
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
}



