package Event::Processor::Service::Logger;
use Moose;

extends 'Bread::Board::ConstructorInjection';
with 'Bread::Board::LifeCycle::Singleton';

has '+name' => ( default => 'logger' );
has '+class' => ( default => 'Log::Dispatch' );

1;

__END__

=head1 NAME

Event::Processor::Service::Logger - Log::Dispatch Logger service

=head1 SYNOPSIS

    my $proc = Event::Processor->new;

    my $log = $proc->kernel->fetch('logger')->get;

=head1 DESCRIPTION

Logging service included by default in L<Event::Processor::Kernel>.

=head1 AUTHOR

Cory G Watson, C<< <gphat at cpan.org> >>

=head1 COPYRIGHT & LICENSE

Copyright 2010 Cory G Watson.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut
