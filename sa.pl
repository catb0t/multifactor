
use lib ("\/home\/cat\/perl5\/lib\/perl5");

use Sidef;

binmode( STDIN,  ':utf8' );
binmode( STDOUT, ':utf8' );
binmode( STDERR, ':utf8' ) if $^P == 0;

package Sidef::Runtime {
    use utf8;
    use 5.026;

    use constant {
        String944210018565441 =>
          Sidef::Types::String::String->new("clone_call"),
        String944210054320001 =>
          Sidef::Types::String::String->new("catch_msg_ref"),
        Null944210016376320 => Sidef::Types::Null::Null->new(),
        String944210054341121 =>
          Sidef::Types::String::String->new("retval_ref"),
        String944210015588881 => Sidef::Types::String::String->new("args"),
        String944210049041921 => Sidef::Types::String::String->new(
"invalid\ spec\ when\ calling\ has_overload\:\ caller\ must\ identify\ themself"
        ),
        String944210054725361 => Sidef::Types::String::String->new("caller"),
        String944210054744081 => Sidef::Types::String::String->new(
"invalid\ spec\ when\ calling\ has_overload\;\ name\ must\ be\ nonempty"
        ),
        String944210054753681 => Sidef::Types::String::String->new("name"),
        String944210043740481 => Sidef::Types::String::String->new(
"invalid\ spec\ when\ calling\ has_overload\;\ args\ must\ be\ iterable"
        ),
        String944210043754641 => Sidef::Types::String::String->new("\.\.\."),
        String944210060540081 =>
          Sidef::Types::String::String->new("\	\	invocation\ worked\!"),
        String944210060559521 => Sidef::Types::String::String->new("\	\	"),
        String944210049042641 =>
          Sidef::Types::String::String->new("invocation\ failed\!\ reason\:\ "),
        Number944210060616001 => Sidef::Types::Number::Number->_set_uint('120'),
        Number944210060837761 => Sidef::Types::Number::Number->_set_uint('50'),
        Number944210060848561 => Sidef::Types::Number::Number->_set_uint('70'),
        String944210061178881 =>
          Sidef::Types::String::String->new("has_public_concrete_method"),
        Regex944210061424642 =>
          Sidef::Types::Regex::Regex->new( "does\ not\ match", "" ),
        String944210062611441 =>
          Sidef::Types::String::String->new("has_public_concrete_overload"),
        String944210062714321 =>
          Sidef::Types::String::String->new("is_property"),
        String944210062906401 =>
          Sidef::Types::String::String->new("extra_garbage_arg"),
        String944210063518881 =>
          Sidef::Types::String::String->new("serial_properties"),
        Regex944210063380482 => Sidef::Types::Regex::Regex->new(
            "\^Sidef\:\:Runtime\:\:\\d\+\:\:\(main\:\:\.\+\)\$", ""
        ),
        Number944210063509761 => Sidef::Types::Number::Number->_set_uint('0'),
        String944210063408081 =>
          Sidef::Types::String::String->new("compile_to_perl"),
        String944210063410961 =>
          Sidef::Types::String::String->new("code_interactive"),
        String944210064968161 =>
          Sidef::Types::String::String->new("maybe_call_custom_init"),
        String944210064973441 =>
          Sidef::Types::String::String->new("INIT_METHOD_NAME"),
        String944210064182721 =>
          Sidef::Types::String::String->new("process_serial_prop_rhs"),
        String944210064191121 =>
          Sidef::Types::String::String->new("merge_reduce"),
        String944210064169281 => Sidef::Types::String::String->new(
            "RHS\ in\ serial\ property\ declaration\ \'"),
        String944210065600481 =>
          Sidef::Types::String::String->new("\'\ isn\'t\ a\ typename\:\ \'"),
        String944210065605761 => Sidef::Types::String::String->new(
            "\'\ \(perhaps\ you\ accidentally\ initialised\ the\ object\?\)"),
        String944210065910081 => Sidef::Types::String::String->new(
            "\/home\/cat\/Sync\/projects\/git\/multifactor\/ABCs2\.sm"),
        Number944210065914161 => Sidef::Types::Number::Number->_set_uint('159'),
        Number944210065902401 => Sidef::Types::Number::Number->_set_uint('1'),
        Number944210066286721 => Sidef::Types::Number::Number->_set_uint('2'),
        String944210066393761 =>
          Sidef::Types::String::String->new("_serial_value"),
        Regex944210065602642 =>
          Sidef::Types::Regex::Regex->new( "\^serial_properties", "" ),
        String944210066646721 => Sidef::Types::String::String->new("merge"),
        String944210064551121 => Sidef::Types::String::String->new("property"),
        String944210064668001 => Sidef::Types::String::String->new("serialize"),
        String944210067615601 => Sidef::Types::String::String->new("getter"),
        Number944210068472241 => Sidef::Types::Number::Number->_set_uint('217'),
        String944210066404081 => Sidef::Types::String::String->new(
            "appears\ to\ be\ neither\ a\ property\ nor\ declared\ getter"),
        String944210069164881 =>
          Sidef::Types::String::String->new("unserialize"),
        Number944210069381681 => Sidef::Types::Number::Number->_set_uint('271'),
        String944210067708561 => Sidef::Types::String::String->new(
            "appears\ to\ be\ neither\ a\ property\ nor\ declared\ setter"),
        Regex944210069331762 =>
          Sidef::Types::Regex::Regex->new( "\^init_steps", "" ),
        Number944210066501281 => Sidef::Types::Number::Number->_set_uint('330'),
        String944210066505601 =>
          Sidef::Types::String::String->new("_bound_accessor_generator"),
        String944210072934801 => Sidef::Types::String::String->new(
            "class\ already\ has\ property\ accessor\ named\ \'"),
        String944210072946321 => Sidef::Types::String::String->new(
"\'\ \(did\ you\ forget\ to\ declare\ a\ raw\ property\ with\ a\ leading\ \'_\'\ underscore\?\)"
        ),
        String944210073004401 => Sidef::Types::String::String->new("_"),
        Number944210073201761 => Sidef::Types::Number::Number->_set_uint('343'),
        String944210073323201 => Sidef::Types::String::String->new("get"),
        String944210073633521 => Sidef::Types::String::String->new("set"),
        Regex944210073982722  => Sidef::Types::Regex::Regex->new(
            "\^serial_property_generator\(\[_\\w\]\+\)\$", ""
        ),
        String944210073984881 =>
          Sidef::Types::String::String->new("attempt\ of\ write\ to\ locked\ "),
        String944210073985841 => Sidef::Types::String::String->new("Lockable"),
        String944210074335121 =>
          Sidef::Types::String::String->new("\ object\!"),
        String944210074646321 => Sidef::Types::String::String->new(""),
        String944210074633841 => Sidef::Types::String::String->new("algo"),
        String944210074639121 => Sidef::Types::String::String->new("names"),
        String944210074641521 => Sidef::Types::String::String->new("contents"),
        String944210074778881 =>
          Sidef::Types::String::String->new("basis_ignored"),
        String944210074887681 => Sidef::Types::String::String->new("vm"),
        String944210074890561 => Sidef::Types::String::String->new("core"),
        String944210074769761 => Sidef::Types::String::String->new("basis"),
        String944210075108561 => Sidef::Types::String::String->new("lib"),
        String944210075110961 => Sidef::Types::String::String->new("boot"),
        String944210075278881 => Sidef::Types::String::String->new("data"),
        String944210075284641 => Sidef::Types::String::String->new("sum"),
        String944210075442961 => Sidef::Types::String::String->new("created"),
        String944210075584321 => Sidef::Types::String::String->new("modified"),
        String944210075586721 => Sidef::Types::String::String->new("accessed"),
        String944210075403121 =>
          Sidef::Types::String::String->new("tombstoned"),
        String944210076302881 => Sidef::Types::String::String->new("_format"),
        String944210076404081 => Sidef::Types::String::String->new("_fullname"),
        String944210075620561 => Sidef::Types::String::String->new("id"),
        String944210075736481 =>
          Sidef::Types::String::String->new("factor_version"),
        String944210075741041 => Sidef::Types::String::String->new("is_git"),
        String944210075746081 =>
          Sidef::Types::String::String->new("git_branch"),
        String944210075750641 => Sidef::Types::String::String->new("git_hash"),
        String944210075755201 => Sidef::Types::String::String->new("os_type"),
        String944210075759761 => Sidef::Types::String::String->new("os_name"),
        String944210075911441 => Sidef::Types::String::String->new("arch_name"),
        String944210075916001 => Sidef::Types::String::String->new("word_size"),
        String944210075920561 =>
          Sidef::Types::String::String->new("stored_boot_image"),
        String944210075925121 => Sidef::Types::String::String->new("src_sums"),
        String944210075929681 => Sidef::Types::String::String->new("blob_sums"),
        String944210075934241 =>
          Sidef::Types::String::String->new("blob_algorithm"),
        String944210075940481 => Sidef::Types::String::String->new("sha256"),
        String944210076014961 =>
          Sidef::Types::String::String->new("_blob_algorithm"),
        String944210076022641 => Sidef::Types::String::String->new("timespec"),
        String944210075730961 => Sidef::Types::String::String->new("image"),
        String944210076600001 => Sidef::Types::String::String->new("1"),
        String944210076607441 => Sidef::Types::String::String->new("0\.99"),
        String944210076614401 => Sidef::Types::String::String->new("master"),
        String944210076737281 =>
          Sidef::Types::String::String->new("2349876234"),
        String944210076742321 => Sidef::Types::String::String->new("unix"),
        String944210076746881 => Sidef::Types::String::String->new("linux"),
        String944210076751441 => Sidef::Types::String::String->new("x86"),
        String944210076756001 => Sidef::Types::String::String->new("64"),
    };
    my $in_scope94421002557640;
    state $in_scope_code94421002557640 =
      UNIVERSAL::can( "Sidef\:\:Object\:\:Object", "in_scope" );
    my $cleave94421002296960;
    state $cleave_code94421002296960 =
      UNIVERSAL::can( "Sidef\:\:Object\:\:Object", "cleave" );
    my $declares_method94421002096104;
    state $declares_method_code94421002096104 =
      UNIVERSAL::can( "Sidef\:\:Object\:\:Object", "declares_method" );
    my $has_overload94421002062272;
    state $has_overload_code94421002062272 =
      UNIVERSAL::can( "Sidef\:\:Object\:\:Object", "has_overload" );
    my $has_public_concrete_method94421002036976;
    state $has_public_concrete_method_code94421002036976 =
      UNIVERSAL::can( "Sidef\:\:Object\:\:Object",
        "has_public_concrete_method" );
    my $has_public_concrete_overload94421006104744;
    state $has_public_concrete_overload_code94421006104744 =
      UNIVERSAL::can( "Sidef\:\:Object\:\:Object",
        "has_public_concrete_overload" );
    my $is_property94421006226912;
    state $is_property_code94421006226912 =
      UNIVERSAL::can( "Sidef\:\:Object\:\:Object", "is_property" );
    my $grep_methods94421006271240;
    state $grep_methods_code94421006271240 =
      UNIVERSAL::can( "Sidef\:\:Object\:\:Object", "grep_methods" );
    my $grep_map_methods94421006298120;
    state $grep_map_methods_code94421006298120 =
      UNIVERSAL::can( "Sidef\:\:Object\:\:Object", "grep_map_methods" );
    my $all94421006326752;
    state $all_code94421006326752 =
      UNIVERSAL::can( "Sidef\:\:Types\:\:Array\:\:Array", "all" );
    my $merge_reduce94421006326992;
    state $merge_reduce_code94421006326992 =
      UNIVERSAL::can( "Sidef\:\:Types\:\:Array\:\:Array", "merge_reduce" );
    my $is_serializable94421006311928;
    my $fqtn_to_umdtn94421006327232;
    my $is_typename94421006350064;
    my $is_fqco94421006338888;
    my $is_a_fqco94421006394792;
    my $maybe_call_custom_init94421006358656;
    my $process_serial_prop_rhs94421006510408;
    my $new94421006419832;
    my $_grep_serial_properties94421006640000;
    my $_do_serial94421006408888;
    my $_is_serialized_obj94421006664000;
    my $serialize94421006665872;
    my $unserialize94421006710744;
    my $new94421006960536;
    my $_serial_eq94421006960728;
    my $__NONANN__94421006962432;
    my $_call_methods_blocks_by94421006960344;
    my $new94421007250912;
    my $init94421007251104;
    my $new94421007271200;
    my $_bound_accessor_generator94421006156408;
    my $_property_generator94421007383488;
    my $new94421007432528;
    my $lock94421007418800;
    my $lock94421007436392;
    my $unlock94421007418224;
    my $new94421002517896;
    my $new94421007477312;
    my $new94421007508672;
    my $__NONANN__94421007520928;
    my $new94421007530000;
    my $new94421007543816;
    my $new94421007572088;
    my $gen94421007631104;
    my ($bo94421007659016);
    my ($f94421007676776);
    my ($new_bo94421007677592);
    use Sidef::Object::Object;
    use Sidef::Types::Array::Array;
    no warnings 'experimental::smartmatch';
    use Sidef::Types::String::String;
    use Sidef::Types::Hash::Hash;
    BEGIN { $Sidef::Runtime::OP4394421007688824     = "\+" }
    BEGIN { $Sidef::Runtime::OP46464694421007688824 = "\.\.\." }
    BEGIN { $Sidef::Runtime::OP6294421007688824     = "\>" }
    use Sidef::Types::Bool::Bool;
    use Sidef::Types::Block::Block;
    BEGIN { $Sidef::Runtime::OP6112694421007688824 = "\=\~" }
    require Memoize;
    BEGIN { $Sidef::Runtime::OP616194421007688824 = "\=\=" }
    use Sidef::Types::Regex::Regex;
    use constant serial_pg_name94421007398728 =>
      do { (Sidef::Runtime::Regex944210073982722) };
    use Sidef::Types::Number::Number;
    use Sidef::Types::Glob::File;
    do {

        package Sidef::Object::Object {
            $in_scope94421002557640 = Sidef::Types::Block::Block->new(
                code => sub {
                    my ( $self94421002600816, $b94421002519600 ) = @_;
                    my @return;
                    return do { ($b94421002519600)->run($self94421002600816) };
                  END94421002520152: @return;
                },
                type      => "method",
                name      => "in_scope",
                class     => "Sidef\:\:Object\:\:Object",
                namespace => "ABCs2",
                vars      => [ { name => "self" }, { name => "b" } ],
                table => { "self" => 0, "b" => 1 },
                (
                    defined($in_scope_code94421002557640)
                    ? (
                        kids => [
                            Sidef::Types::Block::Block->new(
                                code => $in_scope_code94421002557640
                            )
                        ]
                      )
                    : ()
                )
            );
            state $_94421002557640= do {
                no strict 'refs';
                $Sidef::Object::Object::__SIDEF_CLASS_METHODS__{'in_scope'} =
                  $in_scope94421002557640;
                *{"Sidef\:\:Object\:\:Object\:\:in_scope"} =
                  sub { $in_scope94421002557640->call(@_) }
            };
            $cleave94421002296960 = Sidef::Types::Block::Block->new(
                code => sub {
                    my ( $self94421002258344, @b94421002258104 ) = @_;
                    my $b94421002258104 =
                      bless( \@b94421002258104, 'Sidef::Types::Array::Array' );
                    my @return;
                    return do {
                        ($b94421002258104)->map(
                            Sidef::Types::Block::Block->new(
                                code => sub {
                                    my ($_94421002295088) = @_;
                                    ($_94421002295088)
                                      ->run($self94421002258344);
                                },
                                type      => "block",
                                name      => "__BLOCK__",
                                class     => "Sidef\:\:Object\:\:Object",
                                namespace => "ABCs2",
                                vars      => [ { name => "_" } ],
                                table => { "_" => 0 }
                            )
                        );
                    };
                  END94421002258464: @return;
                },
                type      => "method",
                name      => "cleave",
                class     => "Sidef\:\:Object\:\:Object",
                namespace => "ABCs2",
                vars => [ { name => "self" }, { name => "b", slurpy => 1 } ],
                table => { "self" => 0, "b" => 1 },
                (
                    defined($cleave_code94421002296960)
                    ? (
                        kids => [
                            Sidef::Types::Block::Block->new(
                                code => $cleave_code94421002296960
                            )
                        ]
                      )
                    : ()
                )
            );
            state $_94421002296960= do {
                no strict 'refs';
                $Sidef::Object::Object::__SIDEF_CLASS_METHODS__{'cleave'} =
                  $cleave94421002296960;
                *{"Sidef\:\:Object\:\:Object\:\:cleave"} =
                  sub { $cleave94421002296960->call(@_) }
            };
            do {
                $declares_method94421002096104 =
                  Sidef::Types::Block::Block->new(
                    code => sub {
                        my ( $self94421002062032, $name94421002061768 ) = @_;
                        my @return;
                        return do {
                            ($self94421002062032)->grep_methods(
                                Sidef::Types::Block::Block->new(
                                    code => sub {
                                        my ( $n94421002095096,
                                            $_94421002095432 ) = @_;
                                        do {
                                            my $bool = do { ($n94421002095096) }
                                              ~~ do { ($name94421002061768) };
                                            ref($bool) ? $bool
                                              : ( $bool
                                                ? Sidef::Types::Bool::Bool::TRUE
                                                : Sidef::Types::Bool::Bool::FALSE
                                              );
                                          }
                                    },
                                    type      => "block",
                                    name      => "__BLOCK__",
                                    class     => "Sidef\:\:Object\:\:Object",
                                    namespace => "ABCs2",
                                    vars =>
                                      [ { name => "n" }, { name => "_" } ],
                                    table => { "n" => 0, "_" => 1 }
                                )
                            );
                        };
                      END94421002062200: @return;
                    },
                    type      => "method",
                    name      => "declares_method",
                    class     => "Sidef\:\:Object\:\:Object",
                    namespace => "ABCs2",
                    vars      => [
                        { name => "self" },
                        {
                            name => "name",
                            type => "Sidef\:\:Types\:\:String\:\:String"
                        }
                    ],
                    table => { "self" => 0, "name" => 1 },
                    (
                        defined($declares_method_code94421002096104)
                        ? (
                            kids => [
                                Sidef::Types::Block::Block->new(
                                    code => $declares_method_code94421002096104
                                )
                            ]
                          )
                        : ()
                    )
                  );
                $declares_method94421002096104->{returns} =
                  ["Sidef\:\:Types\:\:Hash\:\:Hash"];
                $declares_method94421002096104;
            };
            state $_94421002096104= do {
                no strict 'refs';
                $Sidef::Object::Object::__SIDEF_CLASS_METHODS__{
                    'declares_method'} = $declares_method94421002096104;
                *{"Sidef\:\:Object\:\:Object\:\:declares_method"} =
                  sub { $declares_method94421002096104->call(@_) }
            };
            do {
                $has_overload94421002062272 = Sidef::Types::Block::Block->new(
                    code => sub {
                        my ( $self94421002036736, $overload_spec94421002036496 )
                          = @_;
                        my @return;
                        return do {
                            (
                                (
                                    bless(
                                        {
                                            (
                                                (Sidef::Runtime::String944210018565441
                                                ),
                                                Sidef::Types::Bool::Bool::FALSE,
                                                (Sidef::Runtime::String944210054320001
                                                ),
                                                (Sidef::Runtime::Null944210016376320
                                                ),
                                                (Sidef::Runtime::String944210054341121
                                                ),
                                                (Sidef::Runtime::Null944210016376320
                                                ),
                                                (Sidef::Runtime::String944210015588881
                                                ),
                                                bless(
                                                    [],
                                                    'Sidef::Types::Array::Array'
                                                )
                                            )
                                        },
                                        'Sidef::Types::Hash::Hash'
                                    )
                                )->$Sidef::Runtime::OP4394421007688824(
                                    $overload_spec94421002036496)
                              )->in_scope(
                                Sidef::Types::Block::Block->new(
                                    code => sub {
                                        my ($spec94421004903688) = @_;
                                        (
                                            (
                                                (
                                                    @{$spec94421004903688}{
                                                        (
                                                            map {
                                                                ref($_) eq
"Sidef::Types::String::String"
                                                                  ? $$_
                                                                  : "$_"
                                                                } (Sidef::Runtime::String944210054725361
                                                                )
                                                        )
                                                    }
                                                )
                                                ? Sidef::Types::Bool::Bool::FALSE
                                                : Sidef::Types::Bool::Bool::TRUE
                                            )
                                          )
                                          && (
                                            do {
                                                CORE::die(
                                                    (
                                                        (Sidef::Runtime::String944210049041921
                                                        )
                                                    ),
" at \.\/ABCs2\.sm line 24\n"
                                                );
                                            }
                                          );
                                        (
                                            (
                                                (
                                                    @{$spec94421004903688}{
                                                        (
                                                            map {
                                                                ref($_) eq
"Sidef::Types::String::String"
                                                                  ? $$_
                                                                  : "$_"
                                                                } (Sidef::Runtime::String944210054753681
                                                                )
                                                        )
                                                    }
                                                )
                                                ? Sidef::Types::Bool::Bool::FALSE
                                                : Sidef::Types::Bool::Bool::TRUE
                                            )
                                          )
                                          && (
                                            do {
                                                CORE::die(
                                                    (
                                                        (Sidef::Runtime::String944210054744081
                                                        )
                                                    ),
" at \.\/ABCs2\.sm line 26\n"
                                                );
                                            }
                                          );
                                        (
                                            (
                                                (
                                                    (
                                                        @{$spec94421004903688}{
                                                            (
                                                                map {
                                                                    ref($_) eq
"Sidef::Types::String::String"
                                                                      ? $$_
                                                                      : "$_"
                                                                    } (Sidef::Runtime::String944210015588881
                                                                    )
                                                            )
                                                        }
                                                    )->respond_to(
                                                        (Sidef::Runtime::String944210043754641
                                                        )
                                                    )
                                                )
                                                ? Sidef::Types::Bool::Bool::FALSE
                                                : Sidef::Types::Bool::Bool::TRUE
                                            )
                                          )
                                          && (
                                            do {
                                                CORE::die(
                                                    (
                                                        (Sidef::Runtime::String944210043740481
                                                        )
                                                    ),
" at \.\/ABCs2\.sm line 28\n"
                                                );
                                            }
                                          );
                                        (
                                            ( Sidef::Types::Block::Try->new )
                                            ->try(
                                                Sidef::Types::Block::Block->new(
                                                    code => sub {
                                                        my ($_94421004377096) =
                                                          @_;
                                                        (
                                                            (
                                                                CORE::say(
                                                                    (
'Sidef::Types::String::String'
                                                                    )
                                                                    ->interpolate
                                                                      (
"\	caller\:\ ",
                                                                        do {
                                                                            @{
                                                                                $spec94421004903688
                                                                              }{
                                                                                (
                                                                                    map
                                                                                    {
                                                                                        ref
                                                                                          (
                                                                                            $_
                                                                                          )
                                                                                          eq
"Sidef::Types::String::String"
                                                                                          ?
                                                                                          $$_
                                                                                          :
"$_"
                                                                                      }
                                                                                      (Sidef::Runtime::String944210054725361
                                                                                      )
                                                                                )
                                                                              };
                                                                        },
"\:\ try\ calling\ ",
                                                                        do {
                                                                            @{
                                                                                $spec94421004903688
                                                                              }{
                                                                                (
                                                                                    map
                                                                                    {
                                                                                        ref
                                                                                          (
                                                                                            $_
                                                                                          )
                                                                                          eq
"Sidef::Types::String::String"
                                                                                          ?
                                                                                          $$_
                                                                                          :
"$_"
                                                                                      }
                                                                                      (Sidef::Runtime::String944210054753681
                                                                                      )
                                                                                )
                                                                              };
                                                                        },
"\ with\ ",
                                                                        do {
                                                                            @{
                                                                                $spec94421004903688
                                                                              }{
                                                                                (
                                                                                    map
                                                                                    {
                                                                                        ref
                                                                                          (
                                                                                            $_
                                                                                          )
                                                                                          eq
"Sidef::Types::String::String"
                                                                                          ?
                                                                                          $$_
                                                                                          :
"$_"
                                                                                      }
                                                                                      (Sidef::Runtime::String944210015588881
                                                                                      )
                                                                                )
                                                                              };
                                                                        },
"\ clone_call\:\ ",
                                                                        do {
                                                                            @{
                                                                                $spec94421004903688
                                                                              }{
                                                                                (
                                                                                    map
                                                                                    {
                                                                                        ref
                                                                                          (
                                                                                            $_
                                                                                          )
                                                                                          eq
"Sidef::Types::String::String"
                                                                                          ?
                                                                                          $$_
                                                                                          :
"$_"
                                                                                      }
                                                                                      (Sidef::Runtime::String944210018565441
                                                                                      )
                                                                                )
                                                                              };
                                                                        },
"\ catch_msg_ref\:\ ",
                                                                        do {
                                                                            @{
                                                                                $spec94421004903688
                                                                              }{
                                                                                (
                                                                                    map
                                                                                    {
                                                                                        ref
                                                                                          (
                                                                                            $_
                                                                                          )
                                                                                          eq
"Sidef::Types::String::String"
                                                                                          ?
                                                                                          $$_
                                                                                          :
"$_"
                                                                                      }
                                                                                      (Sidef::Runtime::String944210054320001
                                                                                      )
                                                                                )
                                                                              };
                                                                        },
"\ retval_ref\:\ ",
                                                                        do {
                                                                            @{
                                                                                $spec94421004903688
                                                                              }{
                                                                                (
                                                                                    map
                                                                                    {
                                                                                        ref
                                                                                          (
                                                                                            $_
                                                                                          )
                                                                                          eq
"Sidef::Types::String::String"
                                                                                          ?
                                                                                          $$_
                                                                                          :
"$_"
                                                                                      }
                                                                                      (Sidef::Runtime::String944210054341121
                                                                                      )
                                                                                )
                                                                              };
                                                                          }
                                                                      )
                                                                )
                                                            )
                                                            ? Sidef::Types::Bool::Bool::TRUE
                                                            : Sidef::Types::Bool::Bool::FALSE
                                                        );
                                                        my sub r94421006026088()
                                                        {
                                                            state $_94421006026088
                                                              = do {
                                                                (
                                                                    (
                                                                        (
                                                                            @{
                                                                                $spec94421004903688
                                                                              }{
                                                                                (
                                                                                    map
                                                                                    {
                                                                                        ref
                                                                                          (
                                                                                            $_
                                                                                          )
                                                                                          eq
"Sidef::Types::String::String"
                                                                                          ?
                                                                                          $$_
                                                                                          :
"$_"
                                                                                      }
                                                                                      (Sidef::Runtime::String944210018565441
                                                                                      )
                                                                                )
                                                                              }
                                                                            ? (
                                                                                (
                                                                                    $self94421002036736
                                                                                )
                                                                                ->
                                                                                dclone
                                                                              )
                                                                            : (
                                                                                $self94421002036736
                                                                            )
                                                                        )
                                                                    )->method(
                                                                        @{
                                                                            $spec94421004903688
                                                                          }{
                                                                            (
                                                                                map
                                                                                {
                                                                                    ref
                                                                                      (
                                                                                        $_
                                                                                      )
                                                                                      eq
"Sidef::Types::String::String"
                                                                                      ?
                                                                                      $$_
                                                                                      :
"$_"
                                                                                  }
                                                                                  (Sidef::Runtime::String944210054753681
                                                                                  )
                                                                            )
                                                                          }
                                                                    )
                                                                  )->call(
                                                                    (
                                                                        @{
                                                                            $spec94421004903688
                                                                          }{
                                                                            (
                                                                                map
                                                                                {
                                                                                    ref
                                                                                      (
                                                                                        $_
                                                                                      )
                                                                                      eq
"Sidef::Types::String::String"
                                                                                      ?
                                                                                      $$_
                                                                                      :
"$_"
                                                                                  }
                                                                                  (Sidef::Runtime::String944210015588881
                                                                                  )
                                                                            )
                                                                          }
                                                                    )
                                                                    ->$Sidef::Runtime::OP46464694421007688824
                                                                  );
                                                              }
                                                        }
                                                        (r94421006026088);
                                                        do {
                                                            if (
                                                                (
                                                                    do {
                                                                        my $bool
                                                                          = (
                                                                            (Sidef::Runtime::Null944210016376320
                                                                            )
                                                                          ) eq (
                                                                            @{
                                                                                $spec94421004903688
                                                                              }{
                                                                                (
                                                                                    map
                                                                                    {
                                                                                        ref
                                                                                          (
                                                                                            $_
                                                                                          )
                                                                                          eq
"Sidef::Types::String::String"
                                                                                          ?
                                                                                          $$_
                                                                                          :
"$_"
                                                                                      }
                                                                                      (Sidef::Runtime::String944210054341121
                                                                                      )
                                                                                )
                                                                              }
                                                                          );
                                                                        ref(
                                                                            $bool
                                                                          )
                                                                          ? $bool
                                                                          : (
                                                                            $bool
                                                                            ? Sidef::Types::Bool::Bool::TRUE
                                                                            : Sidef::Types::Bool::Bool::FALSE
                                                                          );
                                                                    }
                                                                    ->not
                                                                )
                                                              )
                                                            {
                                                                (
                                                                    (
                                                                        ${
                                                                            (
                                                                                @{
                                                                                    $spec94421004903688
                                                                                  }
                                                                                  {
                                                                                    (
                                                                                        map
                                                                                        {
                                                                                            ref
                                                                                              (
                                                                                                $_
                                                                                              )
                                                                                              eq
"Sidef::Types::String::String"
                                                                                              ?
                                                                                              $$_
                                                                                              :
"$_"
                                                                                          }
                                                                                          (Sidef::Runtime::String944210054341121
                                                                                          )
                                                                                    )
                                                                                  }
                                                                            )
                                                                        }
                                                                    )
                                                                    = (
                                                                        (
                                                                            r94421006026088
                                                                        )
                                                                    )
                                                                )[-1];
                                                            }
                                                        };
                                                        (
                                                            (
                                                                CORE::say(
                                                                    (Sidef::Runtime::String944210060540081
                                                                    )
                                                                )
                                                            )
                                                            ? Sidef::Types::Bool::Bool::TRUE
                                                            : Sidef::Types::Bool::Bool::FALSE
                                                        );
                                                        Sidef::Types::Bool::Bool::TRUE;
                                                    },
                                                    type => "block",
                                                    name => "__BLOCK__",
                                                    class =>
"Sidef\:\:Object\:\:Object",
                                                    namespace => "ABCs2",
                                                    vars => [ { name => "_" } ],
                                                    table => { "_" => 0 }
                                                )
                                            )
                                          )->catch(
                                            Sidef::Types::Block::Block->new(
                                                code => sub {
                                                    my (
                                                        $_e94421006055112,
                                                        $msg94421006055352
                                                    ) = @_;
                                                    (
                                                        (
                                                            CORE::print(
                                                                (
                                                                    (Sidef::Runtime::String944210060559521
                                                                    )
                                                                )
                                                                ->$Sidef::Runtime::OP4394421007688824
                                                                  (
                                                                    (Sidef::Runtime::String944210049042641
                                                                    )
                                                                  )
                                                            )
                                                        )
                                                        ? Sidef::Types::Bool::Bool::TRUE
                                                        : Sidef::Types::Bool::Bool::FALSE
                                                    );
                                                    do {
                                                        if (
                                                            (
                                                                (
                                                                    (
                                                                        $msg94421006055352
                                                                    )->len
                                                                )
                                                                ->$Sidef::Runtime::OP6294421007688824
                                                                (
                                                                    (Sidef::Runtime::Number944210060616001
                                                                    )
                                                                )
                                                            )
                                                          )
                                                        {
                                                            (
                                                                (
                                                                    CORE::say(
                                                                        (
'Sidef::Types::String::String'
                                                                        )
                                                                        ->interpolate
                                                                          (
                                                                            do {
                                                                                (
                                                                                    do
                                                                                    {
                                                                                        my $obj
                                                                                          =
                                                                                          (
                                                                                            (
                                                                                                $msg94421006055352
                                                                                            )
                                                                                            ->
                                                                                            first
                                                                                              (
                                                                                                (Sidef::Runtime::Number944210060837761
                                                                                                )
                                                                                              )
                                                                                          )
                                                                                          ;
                                                                                        my $sub
                                                                                          =
                                                                                          UNIVERSAL::can(
                                                                                            $obj,
"..."
                                                                                          )
                                                                                          ;
                                                                                        defined
                                                                                          (
                                                                                            $sub
                                                                                          )
                                                                                          ?
                                                                                          $sub
                                                                                          ->
                                                                                          (
                                                                                            $obj
                                                                                          )
                                                                                          :
                                                                                          $obj;
                                                                                      }
                                                                                  )
                                                                                  ;
                                                                            },
"\ \.\.\.\ ",
                                                                            do {
                                                                                (
                                                                                    do
                                                                                    {
                                                                                        my $obj
                                                                                          =
                                                                                          (
                                                                                            (
                                                                                                $msg94421006055352
                                                                                            )
                                                                                            ->
                                                                                            last
                                                                                              (
                                                                                                (Sidef::Runtime::Number944210060848561
                                                                                                )
                                                                                              )
                                                                                          )
                                                                                          ;
                                                                                        my $sub
                                                                                          =
                                                                                          UNIVERSAL::can(
                                                                                            $obj,
"..."
                                                                                          )
                                                                                          ;
                                                                                        defined
                                                                                          (
                                                                                            $sub
                                                                                          )
                                                                                          ?
                                                                                          $sub
                                                                                          ->
                                                                                          (
                                                                                            $obj
                                                                                          )
                                                                                          :
                                                                                          $obj;
                                                                                      }
                                                                                  )
                                                                                  ;
                                                                              }
                                                                          )
                                                                    )
                                                                )
                                                                ? Sidef::Types::Bool::Bool::TRUE
                                                                : Sidef::Types::Bool::Bool::FALSE
                                                            );
                                                        }
                                                        else {
                                                            (
                                                                (
                                                                    CORE::say(
                                                                        (
'Sidef::Types::String::String'
                                                                        )
                                                                        ->interpolate
                                                                          (
                                                                            do {
                                                                                $msg94421006055352;
                                                                              }
                                                                          )
                                                                    )
                                                                )
                                                                ? Sidef::Types::Bool::Bool::TRUE
                                                                : Sidef::Types::Bool::Bool::FALSE
                                                            );
                                                        }
                                                    };
                                                    do {
                                                        if (
                                                            (
                                                                do {
                                                                    my $bool =
                                                                      (
                                                                        (Sidef::Runtime::Null944210016376320
                                                                        )
                                                                      ) eq (
                                                                        @{
                                                                            $spec94421004903688
                                                                          }{
                                                                            (
                                                                                map
                                                                                {
                                                                                    ref
                                                                                      (
                                                                                        $_
                                                                                      )
                                                                                      eq
"Sidef::Types::String::String"
                                                                                      ?
                                                                                      $$_
                                                                                      :
"$_"
                                                                                  }
                                                                                  (Sidef::Runtime::String944210054320001
                                                                                  )
                                                                            )
                                                                          }
                                                                      );
                                                                    ref($bool)
                                                                      ? $bool
                                                                      : ( $bool
                                                                        ? Sidef::Types::Bool::Bool::TRUE
                                                                        : Sidef::Types::Bool::Bool::FALSE
                                                                      );
                                                                }
                                                                ->not
                                                            )
                                                          )
                                                        {
                                                            (
                                                                (
                                                                    ${
                                                                        (
                                                                            @{
                                                                                $spec94421004903688
                                                                              }{
                                                                                (
                                                                                    map
                                                                                    {
                                                                                        ref
                                                                                          (
                                                                                            $_
                                                                                          )
                                                                                          eq
"Sidef::Types::String::String"
                                                                                          ?
                                                                                          $$_
                                                                                          :
"$_"
                                                                                      }
                                                                                      (Sidef::Runtime::String944210054320001
                                                                                      )
                                                                                )
                                                                              }
                                                                        )
                                                                    }
                                                                )
                                                                = (
                                                                    $msg94421006055352
                                                                )
                                                            )[-1];
                                                        }
                                                    };
                                                    Sidef::Types::Bool::Bool::FALSE;
                                                },
                                                type => "block",
                                                name => "__BLOCK__",
                                                class =>
                                                  "Sidef\:\:Object\:\:Object",
                                                namespace => "ABCs2",
                                                vars      => [
                                                    { name => "_e" },
                                                    { name => "msg" }
                                                ],
                                                table =>
                                                  { "_e" => 0, "msg" => 1 }
                                            )
                                          );
                                    },
                                    type      => "block",
                                    name      => "__BLOCK__",
                                    class     => "Sidef\:\:Object\:\:Object",
                                    namespace => "ABCs2",
                                    vars      => [ { name => "spec" } ],
                                    table => { "spec" => 0 }
                                )
                              );
                        };
                      END94421002036904: @return;
                    },
                    type      => "method",
                    name      => "has_overload",
                    class     => "Sidef\:\:Object\:\:Object",
                    namespace => "ABCs2",
                    vars      => [
                        { name => "self" },
                        {
                            name => "overload_spec",
                            type => "Sidef\:\:Types\:\:Hash\:\:Hash"
                        }
                    ],
                    table => { "self" => 0, "overload_spec" => 1 },
                    (
                        defined($has_overload_code94421002062272)
                        ? (
                            kids => [
                                Sidef::Types::Block::Block->new(
                                    code => $has_overload_code94421002062272
                                )
                            ]
                          )
                        : ()
                    )
                );
                $has_overload94421002062272->{returns} =
                  ["Sidef\:\:Types\:\:Bool\:\:Bool"];
                $has_overload94421002062272;
            };
            state $_94421002062272= do {
                no strict 'refs';
                $Sidef::Object::Object::__SIDEF_CLASS_METHODS__{'has_overload'}
                  = $has_overload94421002062272;
                *{"Sidef\:\:Object\:\:Object\:\:has_overload"} =
                  sub { $has_overload94421002062272->call(@_) }
            };
            $has_public_concrete_method94421002036976 =
              Sidef::Types::Block::Block->new(
                code => sub {
                    my ( $self94421006106304, $name94421006106544 ) = @_;
                    my @return;
                    return do {
                        (
                            ($self94421006106304)->cleave(
                                Sidef::Types::Block::Block->new(
                                    code => sub {
                                        my ($_94421002037744) = @_;
                                        ($_94421002037744)
                                          ->respond_to($name94421006106544);
                                    },
                                    type      => "block",
                                    name      => "__BLOCK__",
                                    class     => "Sidef\:\:Object\:\:Object",
                                    namespace => "ABCs2",
                                    vars      => [ { name => "_" } ],
                                    table => { "_" => 0 }
                                ),
                                Sidef::Types::Block::Block->new(
                                    code => sub {
                                        my ($_94421006114888) = @_;
                                        ($_94421006114888)
                                          ->declares_method(
                                            $name94421006106544);
                                    },
                                    type      => "block",
                                    name      => "__BLOCK__",
                                    class     => "Sidef\:\:Object\:\:Object",
                                    namespace => "ABCs2",
                                    vars      => [ { name => "_" } ],
                                    table => { "_" => 0 }
                                ),
                                Sidef::Types::Block::Block->new(
                                    code => sub {
                                        my ($_94421006116376) = @_;
                                        my ($msg94421006139848);
                                        (
                                            ($_94421006116376)->has_overload(
                                                bless(
                                                    {
                                                        (
                                                            (Sidef::Runtime::String944210054725361
                                                            ),
                                                            (Sidef::Runtime::String944210061178881
                                                            ),
                                                            (Sidef::Runtime::String944210054753681
                                                            ),
                                                            $name94421006106544,
                                                            (Sidef::Runtime::String944210018565441
                                                            ),
                                                            Sidef::Types::Bool::Bool::TRUE,
                                                            (Sidef::Runtime::String944210054320001
                                                            ),
                                                            \(
                                                                (
                                                                    (
                                                                        $msg94421006139848
                                                                    )
                                                                )
                                                            )
                                                        )
                                                    },
                                                    'Sidef::Types::Hash::Hash'
                                                )
                                            )
                                          )
                                          || (
                                            do {
                                                my $bool =
                                                  do { ($msg94421006139848) }
                                                  ~~ do {
                                                    (
                                                        (Sidef::Runtime::Regex944210061424642
                                                        )
                                                    );
                                                  };
                                                ref($bool) ? $bool
                                                  : ( $bool
                                                    ? Sidef::Types::Bool::Bool::TRUE
                                                    : Sidef::Types::Bool::Bool::FALSE
                                                  );
                                            }
                                          );
                                    },
                                    type      => "block",
                                    name      => "__BLOCK__",
                                    class     => "Sidef\:\:Object\:\:Object",
                                    namespace => "ABCs2",
                                    vars      => [ { name => "_" } ],
                                    table => { "_" => 0 }
                                )
                            )
                        )->all;
                    };
                  END94421005912576: @return;
                },
                type      => "method",
                name      => "has_public_concrete_method",
                class     => "Sidef\:\:Object\:\:Object",
                namespace => "ABCs2",
                vars      => [
                    { name => "self" },
                    {
                        name => "name",
                        type => "Sidef\:\:Types\:\:String\:\:String"
                    }
                ],
                table => { "self" => 0, "name" => 1 },
                (
                    defined($has_public_concrete_method_code94421002036976)
                    ? (
                        kids => [
                            Sidef::Types::Block::Block->new(
                                code =>
                                  $has_public_concrete_method_code94421002036976
                            )
                        ]
                      )
                    : ()
                )
              );
            state $_94421002036976= do {
                no strict 'refs';
                $Sidef::Object::Object::__SIDEF_CLASS_METHODS__{
                    'has_public_concrete_method'} =
                  $has_public_concrete_method94421002036976;
                *{"Sidef\:\:Object\:\:Object\:\:has_public_concrete_method"} =
                  sub { $has_public_concrete_method94421002036976->call(@_) }
            };
            $has_public_concrete_overload94421006104744 =
              Sidef::Types::Block::Block->new(
                code => sub {
                    my ( $self94421006228136, $name94421006244336,
                        @args94421006244648 )
                      = @_;
                    my $args94421006244648 = bless( \@args94421006244648,
                        'Sidef::Types::Array::Array' );
                    my @return;
                    return do {
                        (
                            ($self94421006228136)->cleave(
                                Sidef::Types::Block::Block->new(
                                    code => sub {
                                        my ($_94421006226696) = @_;
                                        ($_94421006226696)
                                          ->respond_to($name94421006244336);
                                    },
                                    type      => "block",
                                    name      => "__BLOCK__",
                                    class     => "Sidef\:\:Object\:\:Object",
                                    namespace => "ABCs2",
                                    vars      => [ { name => "_" } ],
                                    table => { "_" => 0 }
                                ),
                                Sidef::Types::Block::Block->new(
                                    code => sub {
                                        my ($_94421006245872) = @_;
                                        ($_94421006245872)
                                          ->declares_method(
                                            $name94421006244336);
                                    },
                                    type      => "block",
                                    name      => "__BLOCK__",
                                    class     => "Sidef\:\:Object\:\:Object",
                                    namespace => "ABCs2",
                                    vars      => [ { name => "_" } ],
                                    table => { "_" => 0 }
                                ),
                                Sidef::Types::Block::Block->new(
                                    code => sub {
                                        my ($_94421006247360) = @_;
                                        my ($msg94421006262752);
                                        (
                                            ($_94421006247360)->has_overload(
                                                bless(
                                                    {
                                                        (
                                                            (Sidef::Runtime::String944210054725361
                                                            ),
                                                            (Sidef::Runtime::String944210062611441
                                                            ),
                                                            (Sidef::Runtime::String944210054753681
                                                            ),
                                                            $name94421006244336,
                                                            (Sidef::Runtime::String944210018565441
                                                            ),
                                                            Sidef::Types::Bool::Bool::TRUE,
                                                            (Sidef::Runtime::String944210054320001
                                                            ),
                                                            \(
                                                                (
                                                                    (
                                                                        $msg94421006262752
                                                                    )
                                                                )
                                                            ),
                                                            (Sidef::Runtime::String944210015588881
                                                            ),
                                                            $args94421006244648
                                                        )
                                                    },
                                                    'Sidef::Types::Hash::Hash'
                                                )
                                            )
                                          )
                                          || (
                                            do {
                                                my $bool =
                                                  do { ($msg94421006262752) }
                                                  ~~ do {
                                                    (
                                                        (Sidef::Runtime::Regex944210061424642
                                                        )
                                                    );
                                                  };
                                                ref($bool) ? $bool
                                                  : ( $bool
                                                    ? Sidef::Types::Bool::Bool::TRUE
                                                    : Sidef::Types::Bool::Bool::FALSE
                                                  );
                                            }
                                            ->not
                                          );
                                    },
                                    type      => "block",
                                    name      => "__BLOCK__",
                                    class     => "Sidef\:\:Object\:\:Object",
                                    namespace => "ABCs2",
                                    vars      => [ { name => "_" } ],
                                    table => { "_" => 0 }
                                )
                            )
                        )->all;
                    };
                  END94421006227872: @return;
                },
                type      => "method",
                name      => "has_public_concrete_overload",
                class     => "Sidef\:\:Object\:\:Object",
                namespace => "ABCs2",
                vars      => [
                    { name => "self" },
                    {
                        name => "name",
                        type => "Sidef\:\:Types\:\:String\:\:String"
                    },
                    { name => "args", slurpy => 1 }
                ],
                table => { "self" => 0, "name" => 1, "args" => 2 },
                (
                    defined($has_public_concrete_overload_code94421006104744)
                    ? (
                        kids => [
                            Sidef::Types::Block::Block->new(
                                code =>
                                  $has_public_concrete_overload_code94421006104744
                            )
                        ]
                      )
                    : ()
                )
              );
            state $_94421006104744= do {
                no strict 'refs';
                $Sidef::Object::Object::__SIDEF_CLASS_METHODS__{
                    'has_public_concrete_overload'} =
                  $has_public_concrete_overload94421006104744;
                *{"Sidef\:\:Object\:\:Object\:\:has_public_concrete_overload"}
                  = sub { $has_public_concrete_overload94421006104744->call(@_) }
            };
            $is_property94421006226912 = Sidef::Types::Block::Block->new(
                code => sub {
                    my ( $self94421006272488, $name94421006272728,
                        $type_example_arg94421006273040 )
                      = @_;
                    my @return;
                    my ($msg94421006289224);
                    return do {
                        (
                            ($self94421006272488)->has_overload(
                                bless(
                                    {
                                        (
                                            (Sidef::Runtime::String944210054725361
                                            ),
                                            (Sidef::Runtime::String944210062714321
                                            ),
                                            (Sidef::Runtime::String944210054753681
                                            ),
                                            $name94421006272728,
                                            (Sidef::Runtime::String944210018565441
                                            ),
                                            Sidef::Types::Bool::Bool::TRUE,
                                            (Sidef::Runtime::String944210054320001
                                            ),
                                            \( ( ($msg94421006289224) ) ),
                                            (Sidef::Runtime::String944210015588881
                                            ),
                                            bless(
                                                [
                                                    $type_example_arg94421006273040,
                                                    (Sidef::Runtime::String944210062906401
                                                    )
                                                ],
                                                'Sidef::Types::Array::Array'
                                            )
                                        )
                                    },
                                    'Sidef::Types::Hash::Hash'
                                )
                            )
                          )
                          && (
                            do {
                                my $bool = do {
                                    ( (Sidef::Runtime::Regex944210061424642) );
                                  }
                                  ~~ do { ($msg94421006289224) };
                                ref($bool) ? $bool
                                  : ( $bool ? Sidef::Types::Bool::Bool::TRUE
                                    : Sidef::Types::Bool::Bool::FALSE );
                            }
                            ->not
                          );
                    };
                  END94421006272296: @return;
                },
                type      => "method",
                name      => "is_property",
                class     => "Sidef\:\:Object\:\:Object",
                namespace => "ABCs2",
                vars      => [
                    { name => "self" },
                    {
                        name => "name",
                        type => "Sidef\:\:Types\:\:String\:\:String"
                    },
                    {
                        name => "type_example_arg",
                        type => "Sidef\:\:Object\:\:Object"
                    }
                ],
                table => { "self" => 0, "name" => 1, "type_example_arg" => 2 },
                (
                    defined($is_property_code94421006226912)
                    ? (
                        kids => [
                            Sidef::Types::Block::Block->new(
                                code => $is_property_code94421006226912
                            )
                        ]
                      )
                    : ()
                )
            );
            state $_94421006226912= do {
                no strict 'refs';
                $Sidef::Object::Object::__SIDEF_CLASS_METHODS__{'is_property'}
                  = $is_property94421006226912;
                *{"Sidef\:\:Object\:\:Object\:\:is_property"} =
                  sub { $is_property94421006226912->call(@_) }
            };
            $grep_methods94421006271240 = Sidef::Types::Block::Block->new(
                code => sub {
                    my ( $self94421006298360, $b94421006298600 ) = @_;
                    my @return;
                    return do {
                        ( ($self94421006298360)->methods )
                          ->grep_kv($b94421006298600);
                    };
                  END94421006298192: @return;
                },
                type      => "method",
                name      => "grep_methods",
                class     => "Sidef\:\:Object\:\:Object",
                namespace => "ABCs2",
                vars      => [
                    { name => "self" },
                    { name => "b", type => "Sidef\:\:Types\:\:Block\:\:Block" }
                ],
                table => { "self" => 0, "b" => 1 },
                (
                    defined($grep_methods_code94421006271240)
                    ? (
                        kids => [
                            Sidef::Types::Block::Block->new(
                                code => $grep_methods_code94421006271240
                            )
                        ]
                      )
                    : ()
                )
            );
            state $_94421006271240= do {
                no strict 'refs';
                $Sidef::Object::Object::__SIDEF_CLASS_METHODS__{'grep_methods'}
                  = $grep_methods94421006271240;
                *{"Sidef\:\:Object\:\:Object\:\:grep_methods"} =
                  sub { $grep_methods94421006271240->call(@_) }
            };
            $grep_map_methods94421006298120 = Sidef::Types::Block::Block->new(
                code => sub {
                    my ( $self94421006325288, $g94421006325528,
                        $m94421006325840 )
                      = @_;
                    my @return;
                    return do {
                        ( ($self94421006325288)
                            ->grep_methods($g94421006325528) )
                          ->map_kv($m94421006325840);
                    };
                  END94421006325120: @return;
                },
                type      => "method",
                name      => "grep_map_methods",
                class     => "Sidef\:\:Object\:\:Object",
                namespace => "ABCs2",
                vars      => [
                    { name => "self" },
                    { name => "g", type => "Sidef\:\:Types\:\:Block\:\:Block" },
                    { name => "m", type => "Sidef\:\:Types\:\:Block\:\:Block" }
                ],
                table => { "self" => 0, "g" => 1, "m" => 2 },
                (
                    defined($grep_map_methods_code94421006298120)
                    ? (
                        kids => [
                            Sidef::Types::Block::Block->new(
                                code => $grep_map_methods_code94421006298120
                            )
                        ]
                      )
                    : ()
                )
            );
            state $_94421006298120= do {
                no strict 'refs';
                $Sidef::Object::Object::__SIDEF_CLASS_METHODS__{
                    'grep_map_methods'} = $grep_map_methods94421006298120;
                *{"Sidef\:\:Object\:\:Object\:\:grep_map_methods"} =
                  sub { $grep_map_methods94421006298120->call(@_) }
              }
        };
        'Sidef::Object::Object';
    };
    do {

        package Sidef::Types::Array::Array {
            $all94421006326752 = Sidef::Types::Block::Block->new(
                code => sub {
                    my ($self94421006327400) = @_;
                    my @return;
                    return do {
                        ($self94421006327400)->all(
                            Sidef::Types::Block::Block->new(
                                code => sub {
                                    my ($_94421006327976) = @_;
                                    $_94421006327976;
                                },
                                type      => "block",
                                name      => "__BLOCK__",
                                class     => "Sidef\:\:Types\:\:Array\:\:Array",
                                namespace => "ABCs2",
                                vars      => [ { name => "_" } ],
                                table => { "_" => 0 }
                            )
                        );
                    };
                  END94421006328432: @return;
                },
                type      => "method",
                name      => "all",
                class     => "Sidef\:\:Types\:\:Array\:\:Array",
                namespace => "ABCs2",
                vars      => [ { name => "self" } ],
                table => { "self" => 0 },
                (
                    defined($all_code94421006326752)
                    ? (
                        kids => [
                            Sidef::Types::Block::Block->new(
                                code => $all_code94421006326752
                            )
                        ]
                      )
                    : ()
                )
            );
            state $_94421006326752= do {
                no strict 'refs';
                $Sidef::Types::Array::Array::__SIDEF_CLASS_METHODS__{'all'} =
                  $all94421006326752;
                *{"Sidef\:\:Types\:\:Array\:\:Array\:\:all"} =
                  sub { $all94421006326752->call(@_) }
            };
            $merge_reduce94421006326992 = Sidef::Types::Block::Block->new(
                code => sub {
                    my ($self94421006310200) = @_;
                    my @return;
                    return do {
                        ($self94421006310200)->reduce(
                            Sidef::Types::Block::Block->new(
                                code => sub {
                                    my ( $l94421006310872, $r94421006311112 ) =
                                      @_;
                                    ($l94421006310872)->merge($r94421006311112);
                                },
                                type      => "block",
                                name      => "__BLOCK__",
                                class     => "Sidef\:\:Types\:\:Array\:\:Array",
                                namespace => "ABCs2",
                                vars => [ { name => "l" }, { name => "r" } ],
                                table => { "l" => 0, "r" => 1 }
                            )
                        );
                    };
                  END94421006308352: @return;
                },
                type      => "method",
                name      => "merge_reduce",
                class     => "Sidef\:\:Types\:\:Array\:\:Array",
                namespace => "ABCs2",
                vars      => [ { name => "self" } ],
                table => { "self" => 0 },
                (
                    defined($merge_reduce_code94421006326992)
                    ? (
                        kids => [
                            Sidef::Types::Block::Block->new(
                                code => $merge_reduce_code94421006326992
                            )
                        ]
                      )
                    : ()
                )
            );
            state $_94421006326992= do {
                no strict 'refs';
                $Sidef::Types::Array::Array::__SIDEF_CLASS_METHODS__{
                    'merge_reduce'} = $merge_reduce94421006326992;
                *{"Sidef\:\:Types\:\:Array\:\:Array\:\:merge_reduce"} =
                  sub { $merge_reduce94421006326992->call(@_) }
              }
        };
        'Sidef::Types::Array::Array';
    };
    $is_serializable94421006311928 = Sidef::Types::Block::Block->new(
        code => sub {
            my ($obj94421006309432) = @_;
            my @return;
            return do {
                ($obj94421006309432)
                  ->respond_to( (Sidef::Runtime::String944210063518881) );
            };
          END94421006351312: @return;
        },
        type      => "func",
        name      => "is_serializable",
        namespace => "TypeUtils",
        vars      => [ { name => "obj", type => "Sidef\:\:Object\:\:Object" } ],
        table => { "obj" => 0 }
    );
    do {
        $fqtn_to_umdtn94421006327232 = Sidef::Types::Block::Block->new(
            code => sub {
                my ($fqtn94421006353352) = @_;
                my @return;
                return do {
                    @{
                        (
                            ( (Sidef::Runtime::Regex944210063380482) )
                            ->$Sidef::Runtime::OP6112694421007688824(
                                $fqtn94421006353352)
                        )
                      }[
                      (
                          map {
                              ref($_) eq "Sidef::Types::Number::Number"
                                ? Sidef::Types::Number::Number::__numify__($$_)
                                : do {
                                  my $sub = UNIVERSAL::can( $_, "..." );
                                  defined($sub) ? $sub->($_) : CORE::int($_);
                                }
                          } (Sidef::Runtime::Number944210063509761)
                      )
                      ];
                };
              END94421006353160: @return;
            },
            type      => "func",
            name      => "fqtn_to_umdtn",
            namespace => "TypeUtils",
            vars      => [
                {
                    name => "fqtn",
                    type => "Sidef\:\:Types\:\:String\:\:String"
                }
            ],
            table => { "fqtn" => 0 }
        );
        $fqtn_to_umdtn94421006327232->{returns} =
          ["Sidef\:\:Types\:\:String\:\:String"];
        $fqtn_to_umdtn94421006327232;
    };
    do {
        $is_typename94421006350064 = Sidef::Types::Block::Block->new(
            code => sub {
                my ($obj94421006340424) = @_;
                my @return;
                return do {
                    (
                        (
                            bless(
                                [
                                    (Sidef::Runtime::String944210063408081),
                                    (Sidef::Runtime::String944210063410961)
                                ],
                                'Sidef::Types::Array::Array'
                            )
                        )->all(
                            Sidef::Types::Block::Block->new(
                                code => sub {
                                    my ($_94421006351144) = @_;
                                    ($obj94421006340424)
                                      ->declares_method($_94421006351144);
                                },
                                type      => "block",
                                name      => "__BLOCK__",
                                namespace => "TypeUtils",
                                vars      => [ { name => "_" } ],
                                table => { "_" => 0 }
                            )
                        )
                      )
                      && (
                        do {
                            my $bool =
                              ( ($obj94421006340424)->refaddr ) eq
                              ( (Sidef::Runtime::Number944210063509761) );
                            ref($bool) ? $bool
                              : ( $bool ? Sidef::Types::Bool::Bool::TRUE
                                : Sidef::Types::Bool::Bool::FALSE );
                        }
                      );
                };
              END94421006351000: @return;
            },
            type      => "func",
            name      => "is_typename",
            namespace => "TypeUtils",
            vars => [ { name => "obj", type => "Sidef\:\:Object\:\:Object" } ],
            table => { "obj" => 0 }
        );
        $is_typename94421006350064->{returns} =
          ["Sidef\:\:Types\:\:Bool\:\:Bool"];
        $is_typename94421006350064;
    };
    do {
        $is_fqco94421006338888 = Sidef::Types::Block::Block->new(
            code => sub {
                my ( $obj94421006394096, $must_have_prop94421006394408 ) = @_;
                $must_have_prop94421006394408 //=
                  Sidef::Types::Bool::Bool::FALSE;
                my @return;
                return do {
                    ('Sidef::Types::Bool::Bool')->call(
                        (
                            (
                                (
                                    (
                                        ($is_typename94421006350064)
                                        ->call($obj94421006394096)
                                    )
                                    ? Sidef::Types::Bool::Bool::FALSE
                                    : Sidef::Types::Bool::Bool::TRUE
                                )
                            )
                              && (
                                do {
                                    my $bool =
                                      ( ($obj94421006394096)->refaddr ) eq
                                      ( (Sidef::Runtime::Number944210063509761)
                                      );
                                    ref($bool) ? $bool
                                      : ( $bool ? Sidef::Types::Bool::Bool::TRUE
                                        : Sidef::Types::Bool::Bool::FALSE );
                                }
                                ->not
                              )
                        )
                          && (
                            (
                                $must_have_prop94421006394408
                                ? (
                                    ($obj94421006394096)->declares_method(
                                        $must_have_prop94421006394408)
                                )
                                : (Sidef::Types::Bool::Bool::TRUE)
                            )
                          )
                    );
                };
              END94421006393760: @return;
            },
            type      => "func",
            name      => "is_fqco",
            namespace => "TypeUtils",
            vars      => [
                { name => "obj" },
                { name => "must_have_prop", has_value => 1 }
            ],
            table => { "obj" => 0, "must_have_prop" => 1 }
        );
        $is_fqco94421006338888->{returns} = ["Sidef\:\:Types\:\:Bool\:\:Bool"];
        $is_fqco94421006338888;
    };
    $is_a_fqco94421006394792 = Sidef::Types::Block::Block->new(
        code => sub {
            my ( $obj94421006443160, $typename94421006443232,
                $must_have_prop94421001066560 )
              = @_;
            $must_have_prop94421001066560 //= Sidef::Types::Bool::Bool::FALSE;
            my @return;
            return do {
                ( ($obj94421006443160)->is_a($typename94421006443232) )
                  && (
                    ($is_fqco94421006338888)->call(
                        $obj94421006443160,
                        Sidef::Variable::NamedParam->new(
                            "must_have_prop", ($must_have_prop94421001066560)
                        )
                    )
                  );
            };
          END94421006442968: @return;
        },
        type      => "func",
        name      => "is_a_fqco",
        namespace => "TypeUtils",
        vars      => [
            { name => "obj" },
            { name => "typename" },
            { name => "must_have_prop", has_value => 1 }
        ],
        table => { "obj" => 0, "typename" => 1, "must_have_prop" => 2 }
    );
    $maybe_call_custom_init94421006358656 = Sidef::Types::Block::Block->new(
        code => sub {
            my ($obj94421006497968) = @_;
            my @return;
            return do {
                do {
                    if (
                        (
                            ($obj94421006497968)->has_overload(
                                bless(
                                    {
                                        (
                                            (Sidef::Runtime::String944210054725361
                                            ),
                                            (Sidef::Runtime::String944210064968161
                                            ),
                                            (Sidef::Runtime::String944210054753681
                                            ),
                                            (Sidef::Runtime::String944210064973441
                                            )
                                        )
                                    },
                                    'Sidef::Types::Hash::Hash'
                                )
                            )
                        )
                      )
                    {
                        ( ($obj94421006497968)
                            ->method( ($obj94421006497968)->INIT_METHOD_NAME ) )
                          ->call;
                    }
                    elsif (
                        (
                            ($is_typename94421006350064)
                            ->call($obj94421006497968)
                        )
                      )
                    {
                        ($obj94421006497968)->call;
                    }
                    else { $obj94421006497968 }
                  }
            };
          END94421006497800: @return;
        },
        type      => "func",
        name      => "maybe_call_custom_init",
        namespace => "TypeUtils",
        vars      => [ { name => "obj", type => "Sidef\:\:Object\:\:Object" } ],
        table => { "obj" => 0 }
    );
    $process_serial_prop_rhs94421006510408 = Sidef::Types::Block::Block->new(
        code => sub {
            my (
                $name94421006524272,     $obj94421006524416,
                $typename94421006524824, $default_val94421006525232,
                $custom_blocks94421006497080
            ) = @_;
            my @return;
            (
                (
                    bless(
                        [
                            $typename94421006524824,
                            $default_val94421006525232,
                            $custom_blocks94421006497080
                        ],
                        'Sidef::Types::Array::Array'
                    )
                )->any(
                    Sidef::Types::Block::Block->new(
                        code => sub {
                            my ($_94421006525856) = @_;
                            (
                                (
                                    (
                                        (
                                            ( CORE::defined($_94421006525856) )
                                            ? Sidef::Types::Bool::Bool::TRUE
                                            : Sidef::Types::Bool::Bool::FALSE
                                        )
                                    ) ? Sidef::Types::Bool::Bool::FALSE
                                    : Sidef::Types::Bool::Bool::TRUE
                                )
                              )
                              || (
                                do {
                                    my $bool =
                                      ($_94421006525856) eq
                                      ( (Sidef::Runtime::Null944210016376320) );
                                    ref($bool) ? $bool
                                      : ( $bool ? Sidef::Types::Bool::Bool::TRUE
                                        : Sidef::Types::Bool::Bool::FALSE );
                                }
                              );
                        },
                        type      => "block",
                        name      => "__BLOCK__",
                        namespace => "ABCs2",
                        vars      => [ { name => "_" } ],
                        table => { "_" => 0 }
                    )
                )
              )
              && (
                do {
                    CORE::die(
                        (
                            ('Sidef::Types::String::String')->interpolate(
                                "invalid\ argument\ list\ for\ ",
                                do { (Sidef::Runtime::String944210064182721) }
                            )
                        ),
                        " at \.\/ABCs2\.sm line 145\n"
                    );
                }
              );
            my sub is_fqa94421006419568() {
                state $_94421006419568= do {
                    ($is_a_fqco94421006394792)->call(
                        $obj94421006524416,
                        'Sidef::Types::Array::Array',
                        Sidef::Variable::NamedParam->new(
                            "must_have_prop",
                            ( (Sidef::Runtime::String944210064191121) )
                        )
                    );
                  }
            }
            (is_fqa94421006419568);
            return do {
                do {
                    if (
                        (
                            (
                                ( (is_fqa94421006419568) )
                                ? Sidef::Types::Bool::Bool::FALSE
                                : Sidef::Types::Bool::Bool::TRUE
                            )
                        )
                      )
                    {
                        ( ($is_typename94421006350064)
                            ->call($obj94421006524416) )
                          || (
                            do {
                                CORE::die(
                                    (
                                        (
                                            (Sidef::Runtime::String944210064169281
                                            )
                                        )->$Sidef::Runtime::OP4394421007688824(
                                            ( ($name94421006524272)->dump )
                                            ->$Sidef::Runtime::OP4394421007688824
                                              (
                                                (
                                                    (Sidef::Runtime::String944210065600481
                                                    )
                                                )
                                                ->$Sidef::Runtime::OP4394421007688824
                                                  (
                                                    (
                                                        ($obj94421006524416)
                                                        ->dump
                                                    )
                                                    ->$Sidef::Runtime::OP4394421007688824
                                                      (
                                                        (Sidef::Runtime::String944210065605761
                                                        )
                                                      )
                                                  )
                                              )
                                        )
                                    ),
                                    " at \.\/ABCs2\.sm line 152\n"
                                );
                            }
                          );
                        ( ( ${ ($typename94421006524824) } ) =
                              ($obj94421006524416) )[-1];
                        (
                            ( ${ ($default_val94421006525232) } ) = (
                                ($maybe_call_custom_init94421006358656)
                                ->call($obj94421006524416)
                            )
                        )[-1];
                        ( ( ${ ($custom_blocks94421006497080) } ) =
                              ( bless( { () }, 'Sidef::Types::Hash::Hash' ) ) )
                          [-1];
                    }
                    else {
                        (
                            ( (is_fqa94421006419568) )
                              && (
                                (
                                    ($obj94421006524416)
                                    ? Sidef::Types::Bool::Bool::FALSE
                                    : Sidef::Types::Bool::Bool::TRUE
                                )
                              )
                          )
                          && (
                            do {
                                CORE::die(
                                    (
                                        ('Sidef::Types::String::String')
                                        ->interpolate(
                                            do {
                                                (Sidef::Runtime::String944210065910081
                                                );
                                            },
                                            "\:",
                                            do {
                                                (Sidef::Runtime::Number944210065914161
                                                );
                                            },
                                            "\:\ ",
                                            do {
                                                (Sidef::Runtime::String944210064182721
                                                );
                                            },
"\:\ malformed\ array\ in\ RHS\ when\ declaring\ field\ \'",
                                            do { $name94421006524272 },
"\'\:\ must\ have\ positive\ length\ \(1\,\ 2\ or\ 3\)"
                                        )
                                    ),
                                    " at \.\/ABCs2\.sm line 160\n"
                                );
                            }
                          );
                        do {
                            if (
                                (
                                    do {
                                        my $bool =
                                          ( ($obj94421006524416)->len ) eq (
                                            (Sidef::Runtime::Number944210065902401
                                            )
                                          );
                                        ref($bool) ? $bool
                                          : ( $bool
                                            ? Sidef::Types::Bool::Bool::TRUE
                                            : Sidef::Types::Bool::Bool::FALSE );
                                    }
                                )
                              )
                            {
                                ($process_serial_prop_rhs94421006510408)->call(
                                    $name94421006524272,
                                    @{ ($obj94421006524416) }[
                                      (
                                          map {
                                              ref($_) eq
                                                "Sidef::Types::Number::Number"
                                                ? Sidef::Types::Number::Number::__numify__(
                                                  $$_)
                                                : do {
                                                  my $sub =
                                                    UNIVERSAL::can( $_, "..." );
                                                  defined($sub)
                                                    ? $sub->($_)
                                                    : CORE::int($_);
                                                }
                                            } (Sidef::Runtime::Number944210063509761
                                            )
                                      )
                                    ],
                                    $typename94421006524824,
                                    $default_val94421006525232,
                                    $custom_blocks94421006497080
                                );
                            }
                            else {
                                (
                                    ( ${ ($typename94421006524824) } ) = (
                                        @{ ($obj94421006524416) }[
                                          (
                                              map {
                                                  ref($_) eq
"Sidef::Types::Number::Number"
                                                    ? Sidef::Types::Number::Number::__numify__(
                                                      $$_)
                                                    : do {
                                                      my $sub =
                                                        UNIVERSAL::can( $_,
                                                          "..." );
                                                      defined($sub)
                                                        ? $sub->($_)
                                                        : CORE::int($_);
                                                    }
                                                } (Sidef::Runtime::Number944210063509761
                                                )
                                          )
                                        ]
                                    )
                                )[-1];
                                (
                                    (
                                        ( ${ ($default_val94421006525232) } ) =
                                          (
                                            @{ ($obj94421006524416) }[
                                              (
                                                  map {
                                                      ref($_) eq
"Sidef::Types::Number::Number"
                                                        ? Sidef::Types::Number::Number::__numify__(
                                                          $$_)
                                                        : do {
                                                          my $sub =
                                                            UNIVERSAL::can( $_,
                                                              "..." );
                                                          defined($sub)
                                                            ? $sub->($_)
                                                            : CORE::int($_);
                                                        }
                                                    } (Sidef::Runtime::Number944210065902401
                                                    )
                                              )
                                            ]
                                          )
                                    )[-1]
                                  ) // (
                                    ($maybe_call_custom_init94421006358656)
                                    ->call(
                                        @{ ($obj94421006524416) }[
                                          (
                                              map {
                                                  ref($_) eq
"Sidef::Types::Number::Number"
                                                    ? Sidef::Types::Number::Number::__numify__(
                                                      $$_)
                                                    : do {
                                                      my $sub =
                                                        UNIVERSAL::can( $_,
                                                          "..." );
                                                      defined($sub)
                                                        ? $sub->($_)
                                                        : CORE::int($_);
                                                    }
                                                } (Sidef::Runtime::Number944210065902401
                                                )
                                          )
                                        ]
                                    )
                                  );
                                (
                                    (
                                        ( ${ ($custom_blocks94421006497080) } )
                                        = (
                                            @{ ($obj94421006524416) }[
                                              (
                                                  map {
                                                      ref($_) eq
"Sidef::Types::Number::Number"
                                                        ? Sidef::Types::Number::Number::__numify__(
                                                          $$_)
                                                        : do {
                                                          my $sub =
                                                            UNIVERSAL::can( $_,
                                                              "..." );
                                                          defined($sub)
                                                            ? $sub->($_)
                                                            : CORE::int($_);
                                                        }
                                                    } (Sidef::Runtime::Number944210066286721
                                                    )
                                              )
                                            ]
                                        )
                                    )[-1]
                                  )
                                  // (
                                    bless( { () }, 'Sidef::Types::Hash::Hash' )
                                  );
                            }
                          }
                    }
                  }
            };
          END94421006510912: @return;
        },
        type      => "func",
        name      => "process_serial_prop_rhs",
        namespace => "ABCs2",
        vars      => [
            { name => "name", type => "Sidef\:\:Types\:\:String\:\:String" },
            { name => "obj",  type => "Sidef\:\:Object\:\:Object" },
            { name => "typename" },
            { name => "default_val" },
            { name => "custom_blocks" }
        ],
        table => {
            "name"          => 0,
            "obj"           => 1,
            "typename"      => 2,
            "default_val"   => 3,
            "custom_blocks" => 4
        }
    );
    do {

        package Sidef::Runtime::94421006510744::ABCs2::Serializable {
            use parent qw(-norequire  Sidef::Object::Object);
            $new94421006419832 = Sidef::Types::Block::Block->new(
                code => sub {
                    my ($_k_svalue94421006631384) =
                      ( (Sidef::Runtime::String944210066393761) );
                    my $self =
                      bless { "_k_svalue" => $_k_svalue94421006631384, },
                      __PACKAGE__;
                    if ( defined( my $sub = UNIVERSAL::can( $self, "init" ) ) )
                    {
                        $sub->($self);
                    }
                    $self;
                },
                vars  => [],
                table => {},
                type  => "class",
                name =>
                  "Sidef\:\:Runtime\:\:94421006510744\:\:ABCs2\:\:Serializable"
            );
            state $_94421006419832= do {
                no strict 'refs';
                *{
"Sidef\:\:Runtime\:\:94421006510744\:\:ABCs2\:\:Serializable\:\:new"
                  } =
                  *{
"Sidef\:\:Runtime\:\:94421006510744\:\:ABCs2\:\:Serializable\:\:call"
                  } =
                  sub { CORE::shift(@_); $new94421006419832->call(@_) }
            };
            sub _k_svalue : lvalue { $_[0]->{"_k_svalue"} }
            do {
                do {
                    $_grep_serial_properties94421006640000 =
                      Sidef::Types::Block::Block->new(
                        code => sub {
                            my ( $self94421006640888, $excl94421006641128 ) =
                              @_;
                            my @return;
                            return do {
                                (
                                    (
                                        (
                                            (
                                                ($self94421006640888)
                                                ->grep_methods(
                                                    Sidef::Types::Block::Block
                                                      ->new(
                                                        code => sub {
                                                            my (
                                                                $name94421006630712,
                                                                $_94421006640648
                                                            ) = @_;
                                                            do {
                                                                my $bool = do {
                                                                    (
                                                                        $name94421006630712
                                                                    );
                                                                  }
                                                                  ~~ do {
                                                                    (
                                                                        (Sidef::Runtime::Regex944210065602642
                                                                        )
                                                                    );
                                                                  };
                                                                ref($bool)
                                                                  ? $bool
                                                                  : ( $bool
                                                                    ? Sidef::Types::Bool::Bool::TRUE
                                                                    : Sidef::Types::Bool::Bool::FALSE
                                                                  );
                                                              }
                                                        },
                                                        type => "block",
                                                        name => "__BLOCK__",
                                                        class =>
"Sidef\:\:Runtime\:\:94421006510744\:\:ABCs2\:\:Serializable",
                                                        namespace => "ABCs2",
                                                        vars      => [
                                                            { name => "name" },
                                                            { name => "_" }
                                                        ],
                                                        table => {
                                                            "name" => 0,
                                                            "_"    => 1
                                                        }
                                                      )
                                                )
                                            )->values
                                        )->map(
                                            Sidef::Types::Block::Block->new(
                                                code => sub {
                                                    my ($_94421006642544) = @_;
                                                    ( ($_94421006642544)->call )
                                                      ->grep_kv(
                                                        Sidef::Types::Block::Block
                                                          ->new(
                                                            code => sub {
                                                                my (
                                                                    $name94421006406344,
                                                                    $_94421006406584
                                                                ) = @_;
                                                                (
                                                                    (
                                                                        (
                                                                            $excl94421006641128
                                                                        )
                                                                        ->contains
                                                                          (
                                                                            $name94421006406344
                                                                          )
                                                                    )
                                                                    ? Sidef::Types::Bool::Bool::FALSE
                                                                    : Sidef::Types::Bool::Bool::TRUE
                                                                );
                                                            },
                                                            type => "block",
                                                            name => "__BLOCK__",
                                                            class =>
"Sidef\:\:Runtime\:\:94421006510744\:\:ABCs2\:\:Serializable",
                                                            namespace =>
                                                              "ABCs2",
                                                            vars => [
                                                                {
                                                                    name =>
                                                                      "name"
                                                                },
                                                                { name => "_" }
                                                            ],
                                                            table => {
                                                                "name" => 0,
                                                                "_"    => 1
                                                            }
                                                          )
                                                      );
                                                },
                                                type => "block",
                                                name => "__BLOCK__",
                                                class =>
"Sidef\:\:Runtime\:\:94421006510744\:\:ABCs2\:\:Serializable",
                                                namespace => "ABCs2",
                                                vars => [ { name => "_" } ],
                                                table => { "_" => 0 }
                                            )
                                        )
                                    )->merge_reduce
                                  )
                                  // (
                                    bless( { () }, 'Sidef::Types::Hash::Hash' )
                                  );
                            };
                          END94421006640672: @return;
                        },
                        type => "method",
                        name => "_grep_serial_properties",
                        class =>
"Sidef\:\:Runtime\:\:94421006510744\:\:ABCs2\:\:Serializable",
                        namespace => "ABCs2",
                        vars      => [
                            { name => "self" },
                            {
                                name => "excl",
                                type => "Sidef\:\:Types\:\:Array\:\:Array"
                            }
                        ],
                        table => { "self" => 0, "excl" => 1 }
                      );
                    $_grep_serial_properties94421006640000->{returns} =
                      ["Sidef\:\:Types\:\:Hash\:\:Hash"];
                    $_grep_serial_properties94421006640000;
                };
                $_grep_serial_properties94421006640000->{code} =
                  Memoize::memoize(
                    $_grep_serial_properties94421006640000->{code} );
                $_grep_serial_properties94421006640000;
            };
            state $_94421006640000= do {
                no strict 'refs';
                $Sidef::Runtime::94421006510744::ABCs2::Serializable::__SIDEF_CLASS_METHODS__{
                    '_grep_serial_properties'} =
                  $_grep_serial_properties94421006640000;
                *{
"Sidef\:\:Runtime\:\:94421006510744\:\:ABCs2\:\:Serializable\:\:_grep_serial_properties"
                  } =
                  sub { $_grep_serial_properties94421006640000->call(@_) }
            };
            $_do_serial94421006408888 = Sidef::Types::Block::Block->new(
                code => sub {
                    my ( $self94421006663232, $exclude94421006663376,
                        $d94421006663688 )
                      = @_;
                    my @return;
                    return do {
                        ( ($self94421006663232)
                            ->_grep_serial_properties($exclude94421006663376) )
                          ->map_kv($d94421006663688);
                    };
                  END94421006663040: @return;
                },
                type => "method",
                name => "_do_serial",
                class =>
                  "Sidef\:\:Runtime\:\:94421006510744\:\:ABCs2\:\:Serializable",
                namespace => "ABCs2",
                vars      => [
                    { name => "self" },
                    {
                        name => "exclude",
                        type => "Sidef\:\:Types\:\:Array\:\:Array"
                    },
                    { name => "d", type => "Sidef\:\:Types\:\:Block\:\:Block" }
                ],
                table => { "self" => 0, "exclude" => 1, "d" => 2 }
            );
            state $_94421006408888= do {
                no strict 'refs';
                $Sidef::Runtime::94421006510744::ABCs2::Serializable::__SIDEF_CLASS_METHODS__{
                    '_do_serial'} = $_do_serial94421006408888;
                *{
"Sidef\:\:Runtime\:\:94421006510744\:\:ABCs2\:\:Serializable\:\:_do_serial"
                  } =
                  sub { $_do_serial94421006408888->call(@_) }
            };
            $_is_serialized_obj94421006664000 =
              Sidef::Types::Block::Block->new(
                code => sub {
                    my ( $self94421006665968, $obj94421006666208 ) = @_;
                    my @return;
                    return do {
                        (
                            (
                                ($is_a_fqco94421006394792)->call(
                                    $obj94421006666208,
                                    'Sidef::Types::Hash::Hash',
                                    Sidef::Variable::NamedParam->new(
                                        "must_have_prop",
                                        (
                                            (Sidef::Runtime::String944210066646721
                                            )
                                        )
                                    )
                                )
                            )
                              && (
                                do {
                                    my $bool =
                                      ( ($obj94421006666208)->keys ) eq (
                                        bless(
                                            [
                                                ($self94421006665968)
                                                ->_k_svalue
                                            ],
                                            'Sidef::Types::Array::Array'
                                        )
                                      );
                                    ref($bool) ? $bool
                                      : ( $bool ? Sidef::Types::Bool::Bool::TRUE
                                        : Sidef::Types::Bool::Bool::FALSE );
                                }
                              )
                          )
                          && (
                            ($is_a_fqco94421006394792)->call(
                                @{$obj94421006666208}{
                                    (
                                        map {
                                            ref($_) eq
                                              "Sidef::Types::String::String"
                                              ? $$_
                                              : "$_"
                                        } ($self94421006665968)->_k_svalue
                                    )
                                },
                                'Sidef::Types::Hash::Hash',
                                Sidef::Variable::NamedParam->new(
                                    "must_have_prop",
                                    ( (Sidef::Runtime::String944210066646721) )
                                )
                            )
                          );
                    };
                  END94421006664552: @return;
                },
                type => "method",
                name => "_is_serialized_obj",
                class =>
                  "Sidef\:\:Runtime\:\:94421006510744\:\:ABCs2\:\:Serializable",
                namespace => "ABCs2",
                vars      => [
                    { name => "self" },
                    { name => "obj", type => "Sidef\:\:Object\:\:Object" }
                ],
                table => { "self" => 0, "obj" => 1 }
              );
            state $_94421006664000= do {
                no strict 'refs';
                $Sidef::Runtime::94421006510744::ABCs2::Serializable::__SIDEF_CLASS_METHODS__{
                    '_is_serialized_obj'} = $_is_serialized_obj94421006664000;
                *{
"Sidef\:\:Runtime\:\:94421006510744\:\:ABCs2\:\:Serializable\:\:_is_serialized_obj"
                  } =
                  sub { $_is_serialized_obj94421006664000->call(@_) }
            };
            do {
                $serialize94421006665872 = Sidef::Types::Block::Block->new(
                    code => sub {
                        my ( $self94421006712400, $exclude94421006712736 ) = @_;
                        $exclude94421006712736 //=
                          bless( [], 'Sidef::Types::Array::Array' );
                        my @return;
                        return do {
                            ($self94421006712400)->_do_serial(
                                $exclude94421006712736,
                                Sidef::Types::Block::Block->new(
                                    code => sub {
                                        my (
                                            $field_name94421006711296,
                                            $field_rhs94421006711824
                                        ) = @_;
                                        my ($prelim_val94421006467952);
                                        my ($type94421006452096);
                                        my ($_94421006451088);
                                        my ($default_val94421006450200);
                                        my ($typename94421006714368);
                                        ($process_serial_prop_rhs94421006510408)
                                          ->call(
                                            $field_name94421006711296,
                                            $field_rhs94421006711824,
                                            \( ( ($typename94421006714368) ) ),
                                            \(
                                                (
                                                    (
                                                        $default_val94421006450200
                                                    )
                                                )
                                            ),
                                            \( ( ($_94421006451088) ) )
                                          );
                                        ( ($type94421006452096) );
                                        my sub value94421006452816() {
                                            state $_94421006452816= do {
                                                (
                                                    do {
                                                        if (
                                                            (
                                                                (
                                                                    $self94421006712400
                                                                )->is_property(
                                                                    $field_name94421006711296,
                                                                    $default_val94421006450200
                                                                )
                                                            )
                                                          )
                                                        {
                                                            (
                                                                (
                                                                    $type94421006452096
                                                                )
                                                                = (
                                                                    (Sidef::Runtime::String944210064551121
                                                                    )
                                                                )
                                                            )[-1];
                                                            @{
                                                                $self94421006712400
                                                              }{
                                                                (
                                                                    map {
                                                                        ref($_)
                                                                          eq
"Sidef::Types::String::String"
                                                                          ? $$_
                                                                          : "$_"
                                                                    } $field_name94421006711296
                                                                )
                                                              };
                                                        }
                                                        elsif (
                                                            (
                                                                (
                                                                    $self94421006712400
                                                                )
                                                                ->has_overload(
                                                                    bless(
                                                                        {
                                                                            (
                                                                                (Sidef::Runtime::String944210054725361
                                                                                )
                                                                                ,
                                                                                (Sidef::Runtime::String944210064668001
                                                                                  )
                                                                                ,
                                                                                (Sidef::Runtime::String944210054753681
                                                                                  )
                                                                                ,
                                                                                $field_name94421006711296,
                                                                                (Sidef::Runtime::String944210054341121
                                                                                  )
                                                                                ,
                                                                                \
                                                                                  (
                                                                                    (
                                                                                        (
                                                                                            $prelim_val94421006467952
                                                                                        )
                                                                                    )
                                                                                  )
                                                                            )
                                                                        },
'Sidef::Types::Hash::Hash'
                                                                    )
                                                                )
                                                            )
                                                          )
                                                        {
                                                            (
                                                                (
                                                                    $type94421006452096
                                                                )
                                                                = (
                                                                    (Sidef::Runtime::String944210067615601
                                                                    )
                                                                )
                                                            )[-1];
                                                            $prelim_val94421006467952;
                                                        }
                                                        else {
                                                            do {
                                                                CORE::die(
                                                                    (
                                                                        (
                                                                            (
'Sidef::Types::String::String'
                                                                            )
                                                                            ->interpolate
                                                                              (
                                                                                do
                                                                                {
                                                                                    (Sidef::Runtime::String944210065910081
                                                                                      )
                                                                                      ;
                                                                                  }
                                                                                ,
"\:",
                                                                                do
                                                                                {
                                                                                    (Sidef::Runtime::Number944210068472241
                                                                                      )
                                                                                      ;
                                                                                  }
                                                                                ,
"\:\ ",
                                                                                do
                                                                                {
                                                                                    (Sidef::Runtime::String944210064668001
                                                                                      )
                                                                                      ;
                                                                                  }
                                                                                ,
"\:\ ",
                                                                                do
                                                                                {
                                                                                    $field_name94421006711296;
                                                                                  }
                                                                                ,
"\ \(",
                                                                                do
                                                                                {
                                                                                    $typename94421006714368;
                                                                                  }
                                                                                ,
"\)\ "
                                                                              )
                                                                        )
                                                                        ->$Sidef::Runtime::OP4394421007688824
                                                                          (
                                                                            (Sidef::Runtime::String944210066404081
                                                                            )
                                                                          )
                                                                    ),
" at \.\/ABCs2\.sm line 217\n"
                                                                );
                                                              }
                                                        }
                                                      }
                                                  )
                                                  // (
                                                    $default_val94421006450200);
                                              }
                                        }
                                        (value94421006452816);
                                        $field_name94421006711296,
                                          (
                                            ($is_serializable94421006311928)
                                            ->call( (value94421006452816) )
                                            ? (
                                                bless(
                                                    {
                                                        (
                                                            (
                                                                $self94421006712400
                                                            )->_k_svalue,
                                                            (
                                                                (
                                                                    value94421006452816
                                                                )
                                                            )->serialize
                                                        )
                                                    },
                                                    'Sidef::Types::Hash::Hash'
                                                )
                                              )
                                            : ( (value94421006452816) )
                                          );
                                    },
                                    type => "block",
                                    name => "__BLOCK__",
                                    class =>
"Sidef\:\:Runtime\:\:94421006510744\:\:ABCs2\:\:Serializable",
                                    namespace => "ABCs2",
                                    vars      => [
                                        { name => "field_name" },
                                        { name => "field_rhs" }
                                    ],
                                    table =>
                                      { "field_name" => 0, "field_rhs" => 1 }
                                )
                            );
                        };
                      END94421006712160: @return;
                    },
                    type => "method",
                    name => "serialize",
                    class =>
"Sidef\:\:Runtime\:\:94421006510744\:\:ABCs2\:\:Serializable",
                    namespace => "ABCs2",
                    vars      => [
                        { name => "self" },
                        {
                            name      => "exclude",
                            type      => "Sidef\:\:Types\:\:Array\:\:Array",
                            has_value => 1
                        }
                    ],
                    table => { "self" => 0, "exclude" => 1 }
                );
                $serialize94421006665872->{returns} =
                  ["Sidef\:\:Types\:\:Hash\:\:Hash"];
                $serialize94421006665872;
            };
            state $_94421006665872= do {
                no strict 'refs';
                $Sidef::Runtime::94421006510744::ABCs2::Serializable::__SIDEF_CLASS_METHODS__{
                    'serialize'} = $serialize94421006665872;
                *{
"Sidef\:\:Runtime\:\:94421006510744\:\:ABCs2\:\:Serializable\:\:serialize"
                  } =
                  sub { $serialize94421006665872->call(@_) }
            };
            do {
                $unserialize94421006710744 = Sidef::Types::Block::Block->new(
                    code => sub {
                        my ( $self94421006868760, $data94421006868952,
                            $exclude94421006874408 )
                          = @_;
                        $exclude94421006874408 //=
                          bless( [], 'Sidef::Types::Array::Array' );
                        my @return;
                        ($self94421006868760)->_do_serial(
                            $exclude94421006874408,
                            Sidef::Types::Block::Block->new(
                                code => sub {
                                    my (
                                        $field_name94421006868256,
                                        $field_rhs94421006874792
                                    ) = @_;
                                    my ($_94421006877840);
                                    my ($default_val94421006876952);
                                    my ($typename94421006876088);
                                    ($process_serial_prop_rhs94421006510408)
                                      ->call(
                                        $field_name94421006868256,
                                        $field_rhs94421006874792,
                                        \( ( ($typename94421006876088) ) ),
                                        \( ( ($default_val94421006876952) ) ),
                                        \( ( ($_94421006877840) ) )
                                      );
                                    my sub entry94421006890920() {
                                        state $_94421006890920= do {
                                            @{$data94421006868952}{
                                                (
                                                    map {
                                                        ref($_) eq
"Sidef::Types::String::String"
                                                          ? $$_
                                                          : "$_"
                                                    } $field_name94421006868256
                                                )
                                            };
                                          }
                                    }
                                    (entry94421006890920);
                                    (
                                        do {
                                            if (
                                                (
                                                    (
                                                        (
                                                            (
                                                                $self94421006868760
                                                            )
                                                            ->_is_serialized_obj
                                                            (
                                                                (
                                                                    entry94421006890920
                                                                )
                                                            )
                                                        )
                                                        ? Sidef::Types::Bool::Bool::FALSE
                                                        : Sidef::Types::Bool::Bool::TRUE
                                                    )
                                                )
                                              )
                                            {
                                                (entry94421006890920);
                                            }
                                            else {
                                                (
                                                    (
                                                        $maybe_call_custom_init94421006358656
                                                    )->call(
                                                        $default_val94421006876952
                                                    )
                                                  )->unserialize(
                                                    @{ (entry94421006890920) }{
                                                        (
                                                            map {
                                                                ref($_) eq
"Sidef::Types::String::String"
                                                                  ? $$_
                                                                  : "$_"
                                                              } (
                                                                $self94421006868760
                                                              )->_k_svalue
                                                        )
                                                    },
                                                    Sidef::Variable::NamedParam
                                                      ->new(
                                                        "exclude",
                                                        (
                                                            $exclude94421006874408
                                                        )
                                                      )
                                                  );
                                            }
                                          }
                                      )->in_scope(
                                        Sidef::Types::Block::Block->new(
                                            code => sub {
                                                my ($derived94421006902360) =
                                                  @_;
                                                do {
                                                    if (
                                                        (
                                                            (
                                                                $self94421006868760
                                                            )->is_property(
                                                                $field_name94421006868256,
                                                                $derived94421006902360
                                                            )
                                                        )
                                                      )
                                                    {
                                                        (
                                                            (
                                                                @{
                                                                    $self94421006868760
                                                                  }{
                                                                    (
                                                                        map {
                                                                            ref(
                                                                                $_
                                                                              )
                                                                              eq
"Sidef::Types::String::String"
                                                                              ? $$_
                                                                              : "$_"
                                                                        } $field_name94421006868256
                                                                    )
                                                                  }
                                                            )
                                                            = (
                                                                $derived94421006902360
                                                            )
                                                        )[-1];
                                                    }
                                                    else {
                                                        my (
                                                            $retval94421006917664
                                                        );
                                                        my sub res94421006914976()
                                                        {
                                                            state $_94421006914976
                                                              = do {
                                                                (
                                                                    $self94421006868760
                                                                  )
                                                                  ->has_overload
                                                                  (
                                                                    bless(
                                                                        {
                                                                            (
                                                                                (Sidef::Runtime::String944210054725361
                                                                                )
                                                                                ,
                                                                                (Sidef::Runtime::String944210069164881
                                                                                  )
                                                                                ,
                                                                                (Sidef::Runtime::String944210054753681
                                                                                  )
                                                                                ,
                                                                                $field_name94421006868256,
                                                                                (Sidef::Runtime::String944210054341121
                                                                                  )
                                                                                ,
                                                                                \
                                                                                  (
                                                                                    (
                                                                                        (
                                                                                            $retval94421006917664
                                                                                        )
                                                                                    )
                                                                                  )
                                                                                ,
                                                                                (Sidef::Runtime::String944210015588881
                                                                                  )
                                                                                ,
                                                                                bless
                                                                                  (
                                                                                    [
                                                                                        $derived94421006902360
                                                                                    ]
                                                                                    ,
'Sidef::Types::Array::Array'
                                                                                  )
                                                                            )
                                                                        },
'Sidef::Types::Hash::Hash'
                                                                    )
                                                                  );
                                                              }
                                                        }
                                                        (res94421006914976);
                                                        do {
                                                            if (
                                                                (
                                                                    (
                                                                        (
                                                                            (
                                                                                res94421006914976
                                                                            )
                                                                        )
                                                                        ? Sidef::Types::Bool::Bool::FALSE
                                                                        : Sidef::Types::Bool::Bool::TRUE
                                                                    )
                                                                )
                                                              )
                                                            {
                                                                do {
                                                                    CORE::die(
                                                                        (
                                                                            (
                                                                                (
'Sidef::Types::String::String'
                                                                                )
                                                                                ->
                                                                                interpolate
                                                                                  (
                                                                                    do
                                                                                    {
                                                                                        (Sidef::Runtime::String944210065910081
                                                                                          )
                                                                                          ;
                                                                                      }
                                                                                    ,
"\:",
                                                                                    do
                                                                                    {
                                                                                        (Sidef::Runtime::Number944210069381681
                                                                                          )
                                                                                          ;
                                                                                      }
                                                                                    ,
"\:\ ",
                                                                                    do
                                                                                    {
                                                                                        (Sidef::Runtime::String944210069164881
                                                                                          )
                                                                                          ;
                                                                                      }
                                                                                    ,
"\:\ ",
                                                                                    do
                                                                                    {
                                                                                        $field_name94421006868256;
                                                                                      }
                                                                                    ,
"\ \(",
                                                                                    do
                                                                                    {
                                                                                        $typename94421006876088;
                                                                                      }
                                                                                    ,
"\)\ \(value\ ",
                                                                                    do
                                                                                    {
                                                                                        $derived94421006902360;
                                                                                      }
                                                                                    ,
"\)\ "
                                                                                  )
                                                                            )
                                                                            ->$Sidef::Runtime::OP4394421007688824
                                                                              (
                                                                                (Sidef::Runtime::String944210067708561
                                                                                )
                                                                              )
                                                                        ),
" at \.\/ABCs2\.sm line 271\n"
                                                                    );
                                                                  }
                                                            }
                                                          }
                                                    }
                                                  }
                                            },
                                            type => "block",
                                            name => "__BLOCK__",
                                            class =>
"Sidef\:\:Runtime\:\:94421006510744\:\:ABCs2\:\:Serializable",
                                            namespace => "ABCs2",
                                            vars => [ { name => "derived" } ],
                                            table => { "derived" => 0 }
                                        )
                                      );
                                },
                                type => "block",
                                name => "__BLOCK__",
                                class =>
"Sidef\:\:Runtime\:\:94421006510744\:\:ABCs2\:\:Serializable",
                                namespace => "ABCs2",
                                vars      => [
                                    { name => "field_name" },
                                    { name => "field_rhs" }
                                ],
                                table => { "field_name" => 0, "field_rhs" => 1 }
                            )
                        );
                        return do { $self94421006868760 };
                      END94421006868520: @return;
                    },
                    type => "method",
                    name => "unserialize",
                    class =>
"Sidef\:\:Runtime\:\:94421006510744\:\:ABCs2\:\:Serializable",
                    namespace => "ABCs2",
                    vars      => [
                        { name => "self" },
                        {
                            name => "data",
                            type => "Sidef\:\:Types\:\:Hash\:\:Hash"
                        },
                        {
                            name      => "exclude",
                            type      => "Sidef\:\:Types\:\:Array\:\:Array",
                            has_value => 1
                        }
                    ],
                    table => { "self" => 0, "data" => 1, "exclude" => 2 }
                );
                $unserialize94421006710744->{returns} =
                  ["Sidef\:\:Runtime\:\:94421006510744\:\:ABCs2\:\:Serializable"
                  ];
                $unserialize94421006710744;
            };
            state $_94421006710744= do {
                no strict 'refs';
                $Sidef::Runtime::94421006510744::ABCs2::Serializable::__SIDEF_CLASS_METHODS__{
                    'unserialize'} = $unserialize94421006710744;
                *{
"Sidef\:\:Runtime\:\:94421006510744\:\:ABCs2\:\:Serializable\:\:unserialize"
                  } =
                  sub { $unserialize94421006710744->call(@_) }
              }
        };
        'Sidef::Runtime::94421006510744::ABCs2::Serializable';
    };
    do {

        package Sidef::Runtime::94421006629632::ABCs2::SeriallyEquatable {
            use parent
              qw(-norequire Sidef::Runtime::94421006510744::ABCs2::Serializable Sidef::Object::Object);
            $new94421006960536 = Sidef::Types::Block::Block->new(
                code => sub {
                    my ($_k_svalue94421006631384) =
                      ( (Sidef::Runtime::String944210066393761) );
                    my $self =
                      bless { "_k_svalue" => $_k_svalue94421006631384, },
                      __PACKAGE__;
                    if ( defined( my $sub = UNIVERSAL::can( $self, "init" ) ) )
                    {
                        $sub->($self);
                    }
                    $self;
                },
                vars  => [],
                table => {},
                type  => "class",
                name =>
"Sidef\:\:Runtime\:\:94421006629632\:\:ABCs2\:\:SeriallyEquatable"
            );
            state $_94421006960536= do {
                no strict 'refs';
                *{
"Sidef\:\:Runtime\:\:94421006629632\:\:ABCs2\:\:SeriallyEquatable\:\:new"
                  } =
                  *{
"Sidef\:\:Runtime\:\:94421006629632\:\:ABCs2\:\:SeriallyEquatable\:\:call"
                  } =
                  sub { CORE::shift(@_); $new94421006960536->call(@_) }
            };
            sub _k_svalue : lvalue { $_[0]->{"_k_svalue"} }
            do {
                $_serial_eq94421006960728 = Sidef::Types::Block::Block->new(
                    code => sub {
                        my ( $self94421006960128, $other94421006961640,
                            $exclude_props94421006962000 )
                          = @_;
                        $exclude_props94421006962000 //=
                          bless( [], 'Sidef::Types::Array::Array' );
                        my @return;
                        return do {
                            do {
                                if (
                                    (
                                        ($other94421006961640)->is_a(
'Sidef::Runtime::94421006510744::ABCs2::Serializable'
                                        )
                                    )
                                  )
                                {
                                    do {
                                        my $bool = (
                                            ($other94421006961640)->serialize(
                                                Sidef::Variable::NamedParam
                                                  ->new(
                                                    "exclude",
                                                    (
                                                        $exclude_props94421006962000
                                                    )
                                                  )
                                            )
                                          ) eq (
                                            ($self94421006960128)->serialize(
                                                Sidef::Variable::NamedParam
                                                  ->new(
                                                    "exclude",
                                                    (
                                                        $exclude_props94421006962000
                                                    )
                                                  )
                                            )
                                          );
                                        ref($bool) ? $bool
                                          : ( $bool
                                            ? Sidef::Types::Bool::Bool::TRUE
                                            : Sidef::Types::Bool::Bool::FALSE );
                                      }
                                }
                                elsif (
                                    (
                                        do {
                                            my $bool =
                                              do    { ($other94421006961640) }
                                              ~~ do { ($self94421006960128) };
                                            ref($bool) ? $bool
                                              : ( $bool
                                                ? Sidef::Types::Bool::Bool::TRUE
                                                : Sidef::Types::Bool::Bool::FALSE
                                              );
                                        }
                                    )
                                  )
                                {
                                    (
                                        (
                                            bless(
                                                [
                                                    $self94421006960128,
                                                    $other94421006961640
                                                ],
                                                'Sidef::Types::Array::Array'
                                            )
                                        )->map(
                                            Sidef::Types::Block::Block->new(
                                                code => sub {
                                                    my ($obj94421007002832) =
                                                      @_;
                                                    ($self94421006960128)
                                                      ->_do_serial(
                                                        $exclude_props94421006962000,
                                                        Sidef::Types::Block::Block
                                                          ->new(
                                                            code => sub {
                                                                my (
                                                                    $_94421007013856
                                                                ) = @_;
                                                                (
                                                                    (
                                                                        $obj94421007002832
                                                                    )->method(
                                                                        $_94421007013856
                                                                    )
                                                                )->call;
                                                            },
                                                            type => "block",
                                                            name => "__BLOCK__",
                                                            class =>
"Sidef\:\:Runtime\:\:94421006629632\:\:ABCs2\:\:SeriallyEquatable",
                                                            namespace =>
                                                              "ABCs2",
                                                            vars => [
                                                                { name => "_" }
                                                            ],
                                                            table =>
                                                              { "_" => 0 }
                                                          )
                                                      );
                                                },
                                                type => "block",
                                                name => "__BLOCK__",
                                                class =>
"Sidef\:\:Runtime\:\:94421006629632\:\:ABCs2\:\:SeriallyEquatable",
                                                namespace => "ABCs2",
                                                vars => [ { name => "obj" } ],
                                                table => { "obj" => 0 }
                                            )
                                        )
                                    )->reduce_operator("\=\=");
                                }
                                else {
                                    (
                                        ($self94421006960128)->_do_serial(
                                            $exclude_props94421006962000,
                                            Sidef::Types::Block::Block->new(
                                                code => sub {
                                                    my ($_94421007016856) = @_;
                                                    do {
                                                        my $bool = (
                                                            @{
                                                                $other94421006961640
                                                              }{
                                                                (
                                                                    map {
                                                                        ref($_)
                                                                          eq
"Sidef::Types::String::String"
                                                                          ? $$_
                                                                          : "$_"
                                                                    } $_94421007016856
                                                                )
                                                              }
                                                          ) eq (
                                                            @{
                                                                $self94421006960128
                                                              }{
                                                                (
                                                                    map {
                                                                        ref($_)
                                                                          eq
"Sidef::Types::String::String"
                                                                          ? $$_
                                                                          : "$_"
                                                                    } $_94421007016856
                                                                )
                                                              }
                                                          );
                                                        ref($bool) ? $bool
                                                          : ( $bool
                                                            ? Sidef::Types::Bool::Bool::TRUE
                                                            : Sidef::Types::Bool::Bool::FALSE
                                                          );
                                                      }
                                                },
                                                type => "block",
                                                name => "__BLOCK__",
                                                class =>
"Sidef\:\:Runtime\:\:94421006629632\:\:ABCs2\:\:SeriallyEquatable",
                                                namespace => "ABCs2",
                                                vars => [ { name => "_" } ],
                                                table => { "_" => 0 }
                                            )
                                        )
                                    )->all;
                                }
                              }
                        };
                      END94421006961136: @return;
                    },
                    type => "method",
                    name => "_serial_eq",
                    class =>
"Sidef\:\:Runtime\:\:94421006629632\:\:ABCs2\:\:SeriallyEquatable",
                    namespace => "ABCs2",
                    vars      => [
                        { name => "self" },
                        { name => "other" },
                        { name => "exclude_props", has_value => 1 }
                    ],
                    table => { "self" => 0, "other" => 1, "exclude_props" => 2 }
                );
                $_serial_eq94421006960728->{returns} =
                  ["Sidef\:\:Types\:\:Bool\:\:Bool"];
                $_serial_eq94421006960728;
            };
            state $_94421006960728= do {
                no strict 'refs';
                $Sidef::Runtime::94421006629632::ABCs2::SeriallyEquatable::__SIDEF_CLASS_METHODS__{
                    '_serial_eq'} = $_serial_eq94421006960728;
                *{
"Sidef\:\:Runtime\:\:94421006629632\:\:ABCs2\:\:SeriallyEquatable\:\:_serial_eq"
                  } =
                  sub { $_serial_eq94421006960728->call(@_) }
            };
            $__NONANN__94421006962432 = Sidef::Types::Block::Block->new(
                code => sub {
                    my ( $self94421007125288, $other94421007125480 ) = @_;
                    my @return;
                    return do {
                        ($self94421007125288)->_serial_eq($other94421007125480);
                    };
                  END94421007125216: @return;
                },
                type => "method",
                name => "\=\=",
                class =>
"Sidef\:\:Runtime\:\:94421006629632\:\:ABCs2\:\:SeriallyEquatable",
                namespace => "ABCs2",
                vars      => [ { name => "self" }, { name => "other" } ],
                table => { "self" => 0, "other" => 1 }
            );
            state $_94421006962432= do {
                no strict 'refs';
                $Sidef::Runtime::94421006629632::ABCs2::SeriallyEquatable::__SIDEF_CLASS_METHODS__{
                    '=='} = $__NONANN__94421006962432;
                *{
"Sidef\:\:Runtime\:\:94421006629632\:\:ABCs2\:\:SeriallyEquatable\:\:\=\="
                  } =
                  sub { $__NONANN__94421006962432->call(@_) }
            };
            use overload q{eq} => sub {
                my ( $first, $second, $swap ) = @_;
                if ($swap) { ( $first, $second ) = ( $second, $first ) }
                $first->$Sidef::Runtime::OP616194421007688824($second);
            };
        };
        'Sidef::Runtime::94421006629632::ABCs2::SeriallyEquatable';
    };
    $_call_methods_blocks_by94421006960344 = Sidef::Types::Block::Block->new(
        code => sub {
            my ( $obj94421007127400, $r94421007244920 ) = @_;
            my @return;
            return do {
                ($obj94421007127400)->grep_map_methods(
                    Sidef::Types::Block::Block->new(
                        code => sub {
                            my ( $name94421007124976, $_94421007124592 ) = @_;
                            do {
                                my $bool = do { ($name94421007124976) }
                                  ~~ do { ($r94421007244920) };
                                ref($bool) ? $bool
                                  : ( $bool ? Sidef::Types::Bool::Bool::TRUE
                                    : Sidef::Types::Bool::Bool::FALSE );
                              }
                        },
                        type      => "block",
                        name      => "__BLOCK__",
                        namespace => "ABCs2",
                        vars      => [ { name => "name" }, { name => "_" } ],
                        table => { "name" => 0, "_" => 1 }
                    ),
                    Sidef::Types::Block::Block->new(
                        code => sub {
                            my ( $_94421007246456, $calls94421007246696 ) = @_;
                            ( ($calls94421007246696)->call )->each(
                                Sidef::Types::Block::Block->new(
                                    code => sub {
                                        my ($block94421007247584) = @_;
                                        ($block94421007247584)
                                          ->run($obj94421007127400);
                                    },
                                    type      => "block",
                                    name      => "__BLOCK__",
                                    namespace => "ABCs2",
                                    vars      => [ { name => "block" } ],
                                    table => { "block" => 0 }
                                )
                            );
                        },
                        type      => "block",
                        name      => "__BLOCK__",
                        namespace => "ABCs2",
                        vars      => [ { name => "_" }, { name => "calls" } ],
                        table => { "_" => 0, "calls" => 1 }
                    )
                );
            };
          END94421007127136: @return;
        },
        type      => "func",
        name      => "_call_methods_blocks_by",
        namespace => "ABCs2",
        vars      => [
            { name => "obj", type => "Sidef\:\:Object\:\:Object" },
            { name => "r",   type => "Sidef\:\:Types\:\:Regex\:\:Regex" }
        ],
        table => { "obj" => 0, "r" => 1 }
    );
    do {

        package Sidef::Runtime::94421007124016::ABCs2::ModularInit {
            use parent qw(-norequire  Sidef::Object::Object);
            $new94421007250912 = Sidef::Types::Block::Block->new(
                code => sub {
                    my $self = bless {}, __PACKAGE__;
                    if ( defined( my $sub = UNIVERSAL::can( $self, "init" ) ) )
                    {
                        $sub->($self);
                    }
                    $self;
                },
                vars  => [],
                table => {},
                type  => "class",
                name =>
                  "Sidef\:\:Runtime\:\:94421007124016\:\:ABCs2\:\:ModularInit"
            );
            state $_94421007250912= do {
                no strict 'refs';
                *{
"Sidef\:\:Runtime\:\:94421007124016\:\:ABCs2\:\:ModularInit\:\:new"
                  } =
                  *{
"Sidef\:\:Runtime\:\:94421007124016\:\:ABCs2\:\:ModularInit\:\:call"
                  } =
                  sub { CORE::shift(@_); $new94421007250912->call(@_) }
            };
            $init94421007251104 = Sidef::Types::Block::Block->new(
                code => sub {
                    my ($self94421007250504) = @_;
                    my @return;
                    ($_call_methods_blocks_by94421006960344)
                      ->call( $self94421007250504,
                        (Sidef::Runtime::Regex944210069331762) );
                    return do { $self94421007250504 };
                  END94421007251512: @return;
                },
                type => "method",
                name => "init",
                class =>
                  "Sidef\:\:Runtime\:\:94421007124016\:\:ABCs2\:\:ModularInit",
                namespace => "ABCs2",
                vars      => [ { name => "self" } ],
                table => { "self" => 0 }
            );
            state $_94421007251104= do {
                no strict 'refs';
                $Sidef::Runtime::94421007124016::ABCs2::ModularInit::__SIDEF_CLASS_METHODS__{
                    'init'} = $init94421007251104;
                *{
"Sidef\:\:Runtime\:\:94421007124016\:\:ABCs2\:\:ModularInit\:\:init"
                  } =
                  sub { $init94421007251104->call(@_) }
              }
        };
        'Sidef::Runtime::94421007124016::ABCs2::ModularInit';
    };
    my sub global_init_steps_sa_base94421007268728() {
        state $_94421007268728= do {
            bless(
                [
                    Sidef::Types::Block::Block->new(
                        code => sub {
                            my ($_94421007250144) = @_;
                            ($_94421007250144)->_do_serial(
                                bless( [], 'Sidef::Types::Array::Array' ),
                                ($_94421007250144)->_bound_accessor_generator
                            );
                        },
                        type => "block",
                        name => "__BLOCK__",
                        vars => [ { name => "_" } ],
                        table => { "_" => 0 }
                    )
                ],
                'Sidef::Types::Array::Array'
            );
          }
    }
    (global_init_steps_sa_base94421007268728);
    do {

        package Sidef::Runtime::94421007269064::ABCs2::SeriallyAccessible {
            use parent
              qw(-norequire Sidef::Runtime::94421007124016::ABCs2::ModularInit Sidef::Runtime::94421006629632::ABCs2::SeriallyEquatable Sidef::Object::Object);
            $new94421007271200 = Sidef::Types::Block::Block->new(
                code => sub {
                    my ($_k_svalue94421006631384) =
                      ( (Sidef::Runtime::String944210066393761) );
                    my ($init_steps_sa_base94421006155808) =
                      ( (global_init_steps_sa_base94421007268728) );
                    my $self = bless {
                        "init_steps_sa_base" =>
                          $init_steps_sa_base94421006155808,
                        "_k_svalue" => $_k_svalue94421006631384,
                      },
                      __PACKAGE__;
                    if ( defined( my $sub = UNIVERSAL::can( $self, "init" ) ) )
                    {
                        $sub->($self);
                    }
                    $self;
                },
                vars  => [],
                table => {},
                type  => "class",
                name =>
"Sidef\:\:Runtime\:\:94421007269064\:\:ABCs2\:\:SeriallyAccessible"
            );
            state $_94421007271200= do {
                no strict 'refs';
                *{
"Sidef\:\:Runtime\:\:94421007269064\:\:ABCs2\:\:SeriallyAccessible\:\:new"
                  } =
                  *{
"Sidef\:\:Runtime\:\:94421007269064\:\:ABCs2\:\:SeriallyAccessible\:\:call"
                  } =
                  sub { CORE::shift(@_); $new94421007271200->call(@_) }
            };
            sub init_steps_sa_base : lvalue { $_[0]->{"init_steps_sa_base"} }
            sub _k_svalue : lvalue          { $_[0]->{"_k_svalue"} }
            $_bound_accessor_generator94421006156408 =
              Sidef::Types::Block::Block->new(
                code => sub {
                    my ($self94421006157104) = @_;
                    my @return;
                    my $acc94421007330832;
                    my $acc94421007319240;
                    return do {
                        Sidef::Types::Block::Block->new(
                            code => sub {
                                my (
                                    $field_name94421006157656,
                                    $field_rhs94421006157896
                                ) = @_;
                                my ($custom_blocks94421007291248);
                                my ($default_val94421006158904);
                                my ($typename94421006156768);
                                ($process_serial_prop_rhs94421006510408)->call(
                                    $field_name94421006157656,
                                    $field_rhs94421006157896,
                                    \( ( ($typename94421006156768) ) ),
                                    \( ( ($default_val94421006158904) ) ),
                                    \( ( ($custom_blocks94421007291248) ) )
                                );
                                (
                                    do {
                                        my $bool =
                                          do { ($typename94421006156768) }
                                          ~~ do { ($default_val94421006158904) };
                                        ref($bool) ? $bool
                                          : ( $bool
                                            ? Sidef::Types::Bool::Bool::TRUE
                                            : Sidef::Types::Bool::Bool::FALSE );
                                      }
                                  )
                                  || (
                                    do {
                                        CORE::die(
                                            (
                                                (
'Sidef::Types::String::String'
                                                )->interpolate(
                                                    do {
                                                        (Sidef::Runtime::String944210065910081
                                                        );
                                                    },
                                                    "\:",
                                                    do {
                                                        (Sidef::Runtime::Number944210066501281
                                                        );
                                                    },
                                                    "\:\ ",
                                                    do {
                                                        (Sidef::Runtime::String944210066505601
                                                        );
                                                    },
"\:\ type\ mismatch\ when\ generating\ default\ value\ for\ \'",
                                                    do {
                                                        $field_name94421006157656;
                                                    },
                                                    "\'\:\ "
                                                ),
                                                (
'Sidef::Types::String::String'
                                                  )->interpolate(
                                                    "want\ \'",
                                                    do {
                                                        $typename94421006156768;
                                                    },
                                                    "\'\;\ got\ \'",
                                                    do {
                                                        (
                                                            $default_val94421006158904
                                                        )->class;
                                                    },
                                                    "\'\ \(\'",
                                                    do {
                                                        (
                                                            $default_val94421006158904
                                                        )->dump;
                                                    },
                                                    "\'\)"
                                                  )
                                            ),
                                            " at \.\/ABCs2\.sm line 332\n"
                                        );
                                    }
                                  );
                                (
                                    ($self94421006157104)->is_property(
                                        $field_name94421006157656,
                                        $default_val94421006158904
                                    )
                                  )
                                  && (
                                    do {
                                        CORE::die(
                                            (
                                                (
                                                    (Sidef::Runtime::String944210072934801
                                                    )
                                                )
                                                ->$Sidef::Runtime::OP4394421007688824
                                                  (
                                                    (
                                                        (
                                                            $field_name94421006157656
                                                        )->dump
                                                    )
                                                    ->$Sidef::Runtime::OP4394421007688824
                                                      (
                                                        (Sidef::Runtime::String944210072946321
                                                        )
                                                      )
                                                  )
                                            ),
                                            " at \.\/ABCs2\.sm line 334\n"
                                        );
                                    }
                                  );
                                (
                                    (
                                        @{$self94421006157104}{
                                            (
                                                map {
                                                    ref($_) eq
"Sidef::Types::String::String"
                                                      ? $$_
                                                      : "$_"
                                                  } (
                                                    (Sidef::Runtime::String944210073004401
                                                    )
                                                  )
                                                  ->$Sidef::Runtime::OP4394421007688824
                                                  (
                                                    $field_name94421006157656)
                                            )
                                        }
                                    )
                                    = ($default_val94421006158904)
                                )[-1];
                                my sub setter_prelude94421007297968() {
                                    state $_94421007297968= do {
                                        Sidef::Types::Block::Block->new(
                                            code => sub {
                                                my ($_94421007316960) = @_;
                                                (
                                                    ($_94421007316960)->is_a(
                                                        $typename94421006156768)
                                                  )
                                                  || (
                                                    do {
                                                        CORE::die(
                                                            (
                                                                (
'Sidef::Types::String::String'
                                                                )->interpolate(
                                                                    do {
                                                                        (Sidef::Runtime::String944210065910081
                                                                        );
                                                                    },
                                                                    "\:",
                                                                    do {
                                                                        (Sidef::Runtime::Number944210073201761
                                                                        );
                                                                    },
                                                                    "\:\ ",
                                                                    do {
                                                                        (Sidef::Runtime::String944210066505601
                                                                        );
                                                                    },
                                                                    "\:\ \ "
                                                                ),
                                                                (
'Sidef::Types::String::String'
                                                                  )
                                                                  ->interpolate(
"type\ mismatch\ in\ generated\ setter\ \'",
                                                                    do {
                                                                        $field_name94421006157656;
                                                                    },
"\'\:\ want\ \'",
                                                                    do {
                                                                        $typename94421006156768;
                                                                    },
"\'\;\ got\ \'",
                                                                    do {
                                                                        (
                                                                            $_94421007316960
                                                                          )
                                                                          ->class;
                                                                    },
"\'\ \ \(\'",
                                                                    do {
                                                                        (
                                                                            $_94421007316960
                                                                          )
                                                                          ->dump;
                                                                    },
                                                                    "\'\)"
                                                                  )
                                                            ),
" at \.\/ABCs2\.sm line 345\n"
                                                        );
                                                    }
                                                  );
                                            },
                                            type => "block",
                                            name => "__BLOCK__",
                                            class =>
"Sidef\:\:Runtime\:\:94421007269064\:\:ABCs2\:\:SeriallyAccessible",
                                            namespace => "ABCs2",
                                            vars      => [ { name => "_" } ],
                                            table => { "_" => 0 }
                                        );
                                      }
                                }
                                (setter_prelude94421007297968);
                                $acc94421007319240 =
                                  Sidef::Types::Block::Block->new(
                                    code => sub {
                                        my ($self94421007330592) = @_;
                                        my @return;
                                        (
                                            state $custom_getter94421007359968=
                                              do {
                                                @{$custom_blocks94421007291248}{
                                                    (
                                                        map {
                                                            ref($_) eq
"Sidef::Types::String::String"
                                                              ? $$_
                                                              : "$_"
                                                            } (Sidef::Runtime::String944210073323201
                                                            )
                                                    )
                                                };
                                              }
                                        );
                                        return do {
                                            do {
                                                if (
                                                    (
                                                        $custom_getter94421007359968
                                                    )
                                                  )
                                                {
                                                    (
                                                        $custom_getter94421007359968
                                                      )
                                                      ->run(
                                                        $self94421007330592);
                                                }
                                                else {
                                                    @{$self94421007330592}{
                                                        (
                                                            map {
                                                                ref($_) eq
"Sidef::Types::String::String"
                                                                  ? $$_
                                                                  : "$_"
                                                              } (
                                                                (Sidef::Runtime::String944210073004401
                                                                )
                                                              )
                                                              ->$Sidef::Runtime::OP4394421007688824
                                                              (
                                                                $field_name94421006157656
                                                              )
                                                        )
                                                    };
                                                }
                                              }
                                        };
                                      END94421007330424: @return;
                                    },
                                    type => "func",
                                    name => "acc",
                                    class =>
"Sidef\:\:Runtime\:\:94421007269064\:\:ABCs2\:\:SeriallyAccessible",
                                    namespace => "ABCs2",
                                    vars      => [ { name => "self" } ],
                                    table => { "self" => 0 },
                                    kids  => [
                                        do {
                                            $acc94421007330832 =
                                              Sidef::Types::Block::Block->new(
                                                code => sub {
                                                    my ( $self94421007366888,
                                                        $new_val94421007367128 )
                                                      = @_;
                                                    my @return;
                                                    (
                                                        state $custom_setter94421007367776
                                                          = do {
                                                            @{
                                                                $custom_blocks94421007291248
                                                              }{
                                                                (
                                                                    map {
                                                                        ref($_)
                                                                          eq
"Sidef::Types::String::String"
                                                                          ? $$_
                                                                          : "$_"
                                                                        } (Sidef::Runtime::String944210073633521
                                                                        )
                                                                )
                                                              };
                                                          }
                                                    );
                                                    (
                                                        (
                                                            setter_prelude94421007297968
                                                        )
                                                      )
                                                      ->run(
                                                        $new_val94421007367128);
                                                    return do {
                                                        do {
                                                            if (
                                                                (
                                                                    $custom_setter94421007367776
                                                                )
                                                              )
                                                            {
                                                                (
                                                                    (
                                                                        $custom_setter94421007367776
                                                                    )->run(
                                                                        $self94421007366888,
                                                                        $new_val94421007367128
                                                                    )
                                                                  )
                                                                  // (
                                                                    $self94421007366888
                                                                  );
                                                            }
                                                            else {
                                                                (
                                                                    (
                                                                        @{
                                                                            $self94421007366888
                                                                          }{
                                                                            (
                                                                                map
                                                                                {
                                                                                    ref
                                                                                      (
                                                                                        $_
                                                                                      )
                                                                                      eq
"Sidef::Types::String::String"
                                                                                      ?
                                                                                      $$_
                                                                                      :
"$_"
                                                                                  }
                                                                                  (
                                                                                    (Sidef::Runtime::String944210073004401
                                                                                    )
                                                                                  )
                                                                                  ->
                                                                                  $Sidef::Runtime::OP4394421007688824
                                                                                  (
                                                                                    $field_name94421006157656
                                                                                  )
                                                                            )
                                                                          }
                                                                    )
                                                                    = (
                                                                        $new_val94421007367128
                                                                    )
                                                                )[-1];
                                                                $self94421007366888;
                                                            }
                                                          }
                                                    };
                                                  END94421007366720: @return;
                                                },
                                                type => "func",
                                                name => "acc",
                                                class =>
"Sidef\:\:Runtime\:\:94421007269064\:\:ABCs2\:\:SeriallyAccessible",
                                                namespace => "ABCs2",
                                                vars      => [
                                                    { name => "self" },
                                                    { name => "new_val" }
                                                ],
                                                table => {
                                                    "self"    => 0,
                                                    "new_val" => 1
                                                }
                                              );
                                          }
                                    ]
                                  );
                                $acc94421007330832;
                                (
'Sidef::Runtime::94421007269064::ABCs2::SeriallyAccessible'
                                  )
                                  ->def_method( $field_name94421006157656,
                                    $acc94421007319240 );
                            },
                            type => "block",
                            name => "__BLOCK__",
                            class =>
"Sidef\:\:Runtime\:\:94421007269064\:\:ABCs2\:\:SeriallyAccessible",
                            namespace => "ABCs2",
                            vars      => [
                                { name => "field_name" },
                                { name => "field_rhs" }
                            ],
                            table => { "field_name" => 0, "field_rhs" => 1 }
                        );
                    };
                  END94421007270984: @return;
                },
                type => "method",
                name => "_bound_accessor_generator",
                class =>
"Sidef\:\:Runtime\:\:94421007269064\:\:ABCs2\:\:SeriallyAccessible",
                namespace => "ABCs2",
                vars      => [ { name => "self" } ],
                table => { "self" => 0 }
              );
            state $_94421006156408= do {
                no strict 'refs';
                $Sidef::Runtime::94421007269064::ABCs2::SeriallyAccessible::__SIDEF_CLASS_METHODS__{
                    '_bound_accessor_generator'} =
                  $_bound_accessor_generator94421006156408;
                *{
"Sidef\:\:Runtime\:\:94421007269064\:\:ABCs2\:\:SeriallyAccessible\:\:_bound_accessor_generator"
                  } =
                  sub { $_bound_accessor_generator94421006156408->call(@_) }
            };
            $_property_generator94421007383488 =
              Sidef::Types::Block::Block->new(
                code => sub {
                    my ($self94421007398008) = @_;
                    my @return;
                    my $curried94421007415128;
                    (Sidef::Runtime::serial_pg_name94421007398728);
                    return do {
                        (
                            ($self94421007398008)->grep_methods(
                                Sidef::Types::Block::Block->new(
                                    code => sub {
                                        my ($_94421007397168) = @_;
                                        do {
                                            my $bool = do { ($_94421007397168) }
                                              ~~ do {
                                                (
                                                    (Sidef::Runtime::serial_pg_name94421007398728
                                                    )
                                                );
                                              };
                                            ref($bool) ? $bool
                                              : ( $bool
                                                ? Sidef::Types::Bool::Bool::TRUE
                                                : Sidef::Types::Bool::Bool::FALSE
                                              );
                                          }
                                    },
                                    type => "block",
                                    name => "__BLOCK__",
                                    class =>
"Sidef\:\:Runtime\:\:94421007269064\:\:ABCs2\:\:SeriallyAccessible",
                                    namespace => "ABCs2",
                                    vars      => [ { name => "_" } ],
                                    table => { "_" => 0 }
                                )
                            )
                          )->each_kv(
                            Sidef::Types::Block::Block->new(
                                code => sub {
                                    my (
                                        $name94421007400120,
                                        $calls94421007400360
                                    ) = @_;
                                    (
                                        (
                                            CORE::say(
                                                (
'Sidef::Types::String::String'
                                                )->interpolate(
                                                    "createproperty\ ",
                                                    do { $name94421007400120 },
                                                    "\ \=\>\ calls\ ",
                                                    do { $calls94421007400360 }
                                                )
                                            )
                                        )
                                        ? Sidef::Types::Bool::Bool::TRUE
                                        : Sidef::Types::Bool::Bool::FALSE
                                    );
                                    (
'Sidef::Runtime::94421007269064::ABCs2::SeriallyAccessible'
                                      )->def_method(
                                        (
                                            (Sidef::Runtime::String944210063518881
                                            )
                                        )->$Sidef::Runtime::OP4394421007688824(
                                            @{
                                                (
                                                    ($name94421007400120)
                                                    ->$Sidef::Runtime::OP6112694421007688824
                                                      (
                                                        (Sidef::Runtime::serial_pg_name94421007398728
                                                        )
                                                      )
                                                )
                                              }[
                                              (
                                                  map {
                                                      ref($_) eq
"Sidef::Types::Number::Number"
                                                        ? Sidef::Types::Number::Number::__numify__(
                                                          $$_)
                                                        : do {
                                                          my $sub =
                                                            UNIVERSAL::can( $_,
                                                              "..." );
                                                          defined($sub)
                                                            ? $sub->($_)
                                                            : CORE::int($_);
                                                        }
                                                    } (Sidef::Runtime::Number944210063509761
                                                    )
                                              )
                                              ]
                                        ),
                                        $curried94421007415128 =
                                          Sidef::Types::Block::Block->new(
                                            code => sub {
                                                my ($self94421007417120) = @_;
                                                my @return;
                                                return do {
                                                    ( ($calls94421007400360)
                                                        ->call )
                                                      ->run(
                                                        $self94421007417120);
                                                };
                                              END94421007415656: @return;
                                            },
                                            type => "func",
                                            name => "curried",
                                            class =>
"Sidef\:\:Runtime\:\:94421007269064\:\:ABCs2\:\:SeriallyAccessible",
                                            namespace => "ABCs2",
                                            vars      => [ { name => "self" } ],
                                            table => { "self" => 0 }
                                          )
                                      );
                                },
                                type => "block",
                                name => "__BLOCK__",
                                class =>
"Sidef\:\:Runtime\:\:94421007269064\:\:ABCs2\:\:SeriallyAccessible",
                                namespace => "ABCs2",
                                vars =>
                                  [ { name => "name" }, { name => "calls" } ],
                                table => { "name" => 0, "calls" => 1 }
                            )
                          );
                    };
                  END94421007367920: @return;
                },
                type => "method",
                name => "_property_generator",
                class =>
"Sidef\:\:Runtime\:\:94421007269064\:\:ABCs2\:\:SeriallyAccessible",
                namespace => "ABCs2",
                vars      => [ { name => "self" } ],
                table => { "self" => 0 }
              );
            state $_94421007383488= do {
                no strict 'refs';
                $Sidef::Runtime::94421007269064::ABCs2::SeriallyAccessible::__SIDEF_CLASS_METHODS__{
                    '_property_generator'} = $_property_generator94421007383488;
                *{
"Sidef\:\:Runtime\:\:94421007269064\:\:ABCs2\:\:SeriallyAccessible\:\:_property_generator"
                  } =
                  sub { $_property_generator94421007383488->call(@_) }
              }
        };
        'Sidef::Runtime::94421007269064::ABCs2::SeriallyAccessible';
    };
    do {

        package Sidef::Runtime::94421007271008::ABCs2::Lockable {
            use parent qw(-norequire  Sidef::Object::Object);
            $new94421007432528 = Sidef::Types::Block::Block->new(
                code => sub {
                    my ($_impl_locked94421007432792) =
                      (Sidef::Types::Bool::Bool::FALSE);
                    my ($_impl_err_write_locked94421007433368) = (
                        ( (Sidef::Runtime::String944210073984881) )
                        ->$Sidef::Runtime::OP4394421007688824(
                            ( (Sidef::Runtime::String944210073985841) )
                            ->$Sidef::Runtime::OP4394421007688824(
                                (Sidef::Runtime::String944210074335121)
                            )
                        )
                    );
                    my $self = bless {
                        "_impl_err_write_locked" =>
                          $_impl_err_write_locked94421007433368,
                        "_impl_locked" => $_impl_locked94421007432792,
                      },
                      __PACKAGE__;
                    if ( defined( my $sub = UNIVERSAL::can( $self, "init" ) ) )
                    {
                        $sub->($self);
                    }
                    $self;
                },
                vars  => [],
                table => {},
                type  => "class",
                name =>
                  "Sidef\:\:Runtime\:\:94421007271008\:\:ABCs2\:\:Lockable"
            );
            state $_94421007432528= do {
                no strict 'refs';
                *{
"Sidef\:\:Runtime\:\:94421007271008\:\:ABCs2\:\:Lockable\:\:new"
                  } =
                  *{
"Sidef\:\:Runtime\:\:94421007271008\:\:ABCs2\:\:Lockable\:\:call"
                  } =
                  sub { CORE::shift(@_); $new94421007432528->call(@_) }
            };
            sub _impl_err_write_locked :
              lvalue { $_[0]->{"_impl_err_write_locked"} }
            sub _impl_locked : lvalue { $_[0]->{"_impl_locked"} }
            $lock94421007418800 = Sidef::Types::Block::Block->new(
                code => sub {
                    my ($self94421007435456) = @_;
                    my @return;
                    return do {
                        ( ( ($self94421007435456)->_impl_locked ) =
                              (Sidef::Types::Bool::Bool::TRUE) )[-1];
                    };
                  END94421007433992: @return;
                },
                type => "method",
                name => "lock",
                class =>
                  "Sidef\:\:Runtime\:\:94421007271008\:\:ABCs2\:\:Lockable",
                namespace => "ABCs2",
                vars      => [ { name => "self" } ],
                table => { "self" => 0 },
                kids  => [
                    do {
                        $lock94421007436392 = Sidef::Types::Block::Block->new(
                            code => sub {
                                my ( $self94421007434520, $b94421007444848 ) =
                                  @_;
                                my @return;
                                return do {
                                    ( ( ($self94421007434520)->_impl_locked ) =
                                          ($b94421007444848) )[-1];
                                };
                              END94421007444584: @return;
                            },
                            type => "func",
                            name => "lock",
                            class =>
"Sidef\:\:Runtime\:\:94421007271008\:\:ABCs2\:\:Lockable",
                            namespace => "ABCs2",
                            vars      => [
                                { name => "self" },
                                {
                                    name => "b",
                                    type => "Sidef\:\:Types\:\:Bool\:\:Bool"
                                }
                            ],
                            table => { "self" => 0, "b" => 1 }
                        );
                      }
                ]
            );
            state $_94421007418800= do {
                no strict 'refs';
                $Sidef::Runtime::94421007271008::ABCs2::Lockable::__SIDEF_CLASS_METHODS__{
                    'lock'} = $lock94421007418800;
                *{
"Sidef\:\:Runtime\:\:94421007271008\:\:ABCs2\:\:Lockable\:\:lock"
                  } =
                  sub { $lock94421007418800->call(@_) }
            };
            $lock94421007436392;
            $unlock94421007418224 = Sidef::Types::Block::Block->new(
                code => sub {
                    my ($self94421007446672) = @_;
                    my @return;
                    return do {
                        ( ( ($self94421007446672)->_impl_locked ) =
                              (Sidef::Types::Bool::Bool::FALSE) )[-1];
                    };
                  END94421007435264: @return;
                },
                type => "method",
                name => "unlock",
                class =>
                  "Sidef\:\:Runtime\:\:94421007271008\:\:ABCs2\:\:Lockable",
                namespace => "ABCs2",
                vars      => [ { name => "self" } ],
                table => { "self" => 0 }
            );
            state $_94421007418224= do {
                no strict 'refs';
                $Sidef::Runtime::94421007271008::ABCs2::Lockable::__SIDEF_CLASS_METHODS__{
                    'unlock'} = $unlock94421007418224;
                *{
"Sidef\:\:Runtime\:\:94421007271008\:\:ABCs2\:\:Lockable\:\:unlock"
                  } =
                  sub { $unlock94421007418224->call(@_) }
              }
        };
        'Sidef::Runtime::94421007271008::ABCs2::Lockable';
    };
    do {

        package Sidef::Runtime::94421007462520::builtobj::DirSum {
            use parent
              qw(-norequire Sidef::Runtime::94421006629632::ABCs2::SeriallyEquatable Sidef::Object::Object);
            $new94421002517896 = Sidef::Types::Block::Block->new(
                code => sub {
                    my ( $algo94421007463168, $names94421007463240,
                        $contents94421007463144 )
                      = @_;
                    $algo94421007463168 //=
                      (Sidef::Runtime::String944210074646321);
                    $names94421007463240 //=
                      (Sidef::Runtime::String944210074646321);
                    $contents94421007463144 //=
                      (Sidef::Runtime::String944210074646321);
                    my ($_k_svalue94421006631384) =
                      ( (Sidef::Runtime::String944210066393761) );
                    my ($serial_properties94421007444392) = (
                        (
                            (
                                bless(
                                    [
                                        (Sidef::Runtime::String944210074633841),
                                        (Sidef::Runtime::String944210074639121),
                                        (Sidef::Runtime::String944210074641521)
                                    ],
                                    'Sidef::Types::Array::Array'
                                )
                            )->map(
                                Sidef::Types::Block::Block->new(
                                    code => sub {
                                        my ($_94421007464560) = @_;
                                        $_94421007464560,
                                          'Sidef::Types::String::String';
                                    },
                                    type => "block",
                                    name => "__BLOCK__",
                                    class =>
"Sidef\:\:Runtime\:\:94421007462520\:\:builtobj\:\:DirSum",
                                    vars  => [     { name => "_" } ],
                                    table => { "_" => 0 }
                                )
                            )
                        )->to_h
                    );
                    my $self = bless {
                        "contents"          => $contents94421007463144,
                        "names"             => $names94421007463240,
                        "algo"              => $algo94421007463168,
                        "serial_properties" => $serial_properties94421007444392,
                        "_k_svalue"         => $_k_svalue94421006631384,
                      },
                      __PACKAGE__;
                    if ( defined( my $sub = UNIVERSAL::can( $self, "init" ) ) )
                    {
                        $sub->($self);
                    }
                    $self;
                },
                vars => [
                    {
                        name      => "algo",
                        type      => "Sidef\:\:Types\:\:String\:\:String",
                        has_value => 1
                    },
                    {
                        name      => "names",
                        type      => "Sidef\:\:Types\:\:String\:\:String",
                        has_value => 1
                    },
                    {
                        name      => "contents",
                        type      => "Sidef\:\:Types\:\:String\:\:String",
                        has_value => 1
                    }
                ],
                table => { "algo" => 0, "names" => 1, "contents" => 2 },
                type  => "class",
                name =>
                  "Sidef\:\:Runtime\:\:94421007462520\:\:builtobj\:\:DirSum"
            );
            state $_94421002517896= do {
                no strict 'refs';
                *{
"Sidef\:\:Runtime\:\:94421007462520\:\:builtobj\:\:DirSum\:\:new"
                  } =
                  *{
"Sidef\:\:Runtime\:\:94421007462520\:\:builtobj\:\:DirSum\:\:call"
                  } =
                  sub { CORE::shift(@_); $new94421002517896->call(@_) }
            };
            sub algo : lvalue              { $_[0]->{"algo"} }
            sub names : lvalue             { $_[0]->{"names"} }
            sub contents : lvalue          { $_[0]->{"contents"} }
            sub serial_properties : lvalue { $_[0]->{"serial_properties"} }
            sub _k_svalue : lvalue         { $_[0]->{"_k_svalue"} }
        };
        'Sidef::Runtime::94421007462520::builtobj::DirSum';
    };
    do {

        package Sidef::Runtime::94421007476184::builtobj::SrcSums {
            use parent
              qw(-norequire Sidef::Runtime::94421006629632::ABCs2::SeriallyEquatable Sidef::Object::Object);
            $new94421007477312 = Sidef::Types::Block::Block->new(
                code => sub {
                    my (
                        $vm94421007475968,    $core94421007476760,
                        $basis94421007478560, $basis_ignored94421007488336
                    ) = @_;
                    $vm94421007475968 //=
                      ('Sidef::Runtime::94421007462520::builtobj::DirSum')
                      ->call;
                    $core94421007476760 //=
                      ('Sidef::Runtime::94421007462520::builtobj::DirSum')
                      ->call;
                    $basis94421007478560 //=
                      ('Sidef::Runtime::94421007462520::builtobj::DirSum')
                      ->call;
                    $basis_ignored94421007488336 //=
                      Sidef::Types::Bool::Bool::FALSE;
                    my ($_k_svalue94421006631384) =
                      ( (Sidef::Runtime::String944210066393761) );
                    my ($serial_properties94421007477576) = (
                        bless(
                            {
                                (
                                    (Sidef::Runtime::String944210074778881),
                                    'Sidef::Types::Bool::Bool',
                                    (
                                        (
                                            bless(
                                                [
                                                    (Sidef::Runtime::String944210074887681
                                                    ),
                                                    (Sidef::Runtime::String944210074890561
                                                    ),
                                                    (Sidef::Runtime::String944210074769761
                                                    )
                                                ],
                                                'Sidef::Types::Array::Array'
                                            )
                                        )->map(
                                            Sidef::Types::Block::Block->new(
                                                code => sub {
                                                    my ($_94421007489728) = @_;
                                                    $_94421007489728,
'Sidef::Runtime::94421007462520::builtobj::DirSum';
                                                },
                                                type => "block",
                                                name => "__BLOCK__",
                                                class =>
"Sidef\:\:Runtime\:\:94421007476184\:\:builtobj\:\:SrcSums",
                                                vars => [ { name => "_" } ],
                                                table => { "_" => 0 }
                                            )
                                        )
                                      )
                                      ->$Sidef::Runtime::OP46464694421007688824
                                )
                            },
                            'Sidef::Types::Hash::Hash'
                        )
                    );
                    my $self = bless {
                        "basis_ignored"     => $basis_ignored94421007488336,
                        "basis"             => $basis94421007478560,
                        "core"              => $core94421007476760,
                        "vm"                => $vm94421007475968,
                        "serial_properties" => $serial_properties94421007477576,
                        "_k_svalue"         => $_k_svalue94421006631384,
                      },
                      __PACKAGE__;
                    if ( defined( my $sub = UNIVERSAL::can( $self, "init" ) ) )
                    {
                        $sub->($self);
                    }
                    $self;
                },
                vars => [
                    {
                        name => "vm",
                        type =>
"Sidef\:\:Runtime\:\:94421007462520\:\:builtobj\:\:DirSum",
                        has_value => 1
                    },
                    {
                        name => "core",
                        type =>
"Sidef\:\:Runtime\:\:94421007462520\:\:builtobj\:\:DirSum",
                        has_value => 1
                    },
                    {
                        name => "basis",
                        type =>
"Sidef\:\:Runtime\:\:94421007462520\:\:builtobj\:\:DirSum",
                        has_value => 1
                    },
                    {
                        name      => "basis_ignored",
                        type      => "Sidef\:\:Types\:\:Bool\:\:Bool",
                        has_value => 1
                    }
                ],
                table => {
                    "vm"            => 0,
                    "core"          => 1,
                    "basis"         => 2,
                    "basis_ignored" => 3
                },
                type => "class",
                name =>
                  "Sidef\:\:Runtime\:\:94421007476184\:\:builtobj\:\:SrcSums"
            );
            state $_94421007477312= do {
                no strict 'refs';
                *{
"Sidef\:\:Runtime\:\:94421007476184\:\:builtobj\:\:SrcSums\:\:new"
                  } =
                  *{
"Sidef\:\:Runtime\:\:94421007476184\:\:builtobj\:\:SrcSums\:\:call"
                  } =
                  sub { CORE::shift(@_); $new94421007477312->call(@_) }
            };
            sub vm : lvalue                { $_[0]->{"vm"} }
            sub core : lvalue              { $_[0]->{"core"} }
            sub basis : lvalue             { $_[0]->{"basis"} }
            sub basis_ignored : lvalue     { $_[0]->{"basis_ignored"} }
            sub serial_properties : lvalue { $_[0]->{"serial_properties"} }
            sub _k_svalue : lvalue         { $_[0]->{"_k_svalue"} }
        };
        'Sidef::Runtime::94421007476184::builtobj::SrcSums';
    };
    do {

        package Sidef::Runtime::94421007491960::builtobj::BlobSums {
            use parent
              qw(-norequire Sidef::Runtime::94421006629632::ABCs2::SeriallyEquatable Sidef::Object::Object);
            $new94421007508672 = Sidef::Types::Block::Block->new(
                code => sub {
                    my (
                        $algo94421007508288, $vm94421007508360,
                        $lib94421007508264,  $boot94421007509944
                    ) = @_;
                    $algo94421007508288 //=
                      (Sidef::Runtime::String944210074646321);
                    $vm94421007508360 //=
                      (Sidef::Runtime::String944210074646321);
                    $lib94421007508264 //=
                      (Sidef::Runtime::String944210074646321);
                    $boot94421007509944 //=
                      (Sidef::Runtime::String944210074646321);
                    my ($_k_svalue94421006631384) =
                      ( (Sidef::Runtime::String944210066393761) );
                    my ($serial_properties94421007508984) = (
                        (
                            (
                                bless(
                                    [
                                        (Sidef::Runtime::String944210074633841),
                                        (Sidef::Runtime::String944210074887681),
                                        (Sidef::Runtime::String944210075108561),
                                        (Sidef::Runtime::String944210075110961)
                                    ],
                                    'Sidef::Types::Array::Array'
                                )
                            )->map(
                                Sidef::Types::Block::Block->new(
                                    code => sub {
                                        my ($_94421007511504) = @_;
                                        $_94421007511504,
                                          'Sidef::Types::String::String';
                                    },
                                    type => "block",
                                    name => "__BLOCK__",
                                    class =>
"Sidef\:\:Runtime\:\:94421007491960\:\:builtobj\:\:BlobSums",
                                    vars  => [     { name => "_" } ],
                                    table => { "_" => 0 }
                                )
                            )
                        )->to_h
                    );
                    my $self = bless {
                        "boot"              => $boot94421007509944,
                        "lib"               => $lib94421007508264,
                        "vm"                => $vm94421007508360,
                        "algo"              => $algo94421007508288,
                        "serial_properties" => $serial_properties94421007508984,
                        "_k_svalue"         => $_k_svalue94421006631384,
                      },
                      __PACKAGE__;
                    if ( defined( my $sub = UNIVERSAL::can( $self, "init" ) ) )
                    {
                        $sub->($self);
                    }
                    $self;
                },
                vars => [
                    {
                        name      => "algo",
                        type      => "Sidef\:\:Types\:\:String\:\:String",
                        has_value => 1
                    },
                    {
                        name      => "vm",
                        type      => "Sidef\:\:Types\:\:String\:\:String",
                        has_value => 1
                    },
                    {
                        name      => "lib",
                        type      => "Sidef\:\:Types\:\:String\:\:String",
                        has_value => 1
                    },
                    {
                        name      => "boot",
                        type      => "Sidef\:\:Types\:\:String\:\:String",
                        has_value => 1
                    }
                ],
                table => { "algo" => 0, "vm" => 1, "lib" => 2, "boot" => 3 },
                type  => "class",
                name =>
                  "Sidef\:\:Runtime\:\:94421007491960\:\:builtobj\:\:BlobSums"
            );
            state $_94421007508672= do {
                no strict 'refs';
                *{
"Sidef\:\:Runtime\:\:94421007491960\:\:builtobj\:\:BlobSums\:\:new"
                  } =
                  *{
"Sidef\:\:Runtime\:\:94421007491960\:\:builtobj\:\:BlobSums\:\:call"
                  } =
                  sub { CORE::shift(@_); $new94421007508672->call(@_) }
            };
            sub algo : lvalue              { $_[0]->{"algo"} }
            sub vm : lvalue                { $_[0]->{"vm"} }
            sub lib : lvalue               { $_[0]->{"lib"} }
            sub boot : lvalue              { $_[0]->{"boot"} }
            sub serial_properties : lvalue { $_[0]->{"serial_properties"} }
            sub _k_svalue : lvalue         { $_[0]->{"_k_svalue"} }
            $__NONANN__94421007520928 = Sidef::Types::Block::Block->new(
                code => sub {
                    my ( $self94421007511624, $other94421007523088 ) = @_;
                    my @return;
                    return do {
                        ($self94421007511624)->_serial_eq(
                            $other94421007523088,
                            Sidef::Variable::NamedParam->new(
                                "exclude_props",
                                (
                                    bless(
                                        [
                                            (Sidef::Runtime::String944210075110961
                                            )
                                        ],
                                        'Sidef::Types::Array::Array'
                                    )
                                )
                            )
                        );
                    };
                  END94421007522824: @return;
                },
                type => "method",
                name => "\=\~",
                class =>
                  "Sidef\:\:Runtime\:\:94421007491960\:\:builtobj\:\:BlobSums",
                namespace => "builtobj",
                vars      => [ { name => "self" }, { name => "other" } ],
                table => { "self" => 0, "other" => 1 }
            );
            state $_94421007520928= do {
                no strict 'refs';
                $Sidef::Runtime::94421007491960::builtobj::BlobSums::__SIDEF_CLASS_METHODS__{
                    '=~'} = $__NONANN__94421007520928;
                *{
"Sidef\:\:Runtime\:\:94421007491960\:\:builtobj\:\:BlobSums\:\:\=\~"
                  } =
                  sub { $__NONANN__94421007520928->call(@_) }
              }
        };
        'Sidef::Runtime::94421007491960::builtobj::BlobSums';
    };
    do {

        package Sidef::Runtime::94421007508144::builtobj::VirtualBase64Blob {
            use parent
              qw(-norequire Sidef::Runtime::94421006629632::ABCs2::SeriallyEquatable Sidef::Object::Object);
            $new94421007530000 = Sidef::Types::Block::Block->new(
                code => sub {
                    my ( $data94421007527528, $algo94421007527480,
                        $sum94421007527432 )
                      = @_;
                    $data94421007527528 //=
                      (Sidef::Runtime::String944210074646321);
                    $algo94421007527480 //=
                      (Sidef::Runtime::String944210074646321);
                    $sum94421007527432 //=
                      (Sidef::Runtime::String944210074646321);
                    my ($_k_svalue94421006631384) =
                      ( (Sidef::Runtime::String944210066393761) );
                    my ($serial_properties94421007527624) = (
                        (
                            (
                                bless(
                                    [
                                        (Sidef::Runtime::String944210075278881),
                                        (Sidef::Runtime::String944210074633841),
                                        (Sidef::Runtime::String944210075284641)
                                    ],
                                    'Sidef::Types::Array::Array'
                                )
                            )->map(
                                Sidef::Types::Block::Block->new(
                                    code => sub {
                                        my ($_94421007530096) = @_;
                                        $_94421007530096,
                                          'Sidef::Types::String::String';
                                    },
                                    type => "block",
                                    name => "__BLOCK__",
                                    class =>
"Sidef\:\:Runtime\:\:94421007508144\:\:builtobj\:\:VirtualBase64Blob",
                                    vars  => [     { name => "_" } ],
                                    table => { "_" => 0 }
                                )
                            )
                        )->to_h
                    );
                    my $self = bless {
                        "sum"               => $sum94421007527432,
                        "algo"              => $algo94421007527480,
                        "data"              => $data94421007527528,
                        "serial_properties" => $serial_properties94421007527624,
                        "_k_svalue"         => $_k_svalue94421006631384,
                      },
                      __PACKAGE__;
                    if ( defined( my $sub = UNIVERSAL::can( $self, "init" ) ) )
                    {
                        $sub->($self);
                    }
                    $self;
                },
                vars => [
                    {
                        name      => "data",
                        type      => "Sidef\:\:Types\:\:String\:\:String",
                        has_value => 1
                    },
                    {
                        name      => "algo",
                        type      => "Sidef\:\:Types\:\:String\:\:String",
                        has_value => 1
                    },
                    {
                        name      => "sum",
                        type      => "Sidef\:\:Types\:\:String\:\:String",
                        has_value => 1
                    }
                ],
                table => { "data" => 0, "algo" => 1, "sum" => 2 },
                type  => "class",
                name =>
"Sidef\:\:Runtime\:\:94421007508144\:\:builtobj\:\:VirtualBase64Blob"
            );
            state $_94421007530000= do {
                no strict 'refs';
                *{
"Sidef\:\:Runtime\:\:94421007508144\:\:builtobj\:\:VirtualBase64Blob\:\:new"
                  } =
                  *{
"Sidef\:\:Runtime\:\:94421007508144\:\:builtobj\:\:VirtualBase64Blob\:\:call"
                  } =
                  sub { CORE::shift(@_); $new94421007530000->call(@_) }
            };
            sub data : lvalue              { $_[0]->{"data"} }
            sub algo : lvalue              { $_[0]->{"algo"} }
            sub sum : lvalue               { $_[0]->{"sum"} }
            sub serial_properties : lvalue { $_[0]->{"serial_properties"} }
            sub _k_svalue : lvalue         { $_[0]->{"_k_svalue"} }
        };
        'Sidef::Runtime::94421007508144::builtobj::VirtualBase64Blob';
    };
    do {

        package Sidef::Runtime::94421007465568::builtobj::TimeSpec {
            use parent
              qw(-norequire Sidef::Runtime::94421007269064::ABCs2::SeriallyAccessible Sidef::Object::Object);
            $new94421007543816 = Sidef::Types::Block::Block->new(
                code => sub {
                    my ($_k_svalue94421006631384) =
                      ( (Sidef::Runtime::String944210066393761) );
                    my ($init_steps_sa_base94421006155808) =
                      ( (global_init_steps_sa_base94421007268728) );
                    my ($serial_properties94421007544080) = (
                        (
                            (
                                bless(
                                    [
                                        (Sidef::Runtime::String944210075442961),
                                        (Sidef::Runtime::String944210075584321),
                                        (Sidef::Runtime::String944210075586721),
                                        (Sidef::Runtime::String944210075403121)
                                    ],
                                    'Sidef::Types::Array::Array'
                                )
                            )->map(
                                Sidef::Types::Block::Block->new(
                                    code => sub {
                                        my ($_94421007542664) = @_;
                                        $_94421007542664,
                                          'Sidef::Types::Number::Number';
                                    },
                                    type => "block",
                                    name => "__BLOCK__",
                                    class =>
"Sidef\:\:Runtime\:\:94421007465568\:\:builtobj\:\:TimeSpec",
                                    vars  => [     { name => "_" } ],
                                    table => { "_" => 0 }
                                )
                            )
                        )->to_h
                    );
                    my $self = bless {
                        "serial_properties" => $serial_properties94421007544080,
                        "init_steps_sa_base" =>
                          $init_steps_sa_base94421006155808,
                        "_k_svalue" => $_k_svalue94421006631384,
                      },
                      __PACKAGE__;
                    if ( defined( my $sub = UNIVERSAL::can( $self, "init" ) ) )
                    {
                        $sub->($self);
                    }
                    $self;
                },
                vars  => [],
                table => {},
                type  => "class",
                name =>
                  "Sidef\:\:Runtime\:\:94421007465568\:\:builtobj\:\:TimeSpec"
            );
            state $_94421007543816= do {
                no strict 'refs';
                *{
"Sidef\:\:Runtime\:\:94421007465568\:\:builtobj\:\:TimeSpec\:\:new"
                  } =
                  *{
"Sidef\:\:Runtime\:\:94421007465568\:\:builtobj\:\:TimeSpec\:\:call"
                  } =
                  sub { CORE::shift(@_); $new94421007543816->call(@_) }
            };
            sub serial_properties : lvalue  { $_[0]->{"serial_properties"} }
            sub init_steps_sa_base : lvalue { $_[0]->{"init_steps_sa_base"} }
            sub _k_svalue : lvalue          { $_[0]->{"_k_svalue"} }
        };
        'Sidef::Runtime::94421007465568::builtobj::TimeSpec';
    };
    do {

        package Sidef::Runtime::94421007540552::builtobj::BuiltObj {
            use parent
              qw(-norequire Sidef::Runtime::94421007271008::ABCs2::Lockable Sidef::Runtime::94421007269064::ABCs2::SeriallyAccessible Sidef::Object::Object);
            $new94421007572088 = Sidef::Types::Block::Block->new(
                code => sub {
                    my ($_k_svalue94421006631384) =
                      ( (Sidef::Runtime::String944210066393761) );
                    my ($_impl_locked94421007432792) =
                      (Sidef::Types::Bool::Bool::FALSE);
                    my ($_impl_err_write_locked94421007433368) = (
                        ( (Sidef::Runtime::String944210073984881) )
                        ->$Sidef::Runtime::OP4394421007688824(
                            ( (Sidef::Runtime::String944210073985841) )
                            ->$Sidef::Runtime::OP4394421007688824(
                                (Sidef::Runtime::String944210074335121)
                            )
                        )
                    );
                    my ($init_steps_sa_base94421006155808) =
                      ( (global_init_steps_sa_base94421007268728) );
                    my ($_blob_targets94421007572352) = (
                        bless(
                            [
                                (Sidef::Runtime::String944210074887681),
                                (Sidef::Runtime::String944210075108561),
                                (Sidef::Runtime::String944210075730961),
                                (Sidef::Runtime::String944210075110961)
                            ],
                            'Sidef::Types::Array::Array'
                        )
                    );
                    my ($serial_properties94421007561696) = (
                        bless(
                            {
                                (
                                    (Sidef::Runtime::String944210075620561),
                                    'Sidef::Types::String::String',
                                    (Sidef::Runtime::String944210075736481),
                                    'Sidef::Types::String::String',
                                    (Sidef::Runtime::String944210075741041),
                                    'Sidef::Types::Bool::Bool',
                                    (Sidef::Runtime::String944210075746081),
                                    'Sidef::Types::String::String',
                                    (Sidef::Runtime::String944210075750641),
                                    'Sidef::Types::String::String',
                                    (Sidef::Runtime::String944210075755201),
                                    'Sidef::Types::String::String',
                                    (Sidef::Runtime::String944210075759761),
                                    'Sidef::Types::String::String',
                                    (Sidef::Runtime::String944210075911441),
                                    'Sidef::Types::String::String',
                                    (Sidef::Runtime::String944210075916001),
                                    'Sidef::Types::String::String',
                                    (Sidef::Runtime::String944210075920561),
'Sidef::Runtime::94421007508144::builtobj::VirtualBase64Blob',
                                    (Sidef::Runtime::String944210075925121),
'Sidef::Runtime::94421007476184::builtobj::SrcSums',
                                    (Sidef::Runtime::String944210075929681),
'Sidef::Runtime::94421007491960::builtobj::BlobSums',
                                    (Sidef::Runtime::String944210075934241),
                                    bless(
                                        [
                                            'Sidef::Types::String::String',
                                            (Sidef::Runtime::String944210075940481
                                            ),
                                            bless(
                                                {
                                                    (
                                                        (Sidef::Runtime::String944210073323201
                                                        ),
                                                        Sidef::Types::Block::Block
                                                          ->new(
                                                            code => sub {
                                                                my (
                                                                    $_94421007600152
                                                                ) = @_;
                                                                (
                                                                    (
                                                                        (
                                                                            $_94421007600152
                                                                        )
                                                                        ->blob_sums
                                                                    )->algo
                                                                  )
                                                                  || (
                                                                    @{
                                                                        $_94421007600152
                                                                    }{
                                                                        (
                                                                            map
                                                                            {
                                                                                ref
                                                                                  (
                                                                                    $_
                                                                                  )
                                                                                  eq
"Sidef::Types::String::String"
                                                                                  ?
                                                                                  $$_
                                                                                  :
"$_"
                                                                                } (Sidef::Runtime::String944210076014961
                                                                                )
                                                                        )
                                                                    }
                                                                  );
                                                            },
                                                            type => "block",
                                                            name => "__BLOCK__",
                                                            class =>
"Sidef\:\:Runtime\:\:94421007540552\:\:builtobj\:\:BuiltObj",
                                                            vars => [
                                                                { name => "_" }
                                                            ],
                                                            table =>
                                                              { "_" => 0 }
                                                          )
                                                    )
                                                },
                                                'Sidef::Types::Hash::Hash'
                                            )
                                        ],
                                        'Sidef::Types::Array::Array'
                                    ),
                                    (Sidef::Runtime::String944210076022641),
'Sidef::Runtime::94421007465568::builtobj::TimeSpec'
                                )
                            },
                            'Sidef::Types::Hash::Hash'
                        )
                    );
                    my ($serial_property_generator_builtobj94421007603200) = (
                        bless(
                            [
                                Sidef::Types::Block::Block->new(
                                    code => sub {
                                        my ($_94421007603632) = @_;
                                        (
                                            (
                                                ($_94421007603632)
                                                ->_blob_targets
                                            )->map(
                                                Sidef::Types::Block::Block->new(
                                                    code => sub {
                                                        my ($_94421007608560) =
                                                          @_;
                                                        ($_94421007608560)
                                                          ->$Sidef::Runtime::OP4394421007688824
                                                          (
                                                            (Sidef::Runtime::String944210076302881
                                                            )
                                                          ),
'Sidef::Types::Array::Array';
                                                    },
                                                    type => "block",
                                                    name => "__BLOCK__",
                                                    class =>
"Sidef\:\:Runtime\:\:94421007540552\:\:builtobj\:\:BuiltObj",
                                                    vars => [ { name => "_" } ],
                                                    table => { "_" => 0 }
                                                )
                                            )
                                        )->to_h;
                                    },
                                    type => "block",
                                    name => "__BLOCK__",
                                    class =>
"Sidef\:\:Runtime\:\:94421007540552\:\:builtobj\:\:BuiltObj",
                                    vars  => [     { name => "_" } ],
                                    table => { "_" => 0 }
                                )
                            ],
                            'Sidef::Types::Array::Array'
                        )
                    );
                    my ($extra_init_steps_builtobj94421007611224) = (
                        bless(
                            [
                                Sidef::Types::Block::Block->new(
                                    code => sub {
                                        my ($_94421007611680) = @_;
                                        ( ($_94421007611680)->_blob_targets )
                                          ->each(
                                            Sidef::Types::Block::Block->new(
                                                code => sub {
                                                    my ($name94421007629880) =
                                                      @_;
                                                    my sub name_format94421007630552()
                                                    {
                                                        state $_94421007630552=
                                                          do {
                                                            ($name94421007629880
                                                              )
                                                              ->$Sidef::Runtime::OP4394421007688824
                                                              (
                                                                (Sidef::Runtime::String944210076302881
                                                                )
                                                              );
                                                          }
                                                    }
                                                    (name_format94421007630552);
                                                    do {
                                                        $gen94421007631104 =
                                                          Sidef::Types::Block::Block
                                                          ->new(
                                                            code => sub {
                                                                my (
                                                                    $self94421007633360
                                                                ) = @_;
                                                                my @return;
                                                                return do {
                                                                    (
'Sidef::Types::Glob::File'
                                                                      )->call(
                                                                        (
                                                                            (
                                                                                (
'Sidef::Types::String::String'
                                                                                )
                                                                                ->
                                                                                call
                                                                                  (
                                                                                    @{
                                                                                        (
                                                                                            (
                                                                                                $self94421007633360
                                                                                            )
                                                                                            ->
                                                                                            method
                                                                                              (
                                                                                                (
                                                                                                    name_format94421007630552
                                                                                                )
                                                                                              )
                                                                                        )
                                                                                      }
                                                                                      [
                                                                                      (
                                                                                          map
                                                                                          {
                                                                                              ref
                                                                                                (
                                                                                                  $_
                                                                                                )
                                                                                                eq
"Sidef::Types::Number::Number"
                                                                                                ?
                                                                                                Sidef::Types::Number::Number::__numify__(
                                                                                                  $$_
                                                                                                )
                                                                                                :
                                                                                                do
                                                                                              {
                                                                                                  my $sub
                                                                                                    =
                                                                                                    UNIVERSAL::can(
                                                                                                      $_,
"..."
                                                                                                    )
                                                                                                    ;
                                                                                                  defined
                                                                                                    (
                                                                                                      $sub
                                                                                                    )
                                                                                                    ?
                                                                                                    $sub
                                                                                                    ->
                                                                                                    (
                                                                                                      $_
                                                                                                    )
                                                                                                    :
                                                                                                    CORE::int
                                                                                                    (
                                                                                                      $_
                                                                                                    )
                                                                                                    ;
                                                                                                }
                                                                                            }
                                                                                            (Sidef::Runtime::Number944210063509761
                                                                                            )
                                                                                      )
                                                                                    ,
                                                                                      (
                                                                                          map
                                                                                          {
                                                                                              ref
                                                                                                (
                                                                                                  $_
                                                                                                )
                                                                                                eq
"Sidef::Types::Number::Number"
                                                                                                ?
                                                                                                Sidef::Types::Number::Number::__numify__(
                                                                                                  $$_
                                                                                                )
                                                                                                :
                                                                                                do
                                                                                              {
                                                                                                  my $sub
                                                                                                    =
                                                                                                    UNIVERSAL::can(
                                                                                                      $_,
"..."
                                                                                                    )
                                                                                                    ;
                                                                                                  defined
                                                                                                    (
                                                                                                      $sub
                                                                                                    )
                                                                                                    ?
                                                                                                    $sub
                                                                                                    ->
                                                                                                    (
                                                                                                      $_
                                                                                                    )
                                                                                                    :
                                                                                                    CORE::int
                                                                                                    (
                                                                                                      $_
                                                                                                    )
                                                                                                    ;
                                                                                                }
                                                                                            }
                                                                                            (Sidef::Runtime::Number944210065902401
                                                                                            )
                                                                                      )
                                                                                      ]
                                                                                  )
                                                                            )
                                                                            ->$Sidef::Runtime::OP4394421007688824
                                                                              (
                                                                                (
                                                                                    $self94421007633360
                                                                                )
                                                                                ->
                                                                                id
                                                                              )
                                                                        )
                                                                        ->$Sidef::Runtime::OP4394421007688824
                                                                          (
                                                                            @{
                                                                                (
                                                                                    (
                                                                                        $self94421007633360
                                                                                    )
                                                                                    ->
                                                                                    method
                                                                                      (
                                                                                        (
                                                                                            name_format94421007630552
                                                                                        )
                                                                                      )
                                                                                )
                                                                              }[
                                                                              (
                                                                                  map
                                                                                  {
                                                                                      ref
                                                                                        (
                                                                                          $_
                                                                                        )
                                                                                        eq
"Sidef::Types::Number::Number"
                                                                                        ?
                                                                                        Sidef::Types::Number::Number::__numify__(
                                                                                          $$_
                                                                                        )
                                                                                        :
                                                                                        do
                                                                                      {
                                                                                          my $sub
                                                                                            =
                                                                                            UNIVERSAL::can(
                                                                                              $_,
"..."
                                                                                            )
                                                                                            ;
                                                                                          defined
                                                                                            (
                                                                                              $sub
                                                                                            )
                                                                                            ?
                                                                                            $sub
                                                                                            ->
                                                                                            (
                                                                                              $_
                                                                                            )
                                                                                            :
                                                                                            CORE::int
                                                                                            (
                                                                                              $_
                                                                                            )
                                                                                            ;
                                                                                        }
                                                                                    }
                                                                                    (Sidef::Runtime::Number944210066286721
                                                                                    )
                                                                              )
                                                                              ]
                                                                          )
                                                                      );
                                                                };
                                                              END94421007633192:
                                                                @return;
                                                            },
                                                            type => "func",
                                                            name => "gen",
                                                            class =>
"Sidef\:\:Runtime\:\:94421007540552\:\:builtobj\:\:BuiltObj",
                                                            namespace =>
                                                              "builtobj",
                                                            vars => [
                                                                {
                                                                    name =>
                                                                      "self"
                                                                }
                                                            ],
                                                            table =>
                                                              { "self" => 0 }
                                                          );
                                                        $gen94421007631104
                                                          ->{returns} = [
"Sidef\:\:Types\:\:Glob\:\:File"
                                                          ];
                                                        $gen94421007631104;
                                                    };
                                                    (
'Sidef::Runtime::94421007540552::builtobj::BuiltObj'
                                                      )->def_method(
                                                        ($name94421007629880)
                                                        ->$Sidef::Runtime::OP4394421007688824
                                                          (
                                                            (Sidef::Runtime::String944210076404081
                                                            )
                                                          ),
                                                        $gen94421007631104
                                                      );
                                                },
                                                type => "block",
                                                name => "__BLOCK__",
                                                class =>
"Sidef\:\:Runtime\:\:94421007540552\:\:builtobj\:\:BuiltObj",
                                                vars => [ { name => "name" } ],
                                                table => { "name" => 0 }
                                            )
                                          );
                                    },
                                    type => "block",
                                    name => "__BLOCK__",
                                    class =>
"Sidef\:\:Runtime\:\:94421007540552\:\:builtobj\:\:BuiltObj",
                                    vars  => [     { name => "_" } ],
                                    table => { "_" => 0 }
                                )
                            ],
                            'Sidef::Types::Array::Array'
                        )
                    );
                    my $self = bless {
                        "extra_init_steps_builtobj" =>
                          $extra_init_steps_builtobj94421007611224,
                        "serial_property_generator_builtobj" =>
                          $serial_property_generator_builtobj94421007603200,
                        "serial_properties" => $serial_properties94421007561696,
                        "_blob_targets"     => $_blob_targets94421007572352,
                        "init_steps_sa_base" =>
                          $init_steps_sa_base94421006155808,
                        "_impl_err_write_locked" =>
                          $_impl_err_write_locked94421007433368,
                        "_impl_locked" => $_impl_locked94421007432792,
                        "_k_svalue"    => $_k_svalue94421006631384,
                      },
                      __PACKAGE__;
                    if ( defined( my $sub = UNIVERSAL::can( $self, "init" ) ) )
                    {
                        $sub->($self);
                    }
                    $self;
                },
                vars  => [],
                table => {},
                type  => "class",
                name =>
                  "Sidef\:\:Runtime\:\:94421007540552\:\:builtobj\:\:BuiltObj"
            );
            state $_94421007572088= do {
                no strict 'refs';
                *{
"Sidef\:\:Runtime\:\:94421007540552\:\:builtobj\:\:BuiltObj\:\:new"
                  } =
                  *{
"Sidef\:\:Runtime\:\:94421007540552\:\:builtobj\:\:BuiltObj\:\:call"
                  } =
                  sub { CORE::shift(@_); $new94421007572088->call(@_) }
            };
            sub extra_init_steps_builtobj :
              lvalue { $_[0]->{"extra_init_steps_builtobj"} }
            sub serial_property_generator_builtobj :
              lvalue { $_[0]->{"serial_property_generator_builtobj"} }
            sub serial_properties : lvalue  { $_[0]->{"serial_properties"} }
            sub _blob_targets : lvalue      { $_[0]->{"_blob_targets"} }
            sub init_steps_sa_base : lvalue { $_[0]->{"init_steps_sa_base"} }
            sub _impl_err_write_locked :
              lvalue { $_[0]->{"_impl_err_write_locked"} }
            sub _impl_locked : lvalue { $_[0]->{"_impl_locked"} }
            sub _k_svalue : lvalue    { $_[0]->{"_k_svalue"} }
        };
        'Sidef::Runtime::94421007540552::builtobj::BuiltObj';
    };
    CORE::sub: lvalue {
        ($bo94421007659016) =
          ( ('Sidef::Runtime::94421007540552::builtobj::BuiltObj')->call );
        ($bo94421007659016)
    }
    ->();
    (
        (
            (
                (
                    (
                        (
                            (
                                (
                                    ($bo94421007659016)->id(
                                        (Sidef::Runtime::String944210076600001)
                                    )
                                )->factor_version(
                                    (Sidef::Runtime::String944210076607441)
                                )
                            )->is_git(Sidef::Types::Bool::Bool::TRUE)
                        )->git_branch( (Sidef::Runtime::String944210076614401) )
                    )->git_hash( (Sidef::Runtime::String944210076737281) )
                )->os_type( (Sidef::Runtime::String944210076742321) )
            )->os_name( (Sidef::Runtime::String944210076746881) )
        )->arch_name( (Sidef::Runtime::String944210076751441) )
    )->word_size( (Sidef::Runtime::String944210076756001) );
    ( ( CORE::say( ($bo94421007659016)->blob_algorithm ) )
        ? Sidef::Types::Bool::Bool::TRUE
        : Sidef::Types::Bool::Bool::FALSE );
    CORE::sub: lvalue {
        ($f94421007676776) = ( ($bo94421007659016)->serialize );
        ($f94421007676776)
    }
    ->();
    CORE::sub: lvalue {
        ($new_bo94421007677592) =
          ( ( ('Sidef::Runtime::94421007540552::builtobj::BuiltObj')->call )
            ->unserialize($f94421007676776) );
        ($new_bo94421007677592)
    }
    ->();
    (
        (
            CORE::say(
                do {
                    my $bool = ($new_bo94421007677592) eq ($bo94421007659016);
                    ref($bool) ? $bool
                      : ( $bool ? Sidef::Types::Bool::Bool::TRUE
                        : Sidef::Types::Bool::Bool::FALSE );
                  }
            )
        ) ? Sidef::Types::Bool::Bool::TRUE : Sidef::Types::Bool::Bool::FALSE
    );
}
