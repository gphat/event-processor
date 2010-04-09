use Test::More;

use Event::Processor::Event;
use Event::Processor::Statement::True;

my $true = Event::Processor::Statement::True->new;
my $e = Event::Processor::Event->new(name => 'hello.world', id => 1);
ok($true->evaluate($e), 'true');

done_testing;