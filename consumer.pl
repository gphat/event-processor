use strict;

use Net::RabbitMQ;
use Data::UUID;
use Event::Processor;
use Event::Processor;
use Event::Processor::Event;
use Event::Processor::Rule;
use Rule::True;
use Data::Dumper;

my $uuid = Data::UUID->new;

my $mq = Net::RabbitMQ->new;
$mq->connect("10.0.1.13", { user => "guest", password => "guest" });

$mq->channel_open(1);

# $mq->publish(1, "queuename", "Hi there!");
$mq->exchange_declare(1, 'foobar', { exchange_type => 'direct', durable => 1 });
$mq->queue_declare(1, 'barbaz', { durable => 1 });
$mq->queue_bind(1, 'barbaz', 'foobar', 'foo.bar');

my $proc = Event::Processor->new;

my $rule = Rule::True->new;

$proc->set_rule('foo.bar', $rule);

my $msg = $mq->consume(1, 'barbaz', { no_ack => 0 });

while(1) {
    my $foo = $mq->recv;
    my $event = Event::Processor::Event->new(
        id => $foo->{body},
        name => 'foo.bar'
    );
    $proc->process($event);
    $mq->ack(1, $foo->{delivery_tag}, 0);
}

$mq->disconnect();
