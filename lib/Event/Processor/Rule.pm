package Event::Processor::Rule;
use Moose::Role;

has 'name' => (
    is => 'rw',
    isa => 'Str'
);

requires 'condition';
requires 'result';

1;