use strict;
use warnings;
use 5.026;

require Devel::Symdump;

package External::Mod::Tree {

  sub rec {
    my ($ns) = @_;
    for my $p ( Devel::Symdump->packages($ns) ) {
      print "package: $p\n";
      rec($p);
    }
  }

}

package A::B {
  package A::B::C::X { }

  External::Mod::Tree::rec('A');
}
