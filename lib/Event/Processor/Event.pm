package Event::Processor::Event;
use Moose;

# Unique ID that identifies this event.
has id => (
    is => 'ro',
    isa => 'Str',
    required => 1
);

# This event's name
has name => (
    is => 'ro',
    isa => 'Str',
    required => 1
);

has occurred => (
    is => 'ro',
    isa => 'Num',
    default => sub { time() }
);

has parameters => (
    traits  => [ 'Hash' ],
    is      => 'rw',
    isa     => 'HashRef[Str]',
    default => sub { {} },
    handles => {
        parameters_names=> 'keys',
        get_parameter   => 'get',
        set_parameter   => 'set',
    },
);

1;

__END__

=head1 NAME

Event::Processor::Event - Naive "memory" service

=head1 SYNOPSIS

    my $proc = Event::Processor->new;

    my $log = $proc->kernel->fetch('memory')->get;

=head1 DESCRIPTION

Naive memory service.  Useful for testing.

=head1 AUTHOR

Cory G Watson, C<< <gphat at cpan.org> >>

=head1 COPYRIGHT & LICENSE

Copyright 2010 Cory G Watson.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut
