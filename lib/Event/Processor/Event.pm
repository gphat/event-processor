package Event::Processor::Event;
use Moose;

has name => (
    is => 'ro',
    isa => 'Str',
    predicate => 'has_name'
);

has params => (
    traits => [qw(Hash)],
    is => 'ro',
    isa => 'HashRef'
);

1;