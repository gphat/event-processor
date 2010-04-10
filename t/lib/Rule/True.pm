package #
    Rule::True;
use Moose;

with 'Event::Processor::Rule';

sub condition {
    my ($self, $kernel, $event) = @_;

    return 1;
}

sub result {
    my ($self, $kernel, $event) = @_;

    my $mem = $kernel->fetch('memory')->get;
    $mem->remember('foo', 'bar');
}