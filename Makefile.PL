use inc::Module::Install;

name     'Event-Processor';
all_from 'lib/Event/Processor.pm';
author   q{Cory G Watson <gphat@cpan.org>};
license  'perl';

build_requires 'Test::More';

requires 'Bread::Board';
requires 'Moose';
requires 'MooseX::Clone';

WriteAll;

