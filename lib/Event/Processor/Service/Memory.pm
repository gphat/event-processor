package Event::Processor::Service::Memory;
use Moose;

extends 'Bread::Board::ConstructorInjection';
with 'Bread::Board::LifeCycle::Singleton';

has '+name' => ( default => 'memory' );
has '+class' => ( default => 'Event::Processor::Memory' );

1;

__END__

=head1 NAME

Event::Processor::Service::Memory

=head1 DESCRIPTION

Service for L<Event::Processor::Memory>.

=head1 AUTHOR

Cory G Watson, C<< <gphat at cpan.org> >>

=head1 COPYRIGHT & LICENSE

Copyright 2010 Cory G Watson.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut

