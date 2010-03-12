package Event::Processor::Service::Logger;
use Moose;

extends 'Bread::Board::ConstructorInjection';

has '+name' => ( default => 'logger' );
has '+class' => ( default => 'Log::Dispatch' );

1;