package Event::Processor::Rule::True;
use Moose;

with 'Event::Processor::Rule';

sub evaluate {
    return 1;
}

1;