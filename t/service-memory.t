use strict;
use lib qw(t/lib);

use Test::More;

use Event::Processor;
use Event::Processor::Service::Memory

my $proc = Event::Processor->new;

{
    my $kernel = $proc->kernel;
    $kernel->add_service(
        Event::Processor::Service::Memory->new
    );
    my $mem = $kernel->fetch('memory')->get;
    $mem->remember('foo', 'bar');

}

{
    my $mem = $proc->kernel->fetch('memory')->get;
    cmp_ok($mem->recall('foo'), 'eq', 'bar', 'memory recalled');
}

done_testing;