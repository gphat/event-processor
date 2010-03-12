package Event::Processor;
use Moose;
use warnings;
use strict;

our $VERSION = '0.01';

use Event::Processor::Kernel;
use Event::Processor::Service::Logger;

has kernel => (
    is => 'ro',
    isa => 'Event::Processor::Kernel',
    lazy_build => 1,
);

sub _build_kernel {
    my ($self) = @_;

    my $k = Event::Processor::Kernel->new(name => 'kernel');
    $k->add_service(
        Event::Processor::Service::Logger->new(
            params => {
                outputs => [
                    [
                        'Screen',
                        min_level   => 'debug',
                        stderr      => 1,
                        newline     => 1
                    ]
                ]
            }
        )
    );
    return $k;
}

# has rules => (
#     traits => [qw(Array)],
#     is => 'ro',
#     isa => 'ArrayRef[]'
#     default => []
# );

1;

__END__

=head1 NAME

Event::Processor - The great new Event::Processor!

=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Event::Processor;

    my $foo = Event::Processor->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.


=head1 AUTHOR

Cory G Watson, C<< <gphat at cpan.org> >>

=head1 COPYRIGHT & LICENSE

Copyright 2010 Cory G Watson.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut
