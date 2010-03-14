use Test::More;

use Event::Processor::Event;
use Event::Processor::Rule::Or;
use Event::Processor::Rule::False;
use Event::Processor::Rule::True;

{
    my $true = Event::Processor::Rule::True->new;
    my $true2 = Event::Processor::Rule::True->new;
    my $r = Event::Processor::Rule::Or->new(rules => [ $true, $true2 ]);

    my $e = Event::Processor::Event->new(name => 'hello.world', id => 1);
    ok($r->evaluate($e), 'two true');
}

{
    my $t = Event::Processor::Rule::True->new;
    my $f = Event::Processor::Rule::False->new;
    my $r = Event::Processor::Rule::Or->new(rules => [ $t, $f ]);

    my $e = Event::Processor::Event->new(name => 'hello.world', id => 1);
    ok($r->evaluate($e), 'one true, one false');
}

{
    my $f = Event::Processor::Rule::False->new;
    my $f2 = Event::Processor::Rule::False->new;
    my $r = Event::Processor::Rule::Or->new(rules => [ $f, $f2 ]);
    my $e = Event::Processor::Event->new(name => 'hello.world', id => 1);
    ok(!$r->evaluate($e), 'two false');
}

done_testing;