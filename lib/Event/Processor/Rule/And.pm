package Event::Processor::Rule::And;
use Moose;

with 'Event::Processor::Rule', 'Event::Processor::Rule::Container';

sub evaluate {
    my ($self, $event, $kernel) = @_;

    foreach my $rule (@{ $self->rules }) {
        my $retval = $rule->evaluate($event);
        return 0 unless $retval;
    }

    return 1;
}

1;