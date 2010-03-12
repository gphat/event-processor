use Test::More;

use Event::Processor;

my $proc = Event::Processor->new;

$proc->kernel->fetch('logger')->get->alert('WEEE');

my $mem = $proc->kernel->fetch('memory')->get;
$mem->remember('foo', 'bar');
cmp_ok($mem->recall('foo'), 'eq', 'bar', 'memory recalled');

done_testing;