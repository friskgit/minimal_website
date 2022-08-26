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

my $output_dir = "../_recordings/";
my $id = 0;
my $artist = "";
my $release = "";
my $title = "";
my $about = "";
my $excerpt;
my $cover;
my $type = 1;
# my $rec = "not recorded";
my $credit;
my $review;
my $created;
my $updated;
my $songs;
my $label;
my $cat;

my $file_string ="";

# query data from the links table
query_links($dbh, $type);

# disconnect from the MySQL database
$dbh->disconnect();

sub query_links{
    # query from the links table

    my ($dbh) = @_;
    my $sql = "SELECT id,
		    cd_title,
       	      	    cd_artist,
		    cd_released,
		    cd_cover_url,
		    cd_hen_plays,
		    cd_about,
		    cd_review,
		    cd_songs,
		    cd_label,
		    cd_category,
		    created,
		    changed
             FROM web_disc";
    my $sth = $dbh->prepare($sql);

    # execute the query
    $sth->execute();

    if($type == 1) {
	while(my @row = $sth->fetchrow_array()){
	    $file_string = "";
	    $id = $row[0];
	    $title = $row[1];
	    $artist = $row[2];
	    $release = $row[3];
	    $title =~ s/"/'/g;
	    $created = $row[11];
	    $updated = $row[12];
	    $about = $row[6];
	    $about =~ s/<p>|<.p>/\n/g;
	    $about =~ s/"/'/g;
	    $excerpt = $about;
	    $excerpt =~ s/^([^.|?|!]+)/$1/g;
	    $cover = $row[4];
	    $cover =~ s/bilder\/skivor/\/assets\/images\/cd/;
	    $credit = $row[5];
	    $review = $row[7];
	    $songs = $row[8];
	    $label = $row[9];
	    $label =~ s/"/'/g;
	    $cat = $row[10];
	    $file_string = "---\n"
		."title: \"".$title."\"\n"
		."id: \"".$id."\"\n"
		."category: ".$cat."\n"
		."created: ".$created."\n"
		."updated: ".$updated."\n"
		."layout: single\n"
		."excerpt: \"".$excerpt."\"\n"
		."header: \n"
		."  teaser: ".$cover."\n"
		."sidebar:\n"
		."  - title: Group\n"
		."    image: ".$cover."\n"
		."    image-alt: CD cover art\n"
		."    text: \"".$artist."\"\n"
		."  - title: Year\n"
		."    text: ".$release."\n"
		."  - title: Category\n"
		."    text: ".$cat."\n"
		."  - title: Credit\n"
		."    text: ".$credit."\n"
		."  - title: Label\n"
		."    text: \"".$label."\"\n"
		."---\n\n"
		.$about
		."\n"
		."<h2>Tracks</h2>\n"
		.$songs
		."\n";
	    # print($file_string);
	    write_file();
	    #	    printf("%s", $file_string);
	    #	    printf("%s\n\n", $row[4]);
	}
    }
    $sth->finish();
}

sub write_file {
    my $file_name = "";
    $title =~ s/<em>|<.em>//;
    $title =~ s/\//_/;
    $title =~ s/[\.-:,!]//;
    $title =~ s/[,()]//;
    $title =~ s/"//g;
    my @format_title = split ' ', lc $title;
    for my $i (0 .. @format_title)
    {
	if($i < @format_title) {
	    $file_name = $format_title[$i];
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



