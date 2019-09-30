package Supercar;

use strict;
use CGI":standard";
use CGI::Carp qw(fatalsToBrowser);


sub CreateSupercar {

    my $supercar        = ref $_[0] eq "HASH" ? %{ $_[0] } : "";

} #


sub DeleteSupercarById {

    my $id              = $_[0] || "";

} #


sub GetSupercarById {

    my $id              = $_[0] || "";

} #


sub UpdateSupercarById {

    my $id              = $_[0] || "";

} #


1