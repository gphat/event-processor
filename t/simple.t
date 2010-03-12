use Test::More;

use Event::Processor;

my $proc = Event::Processor->new;

$proc->kernel->fetch('logger')->get->alert('WEEE');

done_testing;