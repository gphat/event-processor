use Test::More;

use Event::Processor::Event;
use Event::Processor::Statement::Or;
use Event::Processor::Statement::False;
use Event::Processor::Statement::True;

{
    my $true = Event::Processor::Statement::True->new;
    my $true2 = Event::Processor::Statement::True->new;
    my $r = Event::Processor::Statement::Or->new(statements => [ $true, $true2 ]);

    my $e = Event::Processor::Event->new(name => 'hello.world', id => 1);
    ok($r->evaluate($e), 'two true');
}

{
    my $t = Event::Processor::Statement::True->new;
    my $f = Event::Processor::Statement::False->new;
    my $r = Event::Processor::Statement::Or->new(statements => [ $t, $f ]);

    my $e = Event::Processor::Event->new(name => 'hello.world', id => 1);
    ok($r->evaluate($e), 'one true, one false');
}

{
    my $f = Event::Processor::Statement::False->new;
    my $f2 = Event::Processor::Statement::False->new;
    my $r = Event::Processor::Statement::Or->new(statements => [ $f, $f2 ]);
    my $e = Event::Processor::Event->new(name => 'hello.world', id => 1);
    ok(!$r->evaluate($e), 'two false');
}

done_testing;