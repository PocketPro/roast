use Test;
plan 8;

# L<S03/"Junctive and (all) precedence"/"infix:<&>">

ok ?(1 S& 2),         "basic infix:<S&>";
ok ?(1 S& 2 S& 3), "basic infix:<S&> (multiple S&'s)";
ok !(0 S& 1),         "S& has and-semantics (first term 0)";
ok !(1 S& 0),         "also has and-semantics (second term 0)";

my $x = '';

ok ?('a' ~~ { $x ~= "b"; True } S& { $x ~= "c"; True }), 'S& with two blocks';
is $x, 'bc', 'blocks called in the right order';

my $executed = 0;

ok !('a' ~~ 'b' S& { $executed = 1; True }), 'and semantics';
ok !$executed,                            'short-circuit';

# vim: ft=perl6
