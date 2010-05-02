use strict;
use lib qw(t/lib);

use Test::Exception;
use Test::More;

use Data::UUID;
use Event::Processor;
use Event::Processor::Context;
use Event::Processor::Event;
use Event::Processor::Rule;
use Event::Processor::Service::Memory;
use Rule::PressureMonitor;

my $uuid = Data::UUID->new;
my $proc = Event::Processor->new;

my $kernel = $proc->kernel;
$kernel->add_service(
    Event::Processor::Service::Memory->new
);

my $rule = Rule::PressureMonitor->new;

$proc->add_rule('tire.pressure_change', $rule);

lives_ok {
    $proc->process(generate_tire_pressure_change(41));
} 'tire pressure ok';

dies_ok {
    $proc->process(generate_tire_pressure_change(39));
} 'tire pressure low';

done_testing;

sub generate_tire_pressure_change {
    my ($val) = @_;

    my $ctx = Event::Processor::Context->new(
        params => {
            tire => 0,
            pressure => $val
        }
    );

    return Event::Processor::Event->new(
        id      => $uuid->create_str,
        name    => 'tire.pressure_change',
        context => $ctx
    );
}