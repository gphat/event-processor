package Event::Processor::Service::Memory;
use Moose;

extends 'Bread::Board::ConstructorInjection';

has '+name' => ( default => 'memory' );
has '+class' => ( default => 'Event::Processor::Memory' );

1;