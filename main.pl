use strict;
use CGI":standard";

# Error handling
use warnings;
use CGI::Carp qw(fatalsToBrowser);
#

use MongoDB;
require "controllers/controller.supercar.pl";

sub Main {

    my $db                          = MongoDB->connect();
    my $collection                  = $db->ns('cars.supercars');

    ### Inserting a single document
    print qq(Inserting a single Document...\n);

    my $document = $collection->insert_one( {
        brand => "Bugatti",
        model => "Chrion",
        trims => [
            {
                trim => "Base",
                price => 2998000
            },
            {
                trim => "Sport",
                price => 3260000
            }
        ]
    });

    my $documentdId = $document->inserted_id;

    print qq(... returned ID: $documentdId\n\n);
    ###

    ### Retrieving a single document by id
    print qq(Retrieving a single Document by id...\n);
    my $findDocument = $collection->find({ _id => $documentdId });
    my $retrievedDocument = $findDocument->next;

    foreach my $key (sort keys %{ $retrievedDocument }) {
        print qq(...$key: $retrievedDocument->{$key}\n);
    }
    print qq(\n\n);
    ###

    ### Inserting multiple documents into a collection
    print qq(Inserting a multiple Documents...\n);
    my $documents = $collection->insert_many([
        {
            brand => "McLaren",
            model => "720s",
            trims => [
                {
                    trim => "base",
                    price => 284745
                },
                {
                    trim => "Luxury",
                    price => 296175
                },
                {
                    trim => "Performance",
                    price => 296175
                }
            ]
        },
        {
            brand => "Lamborghini",
            model => "Huracan",
            trims => [
                {
                    trim => "LP580-2",
                    price => 199800
                },
                {
                    trim => "LP580-2S",
                    price => 219780
                },
                {
                    trim => "LP610-4",
                    price => 238600
                },
                {
                    trim => "LP610-4S",
                    price => 262450
                },
                {
                    trim => "Performante",
                    price => 274390
                }
            ]
        }
    ]);

    my $documents = $documents->inserted_ids;
    ###

}

&Main();
