package Event::Processor::Rule::Or;
use Moose;

with 'Event::Processor::Rule', 'Event::Processor::Rule::Container';

sub evaluate {
    my ($self, $event, $kernel) = @_;

    foreach my $rule (@{ $self->rules }) {
        my $retval = $rule->evaluate($event);
        return 1 if $retval;
    }

    return 0;
}

1;