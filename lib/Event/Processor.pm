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

has regex_rules => (
     traits => [qw(Hash)],
     is => 'ro',
     isa => 'HashRef',
     default => sub { {} },
     handles => {
         get_regex_rule => 'get',
         set_regex_rule => 'set'
     }
);

has rules => (
     traits => [qw(Hash)],
     is => 'ro',
     isa => 'HashRef[ArrayRef]',
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

sub add_rule {
    my ($self, $name, $rule) = @_;

    my $rules = $self->get_rule($name);
    if($rules) {
        push(@{ $rules }, $rule);
    } else {
        $self->set_rule($name, [ $rule ]);
    }
}

sub add_regex_rule {
    my ($self, $name, $rule) = @_;

    my $rules = $self->get_regex_rule($name);
    if($rules) {
        push(@{ $rules }, $rule);
    } else {
        $self->set_regex_rule($name, [ $rule ]);
    }
}

sub process {
    my ($self, $event) = @_;

    my $rules = $self->get_rule($event->name);
    if(defined($rules)) {
        foreach my $rule (@{ $rules }) {
            my $retval = $rule->condition($self->kernel, $event);
            if($retval) {
                $rule->result($self->kernel, $event);
            }
        }
    }

    my @regexes = keys(%{ $self->regex_rules });
    if(scalar(@regexes)) {
        foreach my $regex (@regexes) {
            if($event->name =~ $regex) {
                my $rules = $self->get_regex_rule($regex);
                foreach my $rule (@{ $rules }) {
                    my $retval = $rule->condition($self->kernel, $event);
                    if($retval) {
                        $rule->result($self->kernel, $event);
                    }
                }
            }
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

    my $rule = My::Rule->new;

    $proc->add_rule('foo.bar', $rule);

    my $event = Event::Processor::Event->new(
        id => 1,
        name => 'foo.bar'
    );
    
    $proc->process($event); # Stuff happens!

=head1 DESCRIPTION

Event::Processor is a naive implementation of Complex Event Processing
L<http://en.wikipedia.org/wiki/Complex_event_processing>.

Event::Processor allows you to define rules that will be executed when
certain events are processed.  When combined with a messaging mechanism and
some form of storage you can create a system that builds complex behaviors
from simple rules.

=head1 EXAMPLE

B<Note:> This example uses L<Event::Processor::Service::Redis> for storage.

The aforementioned Wikipedia article describes a CEP scenario where a car's
sensors react to changes in tire pressure.  We can build an example here
that will act the same way.

=head1 AUTHOR

Cory G Watson, C<< <gphat at cpan.org> >>

=head1 COPYRIGHT & LICENSE

Copyright 2010 Cory G Watson.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut
