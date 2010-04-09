package Event::Processor::Statement::And;
use Moose;

with 'Event::Processor::Statement', 'Event::Processor::Statement::Container';

sub evaluate {
    my ($self, $event, $kernel) = @_;

    foreach my $stmt (@{ $self->statements }) {
        my $retval = $stmt->evaluate($event);
        return 0 unless $retval;
    }

    return 1;
}

1;