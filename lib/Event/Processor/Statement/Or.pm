package Event::Processor::Statement::Or;
use Moose;

with 'Event::Processor::Statement', 'Event::Processor::Statement::Container';

sub evaluate {
    my ($self, $event, $kernel) = @_;

    foreach my $stmt (@{ $self->statements }) {
        my $retval = $stmt->evaluate($event);
        return 1 if $retval;
    }

    return 0;
}

1;