package Event::Processor::Statement::Container;
use Moose::Role;

has statements => (
    traits => [qw(Array)],
    is => 'ro',
    isa => 'ArrayRef',
    predicate => 'has_statements'
);

1;