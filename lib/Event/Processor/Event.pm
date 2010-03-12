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

# How long this event is retained
has time_to_live => (
    is => 'ro',
    isa => 'Num',
    default => 0
);

1;