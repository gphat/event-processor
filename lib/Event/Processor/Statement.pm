package Event::Processor::Statement;
use Moose::Role;

has name => (
    is => 'ro',
    isa => 'Str',
    predicate => 'has_name'
);

requires 'evaluate';

1;