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

# $mq->exchange_declare(1, 'foobar', { exchange_type => 'topic' });
# $mq->queue_declare(1, 'barbaz', { });
# $mq->queue_bind(1, 'barbaz', 'foobar', 'foo.bar');

foreach(1..1000) {
    $mq->publish(1, 'foo.bar', $uuid->create_str, { exchange => 'foobar' });
    print ".";
}
print "\n";

$mq->disconnect();