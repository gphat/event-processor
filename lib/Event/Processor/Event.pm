package Event::Processor::Event;
use Moose;

# The combination of event name and id must be unique.

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