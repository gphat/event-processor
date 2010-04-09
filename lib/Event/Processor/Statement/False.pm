package Event::Processor::Statement::False;
use Moose;

with 'Event::Processor::Statement';

sub evaluate {
    return 0;
}

1;