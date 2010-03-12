package Event::Processor::Memory;
use Moose;

# Replace this with something good..

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