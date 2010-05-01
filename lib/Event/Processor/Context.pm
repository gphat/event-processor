package Event::Processor::Context;
use Moose;

with 'MooseX::Param';

1;

__END__

=head1 NAME

Event::Processor::Context - A Context for event processing

=head1 SYNOPSIS

    my $context = Event::Processor::Context->new;
    $context->param('order', $order);

=head1 DESCRIPTION

A Context is a dataset that is used during the evaluation of a rule.

=head1 AUTHOR

Cory G Watson, C<< <gphat at cpan.org> >>

=head1 COPYRIGHT & LICENSE

Copyright 2010 Cory G Watson.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut
