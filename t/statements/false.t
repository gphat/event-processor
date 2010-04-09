use Test::More;

use Event::Processor::Event;
use Event::Processor::Statement::False;

my $r = Event::Processor::Statement::False->new;
my $e = Event::Processor::Event->new(name => 'hello.world', id => 1);
ok(!$r->evaluate($e), 'false');

done_testing;