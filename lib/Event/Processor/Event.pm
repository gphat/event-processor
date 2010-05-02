package Event::Processor::Event;
use Moose;

use Event::Processor::Context;

has context => (
    is => 'ro',
    isa => 'Event::Processor::Context',
    default => sub { Event::Processor::Context->new },
    handles => [qw(param)]
);

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

1;

__END__

=head1 NAME

Event::Processor::Event - An event!

=head1 SYNOPSIS

    my $ctx = Event::Processor::Event->new(
        id => $id, # Maybe a UUID,
        name => 'tire.pressure_change',
        occurred => time, # defaults to time()
    );
    $ctx->param('tire', '0'); # Maybe front driver is 0?

=head1 DESCRIPTION

An event is a stimulus for Event::Processor.  Events are passed in and used
as input for rule evaluation.

=head1 ATTRIBUTES

=head2 context

This event's L<Event::Processor::Context>.  Defaults to a new instance of
same.

=head2 id

This event's ID

=head2 name

This event's name.

=head2 occurred

The time that ths event occurred.

=head1 METHODS

=head1 AUTHOR

Cory G Watson, C<< <gphat at cpan.org> >>

=head1 COPYRIGHT & LICENSE

Copyright 2010 Cory G Watson.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut
