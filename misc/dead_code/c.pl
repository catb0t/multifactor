#! perl
use strict;
use warnings;
use 5.026;

package A::B {

    # do {
        package A::B::CCC::DDDD::X { };
    # };

    sub r {
      my ($x) = @_;
      for my $key (%A::) {
        print "$key\n";
        if ( (my $m = $key) =~ /(.+)::$/) {
          r($x)
        }
      }
    }

}
