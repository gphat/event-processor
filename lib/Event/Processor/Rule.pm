package Event::Processor::Rule;
use Moose::Role;

has name => (
    is => 'ro',
    isa => 'Str',
    predicate => 'has_name'
);

requires 'evaluate';

1;