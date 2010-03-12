package Event::Processor::Rule::Container;
use Moose::Role;

has rules => (
    traits => [qw(Array)],
    is => 'ro',
    isa => 'ArrayRef',
    predicate => 'has_rules'
);

1;