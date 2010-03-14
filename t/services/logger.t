use Test::More;

use Event::Processor;

my $proc = Event::Processor->new;

my $log = $proc->kernel->fetch('logger')->get;
ok(defined($log), 'got log');

done_testing;