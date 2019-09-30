use strict;
use CGI":standard";

# Error response
use warnings;
use CGI::Carp qw(fatalsToBrowser);

sub Main () {
    my $query                       = new CGI;

    # Print HTTP header
    print $query->header;
    print qq(hi);
}

&Main();
