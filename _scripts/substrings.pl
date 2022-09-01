#!/usr/bin/perl
use strict;
use warnings;
use v5.10; # for say() function

my $s = "http://www.henrikfrisk.com/diary/images/58590005-thumb.jpg";
my $st;

# if($s =~ m%/diary/images/%) {
#     $s =~ s/^.*?\/diary\/images\///;
#     print($s);
# }

my $text = "<a href='http://www.kopasetic.com'>www.kopasetic.com</a> <br/>
<a href='http://www.kong.nu'>www.kong.nu</a>
<iframe title='YouTube video player' width='640' height='390' src='http://www.youtube.com/embed/9FZ8cUr41PI' frameborder='0' allowfullscreen></iframe>";

# $yt =~ s/<iframe.*?www\.youtube\.com.*?<\/iframe>//;


#$text =~ m%www.youtube.com/embed/(.*?)'%;
#print($1);

# my $vim->{foo} = do { $text =~ m%www.vimeo.com/embed/(.*?)'% ? $1 : undef };
# my $yt->{id}   = do { $text =~ m%www.youtube.com/embed/(.*?)'%   ? $1 : undef };;
if ($text =~ m// ) {
    print("yes");
} else {
    print("no");
}
