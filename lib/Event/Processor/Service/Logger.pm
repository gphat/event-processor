package Event::Processor::Service::Logger;
use Moose;

extends 'Bread::Board::ConstructorInjection';
with 'Bread::Board::LifeCycle::Singleton';

has '+name' => ( default => 'logger' );
has '+class' => ( default => 'Log::Dispatch' );

1;