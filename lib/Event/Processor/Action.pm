package Event::Processor::Action;
use Moose;

has name => (
    is => 'ro',
    isa => 'Str',
    required => 1
);

1;