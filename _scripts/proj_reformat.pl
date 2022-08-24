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

my $output_dir = "../../test/";
my $id = 0;
my $blog_id = 0;
my $date = "2020-01-01";
my $title = "";
my $tag = " ";
my $text = "";
my $img = "/assets/images/";
my @types = ("chamber", "electronic", "installation", "big band", "jazz", "improvised");
my $type = 1;
# my $rec = "not recorded";
my $commentEN;
my $commentSE;
my $changed;
my $comp_yr;
my $first_perf;
my $score;

my $file_string ="";

# query data from the links table
query_links($dbh, $type);

# disconnect from the MySQL database
$dbh->disconnect();

sub query_links{
    # query from the links table

    my ($dbh) = @_;
    my $sql = "SELECT id, 
		    title,
       	      	    cat,
		    instr,
		    comp_year,
		    first_perf,
		    recorded,
		    about,
		    comment_en,
		    comment_se,
		    score_url,
		    score_size,
		    created,
		    changed
             FROM web_comp";
    my $sth = $dbh->prepare($sql);

    # execute the query
    $sth->execute();

    if($type == 1) {
	while(my @row = $sth->fetchrow_array()){
	    $file_string = "";
	    $id = $row[0];
	    $date = $row[12];
	    $changed = $row[13];
	    $tag = $row[2];
	    $title = $row[1];
	    $comp_yr = $row[4];
	    $title =~ s/"/'/g;
	    $first_perf = $row[5];
	    # if($row[6] > 0) {
	    # 	$rec = "Is recorded";
	    # }
	    $text = $row[7];
	    $commentEN = $row[8];
#	    print($commentEN);
#	    print("\n\n");
	    $commentEN =~ s/<p>|<\/p>/\n/g;
	    if(defined $commentEN && $commentEN ne '' && $commentEN ne 'NA') {
		$commentEN = "<h2>Program note (EN)</h2>\n".$commentEN."\n\n";
	    } else {
		$commentEN = "No programnote in English"
	    }
	    $commentSE = $row[9];
	    $commentSE =~ s/<p>|<\/p>/\n/g;
	    # print($commentSE);
	    # print("\n\n");
	    if(defined $commentSE && $commentSE ne '' && $commentSE ne 'NA') {
		$commentSE = "<h2>Programkommentar (SE)</h2>\n".$commentSE."\n\n";
	    } else {
		$commentSE = "No programnote in Swedish"
	    }
	    $score = $row[10];
	    if(defined $score && $score ne '' && $score ne 'NA') {
		$score =~ s/(^.*\/)(media.*$)/$2/g;
		$score = "  text: <a href='/assets/".$score."'>Score for ".$title."</a>\n";
		$score = "- title: Score\n".$score;
	    } else {
		$score = " ";
	    }
	    # print("%s\n", $score);
	    $text =~ s/<p>|<.p>/\n/g;
	    $file_string = "---\n"
		."title: \"".$title."\"\n"
		."category: ".$tag."\n"
		."updated: ".$changed."\n"
		."layout: single\n"
		."excerpt: \"".$text."\"\n"
		."header: \n"
		."image: ".$img."\n"
		."teaser: ".$img."\n"
		."sidebar:\n"
		."- title: About\n"
		."  image: ".$img."\n"
		."  image-alt: ".$img."\n"
		."  text: \"".$text."\"\n"
		."- title: Year\n"
		."  text: ".$comp_yr."\n"
		."- title: Category\n"
		."  text: ".$tag."\n"
		."- title: First performed\n"
		."  text: ".$first_perf."\n"
		# ."  - title: Recorded\n"
		# ."    text: ".$rec."\n"
		.$score
		."- title: Record updated\n"
		."  text: ".$changed."\n"
		."gallery:\n"
		."- url: ".$img."\n"
		."  image_path: ".$img."\n"
		."  alt: \n"
		."- url: ".$img."\n"
		."  image_path: ".$img."\n"
		."  alt: \n"
		."- url: ".$img."\n"
		."  image_path: ".$img."\n"
		."  alt: \n"
		."---\n"
		.$commentEN
		.$commentSE
		."\n\n";
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

sub portfolio_entry {
    $file_string = "---";
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

sub fm_common_end {
    printf("---\n\n");
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



