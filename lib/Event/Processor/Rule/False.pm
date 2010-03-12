package Event::Processor::Rule::False;
use Moose;

with 'Event::Processor::Rule';

sub evaluate {
    return 0;
}

1;