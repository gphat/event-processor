package #
    Rule::PressureMonitor;
use Moose;

with 'Event::Processor::Rule';

sub condition {
    my ($self, $kernel, $event) = @_;

    my $press = $event->param('pressure');
    if($press < 40) {
        return 1;
    }

    return 0;
}

sub result {
    my ($self, $kernel, $event) = @_;

    die('Tire Pressure Low!');
}