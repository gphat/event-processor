package Event::Processor::Memory;
use Moose;

# Replace this with something good..  As it stands it's a very naive expiring
# implementation.  Should probably use Tie::Hash::Expire or something...

has memory => (
    traits => [qw(Hash)],
    is => 'ro',
    isa => 'HashRef',
    default => sub { {} },
    handles => {
        memory_get  => 'get',
        memory_set  => 'set',
        forget      => 'delete'
    }
);

# Should probably use MX::Method::Signatures here
sub remember {
    my ($self, $key, $value, $duration) = @_;
    $duration ||= 0;

    $self->memory_set($key, { value => $value, expires => time + $duration });
}

sub recall {
    my ($self, $value) = @_;

    my $thing = $self->memory_get($value);
    return undef unless(defined($thing));
    if(time > $thing->{expires}) {
        $self->forget($value);
        return undef;
    }

    return $thing->{value};
}

1;

__END__

=head1 NAME

Event::Processor::Service::Memory - Naive "memory" service

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
