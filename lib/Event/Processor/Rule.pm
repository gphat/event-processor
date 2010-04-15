package Event::Processor::Rule;
use Moose::Role;

has 'name' => (
    is => 'rw',
    isa => 'Str'
);

requires 'condition';
requires 'result';

1;

__END__

=head1 NAME

Event::Processor::Rule - A Rule

=head1 SYNOPSIS

    package My::Rule;
    use Moose;
    
    with 'Event::Processor::Rule';

    sub condition {
        my ($self, $kernel, $event) = @_;
        # Do something that results in a true or false, return it
    }

    sub result {
        my ($self, $kernel, $event) = @_;
        # This is executed if the condition returns true!
    }

=head1 DESCRIPTION

A rule is a unit of code that is evaluated whenever a pariticular event is
encountered.  If the C<condition> methods returns true then the C<result>
method will be called.  Since Event::Processor is single-threaded it is
recommended that you keep the code in these two methods to an B<absolute
minimum>.

=head1 AUTHOR

Cory G Watson, C<< <gphat at cpan.org> >>

=head1 COPYRIGHT & LICENSE

Copyright 2010 Cory G Watson.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut
