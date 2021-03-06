package Finance::VolSurface::Types;

use strict;
use warnings;

use Type::Tiny;
use Type::Library -base;

=head2 finance_volsurface_type

Volatility surface types.

=cut

my @surface_types = qw(delta flat moneyness);
my $regex = '(' . join('|', @surface_types) . ')';
my $type = "Type::Tiny"->new(
    name       => "Finance_VolSurface_Type",
    constraint => sub { 
        /^$regex$/;
    },
    message    => sub {
        "Invalid surface type $_. Must be one of: " . join(', ', @surface_types);
    },
);

__PACKAGE__->meta->add_type($type);
__PACKAGE__->meta->make_immutable;

1;

