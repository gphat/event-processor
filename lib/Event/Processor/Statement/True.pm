package Event::Processor::Statement::True;
use Moose;

with 'Event::Processor::Statement';

sub evaluate {
    return 1;
}

1;