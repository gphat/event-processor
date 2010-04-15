package Event::Processor;
use Moose;
use warnings;
use strict;

our $VERSION = '0.01';

use Event::Processor::Kernel;
use Event::Processor::Service::Memory;
use Event::Processor::Service::Logger;

has kernel => (
    is => 'ro',
    isa => 'Event::Processor::Kernel',
    lazy_build => 1,
);

has rules => (
     traits => [qw(Hash)],
     is => 'ro',
     isa => 'HashRef',
     default => sub { {} },
     handles => {
         get_rule => 'get',
         set_rule => 'set'
     }
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

sub process {
    my ($self, $event) = @_;

    my $rule = $self->get_rule($event->name);
    if(defined($rule)) {
        my $retval = $rule->condition($self->kernel, $event);
        if($retval) {
            $rule->result($self->kernel, $event);
        }
    }
}

1;

__END__

=head1 NAME

Event::Processor - Event Processing system

=head1 SYNOPSIS

    use Event::Processor;

    my $proc = Event::Processor->new;

    $proc->process($event); # Stuff happens!

=head1 DESCRIPTION

Event::Processor is a naive implementation of Complex Event Processing
L<http://en.wikipedia.org/wiki/Complex_event_processing>.

=head1 AUTHOR

Cory G Watson, C<< <gphat at cpan.org> >>

=head1 COPYRIGHT & LICENSE

Copyright 2010 Cory G Watson.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut
