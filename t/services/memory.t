use Test::More;

use Event::Processor;

my $proc = Event::Processor->new;

{
    my $mem = $proc->kernel->fetch('memory')->get;
    $mem->remember('foo', 'bar');
}

{
    my $mem = $proc->kernel->fetch('memory')->get;
    cmp_ok($mem->recall('foo'), 'eq', 'bar', 'memory recalled');
}

done_testing;