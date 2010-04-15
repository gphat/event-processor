use strict;
use lib qw(t/lib);

use Test::More;

use Event::Processor;
use Event::Processor::Event;
use Event::Processor::Rule;
use Event::Processor::Service::Memory;
use Rule::True;

my $proc = Event::Processor->new;

my $kernel = $proc->kernel;
$kernel->add_service(
    Event::Processor::Service::Memory->new
);

my $rule = Rule::True->new;

$proc->set_rule('foo.bar', $rule);

my $event = Event::Processor::Event->new(
    id => 1,
    name => 'foo.bar'
);

$proc->process($event);

my $mem = $proc->kernel->fetch('memory')->get;
cmp_ok($mem->recall('foo'), 'eq', 'bar', 'memory recalled, true ran');

done_testing;