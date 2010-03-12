use Test::More;

use Event::Processor::Event;
use Event::Processor::Rule::And;
use Event::Processor::Rule::False;
use Event::Processor::Rule::True;

my $true = Event::Processor::Rule::True->new;
my $true2 = Event::Processor::Rule::True->new;
my $r = Event::Processor::Rule::And->new(rules => [ $true, $true2 ]);

my $e = Event::Processor::Event->new(name => 'hello.world', id => 1);
ok($r->evaluate($e), 'two true');

done_testing;