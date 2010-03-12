use Test::More;

use Event::Processor::Event;
use Event::Processor::Rule::False;

my $r = Event::Processor::Rule::False->new;
my $e = Event::Processor::Event->new(name => 'hello.world', id => 1);
ok(!$r->evaluate($e), 'false');

done_testing;