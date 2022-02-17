
{

package Crypt::RandPasswd;

use strict;

use vars qw($VERSION);

$VERSION = '0.02';


=head1 NAME

Crypt::RandPasswd - random password generator based on FIPS-181 

=head1 SYNOPSIS

  use Crypt::RandPasswd;
  ( $word, $hyphenated ) = Crypt::RandPasswd->word( $minlen, $maxlen );
  $word = Crypt::RandPasswd->word( $minlen, $maxlen );
  $word = Crypt::RandPasswd->letters( $minlen, $maxlen );
  $word = Crypt::RandPasswd->chars( $minlen, $maxlen );

  # override the defaults for these functions:
  *Crypt::RandPasswd::rng = \&my_random_number_generator;
  *Crypt::RandPasswd::restrict = \&my_restriction_filter;

=head2 Run as Script

  perl Crypt/RandPasswd.pm -help

=head1 SEE ALSO

FIPS 181 - (APG), Automated Password Generator:
http://www.itl.nist.gov/fipspubs/fip181.htm

=head1 DESCRIPTION

This code is a Perl language implementation of the Automated
Password Generator standard, like the program described in
"A Random Word Generator For Pronounceable Passwords" (not available on-line). 
This code is a re-engineering of the program contained in Appendix A
of FIPS Publication 181, "Standard for Automated Password Generator".
In accordance with the standard, the results obtained from this
program are logically equivalent to those produced by the standard.

=head1 CAVEATS

=head2 Bugs

The function to generate a password can sometimes take an extremely long time.

=head2 Deviations From Standard

This implementation deviates in one critical way from the standard
upon which it is based: the random number generator in this 
implementation does not use DES.  Instead, it uses perl's built-in
C<rand()> function, which in turn is (usually) built on the
pseudo-random number generator functions of the underlying C library.

However, the random function can be replaced by the user if desired.
(See L</rng>.)

=head1 Functions

=cut


sub word($$);
sub letters($$);
sub chars($$);

sub random_chars_in_range($$$$);
sub rand_int_in_range($$);
sub random_element($);

sub rng($);
sub restrict($);
sub init();


sub _random_word($);
sub _random_unit($);
sub _improper_word(@);
sub _have_initial_y(@);
sub _have_final_split(@);
sub _illegal_placement(@);


#
# Global Variables:
#

$Crypt::RandPasswd::seed = undef; # by default; causes srand() to use its own, which can be pretty good.
$Crypt::RandPasswd::initialized = 0;



my @grams = qw( a b c d e f g h i j k l m n o p r s t u v w x y z ch gh ph rh sh th wh qu ck );
my %grams; @grams{@grams} = (); # and a set of same.

my @vowel_grams = qw( a e i o u y );
my %vowel_grams; @vowel_grams{@vowel_grams} = (); # and a set of same.



#
# Bit flags
#

use constant MAX_UNACCEPTABLE      => 20 ;

# gram rules:
use constant NOT_BEGIN_SYLLABLE    => 010 ;
use constant NO_FINAL_SPLIT        => 004 ;
use constant VOWEL                 => 002 ;
use constant ALTERNATE_VOWEL       => 001 ;
use constant NO_SPECIAL_RULE       => 000 ;

# digram rules:
use constant FRONT                 => 0200 ;
use constant NOT_FRONT             => 0100 ;
use constant BREAK                 => 0040 ;
use constant PREFIX                => 0020 ;
use constant ILLEGAL_PAIR          => 0010 ;
use constant SUFFIX                => 0004 ;
use constant BACK                  => 0002 ;
use constant NOT_BACK              => 0001 ;
use constant ANY_COMBINATION       => 0000 ;

## it used to be that info about units was contained in the C-arrays 'rules' and 'digram'.
## both were indexed numerically. 'rules' was essentially a mapping from a unique
## integer ID (the index) to a gram.  'digram' used the same mapping, but in a
## two-dimensional array.  I.e. to represent the digram "ab" ("a","b"), one would
## need to know the numeric ID of "a" and "b", which turn out to be 0 and 1, respectively;
## then use those indices in digram:  digram[0][1].
## The information at the "end" of a lookup in digram[][] was a simple integer
## representing the flag bits for that digram.  (The %digram in the current
## implementation is the same.)  The rules[] C-array, however, needed to store
## both the bitmask and the string representation of the gram, so it was an array
## of a struct { string, bitmask }.  Since %rules is an associative array, indexed
## directly by the gram, it only needs the bitmask at its "end", the same as %digram.
##
## both 'rules' and 'digram' contained bitflags for grams and digrams, respectively.
## additionally, 'rules' contained the string representation of the unit.
## because 'rules' contained both a string and flags for each unit, its contents
## were actually structs of { string, flags }.
##
## 'digram', on the other hand, was simply the bitflags (integers).

# struct unit {
#     char unit_code[5]; # string, usually 1, but up to 4 characters.
#     byte flags;
# } rules[34];

## the 'rules' C-array used to be indexed by gram index; now %rules is indexed by the gram itself.

my %rules;

@rules{ @grams } = ( NO_SPECIAL_RULE ) x @grams;
@rules{ @vowel_grams } = ( VOWEL ) x @vowel_grams;

$rules{'e'} |= NO_FINAL_SPLIT;
$rules{'y'} |= ALTERNATE_VOWEL;

$rules{'x'}  =
$rules{'ck'} = NOT_BEGIN_SYLLABLE;



#
# the 'digram' C-array, digram[34][34], was indexed by the unit indexes of the two grams;
# now %digram is indexed directly by the two grams.
#
my %digram;

    ##############################################################################################
    # BEGIN DIGRAM {
    ##############################################################################################

    $digram{'a'}{'a'} = ILLEGAL_PAIR;
    $digram{'a'}{'b'} = ANY_COMBINATION;
    $digram{'a'}{'c'} = ANY_COMBINATION;
    $digram{'a'}{'d'} = ANY_COMBINATION;
    $digram{'a'}{'e'} = ILLEGAL_PAIR;
    $digram{'a'}{'f'} = ANY_COMBINATION;
    $digram{'a'}{'g'} = ANY_COMBINATION;
    $digram{'a'}{'h'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'a'}{'i'} = ANY_COMBINATION;
    $digram{'a'}{'j'} = ANY_COMBINATION;
    $digram{'a'}{'k'} = ANY_COMBINATION;
    $digram{'a'}{'l'} = ANY_COMBINATION;
    $digram{'a'}{'m'} = ANY_COMBINATION;
    $digram{'a'}{'n'} = ANY_COMBINATION;
    $digram{'a'}{'o'} = ILLEGAL_PAIR;
    $digram{'a'}{'p'} = ANY_COMBINATION;
    $digram{'a'}{'r'} = ANY_COMBINATION;
    $digram{'a'}{'s'} = ANY_COMBINATION;
    $digram{'a'}{'t'} = ANY_COMBINATION;
    $digram{'a'}{'u'} = ANY_COMBINATION;
    $digram{'a'}{'v'} = ANY_COMBINATION;
    $digram{'a'}{'w'} = ANY_COMBINATION;
    $digram{'a'}{'x'} = ANY_COMBINATION;
    $digram{'a'}{'y'} = ANY_COMBINATION;
    $digram{'a'}{'z'} = ANY_COMBINATION;
    $digram{'a'}{'ch'} = ANY_COMBINATION;
    $digram{'a'}{'gh'} = ILLEGAL_PAIR;
    $digram{'a'}{'ph'} = ANY_COMBINATION;
    $digram{'a'}{'rh'} = ILLEGAL_PAIR;
    $digram{'a'}{'sh'} = ANY_COMBINATION;
    $digram{'a'}{'th'} = ANY_COMBINATION;
    $digram{'a'}{'wh'} = ILLEGAL_PAIR;
    $digram{'a'}{'qu'} = BREAK | NOT_BACK;
    $digram{'a'}{'ck'} = ANY_COMBINATION;

    $digram{'b'}{'a'} = ANY_COMBINATION;
    $digram{'b'}{'b'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'b'}{'c'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'b'}{'d'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'b'}{'e'} = ANY_COMBINATION;
    $digram{'b'}{'f'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'b'}{'g'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'b'}{'h'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'b'}{'i'} = ANY_COMBINATION;
    $digram{'b'}{'j'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'b'}{'k'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'b'}{'l'} = FRONT | SUFFIX | NOT_BACK;
    $digram{'b'}{'m'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'b'}{'n'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'b'}{'o'} = ANY_COMBINATION;
    $digram{'b'}{'p'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'b'}{'r'} = FRONT | BACK;
    $digram{'b'}{'s'} = NOT_FRONT;
    $digram{'b'}{'t'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'b'}{'u'} = ANY_COMBINATION;
    $digram{'b'}{'v'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'b'}{'w'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'b'}{'x'} = ILLEGAL_PAIR;
    $digram{'b'}{'y'} = ANY_COMBINATION;
    $digram{'b'}{'z'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'b'}{'ch'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'b'}{'gh'} = ILLEGAL_PAIR;
    $digram{'b'}{'ph'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'b'}{'rh'} = ILLEGAL_PAIR;
    $digram{'b'}{'sh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'b'}{'th'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'b'}{'wh'} = ILLEGAL_PAIR;
    $digram{'b'}{'qu'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'b'}{'ck'} = ILLEGAL_PAIR;

    $digram{'c'}{'a'} = ANY_COMBINATION;
    $digram{'c'}{'b'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'c'}{'c'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'c'}{'d'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'c'}{'e'} = ANY_COMBINATION;
    $digram{'c'}{'f'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'c'}{'g'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'c'}{'h'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'c'}{'i'} = ANY_COMBINATION;
    $digram{'c'}{'j'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'c'}{'k'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'c'}{'l'} = SUFFIX | NOT_BACK;
    $digram{'c'}{'m'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'c'}{'n'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'c'}{'o'} = ANY_COMBINATION;
    $digram{'c'}{'p'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'c'}{'r'} = NOT_BACK;
    $digram{'c'}{'s'} = NOT_FRONT | BACK;
    $digram{'c'}{'t'} = NOT_FRONT | PREFIX;
    $digram{'c'}{'u'} = ANY_COMBINATION;
    $digram{'c'}{'v'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'c'}{'w'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'c'}{'x'} = ILLEGAL_PAIR;
    $digram{'c'}{'y'} = ANY_COMBINATION;
    $digram{'c'}{'z'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'c'}{'ch'} = ILLEGAL_PAIR;
    $digram{'c'}{'gh'} = ILLEGAL_PAIR;
    $digram{'c'}{'ph'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'c'}{'rh'} = ILLEGAL_PAIR;
    $digram{'c'}{'sh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'c'}{'th'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'c'}{'wh'} = ILLEGAL_PAIR;
    $digram{'c'}{'qu'} = NOT_FRONT | SUFFIX | NOT_BACK;
    $digram{'c'}{'ck'} = ILLEGAL_PAIR;

    $digram{'d'}{'a'} = ANY_COMBINATION;
    $digram{'d'}{'b'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'d'}{'c'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'d'}{'d'} = NOT_FRONT;
    $digram{'d'}{'e'} = ANY_COMBINATION;
    $digram{'d'}{'f'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'d'}{'g'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'d'}{'h'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'d'}{'i'} = ANY_COMBINATION;
    $digram{'d'}{'j'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'d'}{'k'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'d'}{'l'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'d'}{'m'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'d'}{'n'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'d'}{'o'} = ANY_COMBINATION;
    $digram{'d'}{'p'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'d'}{'r'} = FRONT | NOT_BACK;
    $digram{'d'}{'s'} = NOT_FRONT | BACK;
    $digram{'d'}{'t'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'d'}{'u'} = ANY_COMBINATION;
    $digram{'d'}{'v'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'d'}{'w'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'d'}{'x'} = ILLEGAL_PAIR;
    $digram{'d'}{'y'} = ANY_COMBINATION;
    $digram{'d'}{'z'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'d'}{'ch'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'d'}{'gh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'d'}{'ph'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'d'}{'rh'} = ILLEGAL_PAIR;
    $digram{'d'}{'sh'} = NOT_FRONT | NOT_BACK;
    $digram{'d'}{'th'} = NOT_FRONT | PREFIX;
    $digram{'d'}{'wh'} = ILLEGAL_PAIR;
    $digram{'d'}{'qu'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'d'}{'ck'} = ILLEGAL_PAIR;

    $digram{'e'}{'a'} = ANY_COMBINATION;
    $digram{'e'}{'b'} = ANY_COMBINATION;
    $digram{'e'}{'c'} = ANY_COMBINATION;
    $digram{'e'}{'d'} = ANY_COMBINATION;
    $digram{'e'}{'e'} = ANY_COMBINATION;
    $digram{'e'}{'f'} = ANY_COMBINATION;
    $digram{'e'}{'g'} = ANY_COMBINATION;
    $digram{'e'}{'h'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'e'}{'i'} = NOT_BACK;
    $digram{'e'}{'j'} = ANY_COMBINATION;
    $digram{'e'}{'k'} = ANY_COMBINATION;
    $digram{'e'}{'l'} = ANY_COMBINATION;
    $digram{'e'}{'m'} = ANY_COMBINATION;
    $digram{'e'}{'n'} = ANY_COMBINATION;
    $digram{'e'}{'o'} = BREAK;
    $digram{'e'}{'p'} = ANY_COMBINATION;
    $digram{'e'}{'r'} = ANY_COMBINATION;
    $digram{'e'}{'s'} = ANY_COMBINATION;
    $digram{'e'}{'t'} = ANY_COMBINATION;
    $digram{'e'}{'u'} = ANY_COMBINATION;
    $digram{'e'}{'v'} = ANY_COMBINATION;
    $digram{'e'}{'w'} = ANY_COMBINATION;
    $digram{'e'}{'x'} = ANY_COMBINATION;
    $digram{'e'}{'y'} = ANY_COMBINATION;
    $digram{'e'}{'z'} = ANY_COMBINATION;
    $digram{'e'}{'ch'} = ANY_COMBINATION;
    $digram{'e'}{'gh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'e'}{'ph'} = ANY_COMBINATION;
    $digram{'e'}{'rh'} = ILLEGAL_PAIR;
    $digram{'e'}{'sh'} = ANY_COMBINATION;
    $digram{'e'}{'th'} = ANY_COMBINATION;
    $digram{'e'}{'wh'} = ILLEGAL_PAIR;
    $digram{'e'}{'qu'} = BREAK | NOT_BACK;
    $digram{'e'}{'ck'} = ANY_COMBINATION;

    $digram{'f'}{'a'} = ANY_COMBINATION;
    $digram{'f'}{'b'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'f'}{'c'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'f'}{'d'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'f'}{'e'} = ANY_COMBINATION;
    $digram{'f'}{'f'} = NOT_FRONT;
    $digram{'f'}{'g'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'f'}{'h'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'f'}{'i'} = ANY_COMBINATION;
    $digram{'f'}{'j'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'f'}{'k'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'f'}{'l'} = FRONT | SUFFIX | NOT_BACK;
    $digram{'f'}{'m'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'f'}{'n'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'f'}{'o'} = ANY_COMBINATION;
    $digram{'f'}{'p'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'f'}{'r'} = FRONT | NOT_BACK;
    $digram{'f'}{'s'} = NOT_FRONT;
    $digram{'f'}{'t'} = NOT_FRONT;
    $digram{'f'}{'u'} = ANY_COMBINATION;
    $digram{'f'}{'v'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'f'}{'w'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'f'}{'x'} = ILLEGAL_PAIR;
    $digram{'f'}{'y'} = NOT_FRONT;
    $digram{'f'}{'z'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'f'}{'ch'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'f'}{'gh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'f'}{'ph'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'f'}{'rh'} = ILLEGAL_PAIR;
    $digram{'f'}{'sh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'f'}{'th'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'f'}{'wh'} = ILLEGAL_PAIR;
    $digram{'f'}{'qu'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'f'}{'ck'} = ILLEGAL_PAIR;

    $digram{'g'}{'a'} = ANY_COMBINATION;
    $digram{'g'}{'b'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'g'}{'c'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'g'}{'d'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'g'}{'e'} = ANY_COMBINATION;
    $digram{'g'}{'f'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'g'}{'g'} = NOT_FRONT;
    $digram{'g'}{'h'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'g'}{'i'} = ANY_COMBINATION;
    $digram{'g'}{'j'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'g'}{'k'} = ILLEGAL_PAIR;
    $digram{'g'}{'l'} = FRONT | SUFFIX | NOT_BACK;
    $digram{'g'}{'m'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'g'}{'n'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'g'}{'o'} = ANY_COMBINATION;
    $digram{'g'}{'p'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'g'}{'r'} = FRONT | NOT_BACK;
    $digram{'g'}{'s'} = NOT_FRONT | BACK;
    $digram{'g'}{'t'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'g'}{'u'} = ANY_COMBINATION;
    $digram{'g'}{'v'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'g'}{'w'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'g'}{'x'} = ILLEGAL_PAIR;
    $digram{'g'}{'y'} = NOT_FRONT;
    $digram{'g'}{'z'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'g'}{'ch'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'g'}{'gh'} = ILLEGAL_PAIR;
    $digram{'g'}{'ph'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'g'}{'rh'} = ILLEGAL_PAIR;
    $digram{'g'}{'sh'} = NOT_FRONT;
    $digram{'g'}{'th'} = NOT_FRONT;
    $digram{'g'}{'wh'} = ILLEGAL_PAIR;
    $digram{'g'}{'qu'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'g'}{'ck'} = ILLEGAL_PAIR;

    $digram{'h'}{'a'} = ANY_COMBINATION;
    $digram{'h'}{'b'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'h'}{'c'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'h'}{'d'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'h'}{'e'} = ANY_COMBINATION;
    $digram{'h'}{'f'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'h'}{'g'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'h'}{'h'} = ILLEGAL_PAIR;
    $digram{'h'}{'i'} = ANY_COMBINATION;
    $digram{'h'}{'j'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'h'}{'k'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'h'}{'l'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'h'}{'m'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'h'}{'n'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'h'}{'o'} = ANY_COMBINATION;
    $digram{'h'}{'p'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'h'}{'r'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'h'}{'s'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'h'}{'t'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'h'}{'u'} = ANY_COMBINATION;
    $digram{'h'}{'v'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'h'}{'w'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'h'}{'x'} = ILLEGAL_PAIR;
    $digram{'h'}{'y'} = ANY_COMBINATION;
    $digram{'h'}{'z'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'h'}{'ch'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'h'}{'gh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'h'}{'ph'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'h'}{'rh'} = ILLEGAL_PAIR;
    $digram{'h'}{'sh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'h'}{'th'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'h'}{'wh'} = ILLEGAL_PAIR;
    $digram{'h'}{'qu'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'h'}{'ck'} = ILLEGAL_PAIR;

    $digram{'i'}{'a'} = ANY_COMBINATION;
    $digram{'i'}{'b'} = ANY_COMBINATION;
    $digram{'i'}{'c'} = ANY_COMBINATION;
    $digram{'i'}{'d'} = ANY_COMBINATION;
    $digram{'i'}{'e'} = NOT_FRONT;
    $digram{'i'}{'f'} = ANY_COMBINATION;
    $digram{'i'}{'g'} = ANY_COMBINATION;
    $digram{'i'}{'h'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'i'}{'i'} = ILLEGAL_PAIR;
    $digram{'i'}{'j'} = ANY_COMBINATION;
    $digram{'i'}{'k'} = ANY_COMBINATION;
    $digram{'i'}{'l'} = ANY_COMBINATION;
    $digram{'i'}{'m'} = ANY_COMBINATION;
    $digram{'i'}{'n'} = ANY_COMBINATION;
    $digram{'i'}{'o'} = BREAK;
    $digram{'i'}{'p'} = ANY_COMBINATION;
    $digram{'i'}{'r'} = ANY_COMBINATION;
    $digram{'i'}{'s'} = ANY_COMBINATION;
    $digram{'i'}{'t'} = ANY_COMBINATION;
    $digram{'i'}{'u'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'i'}{'v'} = ANY_COMBINATION;
    $digram{'i'}{'w'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'i'}{'x'} = ANY_COMBINATION;
    $digram{'i'}{'y'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'i'}{'z'} = ANY_COMBINATION;
    $digram{'i'}{'ch'} = ANY_COMBINATION;
    $digram{'i'}{'gh'} = NOT_FRONT;
    $digram{'i'}{'ph'} = ANY_COMBINATION;
    $digram{'i'}{'rh'} = ILLEGAL_PAIR;
    $digram{'i'}{'sh'} = ANY_COMBINATION;
    $digram{'i'}{'th'} = ANY_COMBINATION;
    $digram{'i'}{'wh'} = ILLEGAL_PAIR;
    $digram{'i'}{'qu'} = BREAK | NOT_BACK;
    $digram{'i'}{'ck'} = ANY_COMBINATION;

    $digram{'j'}{'a'} = ANY_COMBINATION;
    $digram{'j'}{'b'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'j'}{'c'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'j'}{'d'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'j'}{'e'} = ANY_COMBINATION;
    $digram{'j'}{'f'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'j'}{'g'} = ILLEGAL_PAIR;
    $digram{'j'}{'h'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'j'}{'i'} = ANY_COMBINATION;
    $digram{'j'}{'j'} = ILLEGAL_PAIR;
    $digram{'j'}{'k'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'j'}{'l'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'j'}{'m'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'j'}{'n'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'j'}{'o'} = ANY_COMBINATION;
    $digram{'j'}{'p'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'j'}{'r'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'j'}{'s'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'j'}{'t'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'j'}{'u'} = ANY_COMBINATION;
    $digram{'j'}{'v'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'j'}{'w'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'j'}{'x'} = ILLEGAL_PAIR;
    $digram{'j'}{'y'} = NOT_FRONT;
    $digram{'j'}{'z'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'j'}{'ch'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'j'}{'gh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'j'}{'ph'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'j'}{'rh'} = ILLEGAL_PAIR;
    $digram{'j'}{'sh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'j'}{'th'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'j'}{'wh'} = ILLEGAL_PAIR;
    $digram{'j'}{'qu'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'j'}{'ck'} = ILLEGAL_PAIR;

    $digram{'k'}{'a'} = ANY_COMBINATION;
    $digram{'k'}{'b'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'k'}{'c'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'k'}{'d'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'k'}{'e'} = ANY_COMBINATION;
    $digram{'k'}{'f'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'k'}{'g'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'k'}{'h'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'k'}{'i'} = ANY_COMBINATION;
    $digram{'k'}{'j'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'k'}{'k'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'k'}{'l'} = SUFFIX | NOT_BACK;
    $digram{'k'}{'m'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'k'}{'n'} = FRONT | SUFFIX | NOT_BACK;
    $digram{'k'}{'o'} = ANY_COMBINATION;
    $digram{'k'}{'p'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'k'}{'r'} = SUFFIX | NOT_BACK;
    $digram{'k'}{'s'} = NOT_FRONT | BACK;
    $digram{'k'}{'t'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'k'}{'u'} = ANY_COMBINATION;
    $digram{'k'}{'v'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'k'}{'w'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'k'}{'x'} = ILLEGAL_PAIR;
    $digram{'k'}{'y'} = NOT_FRONT;
    $digram{'k'}{'z'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'k'}{'ch'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'k'}{'gh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'k'}{'ph'} = NOT_FRONT | PREFIX;
    $digram{'k'}{'rh'} = ILLEGAL_PAIR;
    $digram{'k'}{'sh'} = NOT_FRONT;
    $digram{'k'}{'th'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'k'}{'wh'} = ILLEGAL_PAIR;
    $digram{'k'}{'qu'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'k'}{'ck'} = ILLEGAL_PAIR;

    $digram{'l'}{'a'} = ANY_COMBINATION;
    $digram{'l'}{'b'} = NOT_FRONT | PREFIX;
    $digram{'l'}{'c'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'l'}{'d'} = NOT_FRONT | PREFIX;
    $digram{'l'}{'e'} = ANY_COMBINATION;
    $digram{'l'}{'f'} = NOT_FRONT | PREFIX;
    $digram{'l'}{'g'} = NOT_FRONT | PREFIX;
    $digram{'l'}{'h'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'l'}{'i'} = ANY_COMBINATION;
    $digram{'l'}{'j'} = NOT_FRONT | PREFIX;
    $digram{'l'}{'k'} = NOT_FRONT | PREFIX;
    $digram{'l'}{'l'} = NOT_FRONT | PREFIX;
    $digram{'l'}{'m'} = NOT_FRONT | PREFIX;
    $digram{'l'}{'n'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'l'}{'o'} = ANY_COMBINATION;
    $digram{'l'}{'p'} = NOT_FRONT | PREFIX;
    $digram{'l'}{'r'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'l'}{'s'} = NOT_FRONT;
    $digram{'l'}{'t'} = NOT_FRONT | PREFIX;
    $digram{'l'}{'u'} = ANY_COMBINATION;
    $digram{'l'}{'v'} = NOT_FRONT | PREFIX;
    $digram{'l'}{'w'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'l'}{'x'} = ILLEGAL_PAIR;
    $digram{'l'}{'y'} = ANY_COMBINATION;
    $digram{'l'}{'z'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'l'}{'ch'} = NOT_FRONT | PREFIX;
    $digram{'l'}{'gh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'l'}{'ph'} = NOT_FRONT | PREFIX;
    $digram{'l'}{'rh'} = ILLEGAL_PAIR;
    $digram{'l'}{'sh'} = NOT_FRONT | PREFIX;
    $digram{'l'}{'th'} = NOT_FRONT | PREFIX;
    $digram{'l'}{'wh'} = ILLEGAL_PAIR;
    $digram{'l'}{'qu'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'l'}{'ck'} = ILLEGAL_PAIR;

    $digram{'m'}{'a'} = ANY_COMBINATION;
    $digram{'m'}{'b'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'m'}{'c'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'m'}{'d'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'m'}{'e'} = ANY_COMBINATION;
    $digram{'m'}{'f'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'m'}{'g'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'m'}{'h'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'m'}{'i'} = ANY_COMBINATION;
    $digram{'m'}{'j'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'m'}{'k'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'m'}{'l'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'m'}{'m'} = NOT_FRONT;
    $digram{'m'}{'n'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'m'}{'o'} = ANY_COMBINATION;
    $digram{'m'}{'p'} = NOT_FRONT;
    $digram{'m'}{'r'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'m'}{'s'} = NOT_FRONT;
    $digram{'m'}{'t'} = NOT_FRONT;
    $digram{'m'}{'u'} = ANY_COMBINATION;
    $digram{'m'}{'v'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'m'}{'w'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'m'}{'x'} = ILLEGAL_PAIR;
    $digram{'m'}{'y'} = ANY_COMBINATION;
    $digram{'m'}{'z'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'m'}{'ch'} = NOT_FRONT | PREFIX;
    $digram{'m'}{'gh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'m'}{'ph'} = NOT_FRONT;
    $digram{'m'}{'rh'} = ILLEGAL_PAIR;
    $digram{'m'}{'sh'} = NOT_FRONT;
    $digram{'m'}{'th'} = NOT_FRONT;
    $digram{'m'}{'wh'} = ILLEGAL_PAIR;
    $digram{'m'}{'qu'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'m'}{'ck'} = ILLEGAL_PAIR;

    $digram{'n'}{'a'} = ANY_COMBINATION;
    $digram{'n'}{'b'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'n'}{'c'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'n'}{'d'} = NOT_FRONT;
    $digram{'n'}{'e'} = ANY_COMBINATION;
    $digram{'n'}{'f'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'n'}{'g'} = NOT_FRONT | PREFIX;
    $digram{'n'}{'h'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'n'}{'i'} = ANY_COMBINATION;
    $digram{'n'}{'j'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'n'}{'k'} = NOT_FRONT | PREFIX;
    $digram{'n'}{'l'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'n'}{'m'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'n'}{'n'} = NOT_FRONT;
    $digram{'n'}{'o'} = ANY_COMBINATION;
    $digram{'n'}{'p'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'n'}{'r'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'n'}{'s'} = NOT_FRONT;
    $digram{'n'}{'t'} = NOT_FRONT;
    $digram{'n'}{'u'} = ANY_COMBINATION;
    $digram{'n'}{'v'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'n'}{'w'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'n'}{'x'} = ILLEGAL_PAIR;
    $digram{'n'}{'y'} = NOT_FRONT;
    $digram{'n'}{'z'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'n'}{'ch'} = NOT_FRONT | PREFIX;
    $digram{'n'}{'gh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'n'}{'ph'} = NOT_FRONT | PREFIX;
    $digram{'n'}{'rh'} = ILLEGAL_PAIR;
    $digram{'n'}{'sh'} = NOT_FRONT;
    $digram{'n'}{'th'} = NOT_FRONT;
    $digram{'n'}{'wh'} = ILLEGAL_PAIR;
    $digram{'n'}{'qu'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'n'}{'ck'} = NOT_FRONT | PREFIX;

    $digram{'o'}{'a'} = ANY_COMBINATION;
    $digram{'o'}{'b'} = ANY_COMBINATION;
    $digram{'o'}{'c'} = ANY_COMBINATION;
    $digram{'o'}{'d'} = ANY_COMBINATION;
    $digram{'o'}{'e'} = ILLEGAL_PAIR;
    $digram{'o'}{'f'} = ANY_COMBINATION;
    $digram{'o'}{'g'} = ANY_COMBINATION;
    $digram{'o'}{'h'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'o'}{'i'} = ANY_COMBINATION;
    $digram{'o'}{'j'} = ANY_COMBINATION;
    $digram{'o'}{'k'} = ANY_COMBINATION;
    $digram{'o'}{'l'} = ANY_COMBINATION;
    $digram{'o'}{'m'} = ANY_COMBINATION;
    $digram{'o'}{'n'} = ANY_COMBINATION;
    $digram{'o'}{'o'} = ANY_COMBINATION;
    $digram{'o'}{'p'} = ANY_COMBINATION;
    $digram{'o'}{'r'} = ANY_COMBINATION;
    $digram{'o'}{'s'} = ANY_COMBINATION;
    $digram{'o'}{'t'} = ANY_COMBINATION;
    $digram{'o'}{'u'} = ANY_COMBINATION;
    $digram{'o'}{'v'} = ANY_COMBINATION;
    $digram{'o'}{'w'} = ANY_COMBINATION;
    $digram{'o'}{'x'} = ANY_COMBINATION;
    $digram{'o'}{'y'} = ANY_COMBINATION;
    $digram{'o'}{'z'} = ANY_COMBINATION;
    $digram{'o'}{'ch'} = ANY_COMBINATION;
    $digram{'o'}{'gh'} = NOT_FRONT;
    $digram{'o'}{'ph'} = ANY_COMBINATION;
    $digram{'o'}{'rh'} = ILLEGAL_PAIR;
    $digram{'o'}{'sh'} = ANY_COMBINATION;
    $digram{'o'}{'th'} = ANY_COMBINATION;
    $digram{'o'}{'wh'} = ILLEGAL_PAIR;
    $digram{'o'}{'qu'} = BREAK | NOT_BACK;
    $digram{'o'}{'ck'} = ANY_COMBINATION;

    $digram{'p'}{'a'} = ANY_COMBINATION;
    $digram{'p'}{'b'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'p'}{'c'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'p'}{'d'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'p'}{'e'} = ANY_COMBINATION;
    $digram{'p'}{'f'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'p'}{'g'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'p'}{'h'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'p'}{'i'} = ANY_COMBINATION;
    $digram{'p'}{'j'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'p'}{'k'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'p'}{'l'} = SUFFIX | NOT_BACK;
    $digram{'p'}{'m'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'p'}{'n'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'p'}{'o'} = ANY_COMBINATION;
    $digram{'p'}{'p'} = NOT_FRONT | PREFIX;
    $digram{'p'}{'r'} = NOT_BACK;
    $digram{'p'}{'s'} = NOT_FRONT | BACK;
    $digram{'p'}{'t'} = NOT_FRONT | BACK;
    $digram{'p'}{'u'} = NOT_FRONT | BACK;
    $digram{'p'}{'v'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'p'}{'w'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'p'}{'x'} = ILLEGAL_PAIR;
    $digram{'p'}{'y'} = ANY_COMBINATION;
    $digram{'p'}{'z'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'p'}{'ch'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'p'}{'gh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'p'}{'ph'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'p'}{'rh'} = ILLEGAL_PAIR;
    $digram{'p'}{'sh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'p'}{'th'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'p'}{'wh'} = ILLEGAL_PAIR;
    $digram{'p'}{'qu'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'p'}{'ck'} = ILLEGAL_PAIR;

    $digram{'r'}{'a'} = ANY_COMBINATION;
    $digram{'r'}{'b'} = NOT_FRONT | PREFIX;
    $digram{'r'}{'c'} = NOT_FRONT | PREFIX;
    $digram{'r'}{'d'} = NOT_FRONT | PREFIX;
    $digram{'r'}{'e'} = ANY_COMBINATION;
    $digram{'r'}{'f'} = NOT_FRONT | PREFIX;
    $digram{'r'}{'g'} = NOT_FRONT | PREFIX;
    $digram{'r'}{'h'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'r'}{'i'} = ANY_COMBINATION;
    $digram{'r'}{'j'} = NOT_FRONT | PREFIX;
    $digram{'r'}{'k'} = NOT_FRONT | PREFIX;
    $digram{'r'}{'l'} = NOT_FRONT | PREFIX;
    $digram{'r'}{'m'} = NOT_FRONT | PREFIX;
    $digram{'r'}{'n'} = NOT_FRONT | PREFIX;
    $digram{'r'}{'o'} = ANY_COMBINATION;
    $digram{'r'}{'p'} = NOT_FRONT | PREFIX;
    $digram{'r'}{'r'} = NOT_FRONT | PREFIX;
    $digram{'r'}{'s'} = NOT_FRONT | PREFIX;
    $digram{'r'}{'t'} = NOT_FRONT | PREFIX;
    $digram{'r'}{'u'} = ANY_COMBINATION;
    $digram{'r'}{'v'} = NOT_FRONT | PREFIX;
    $digram{'r'}{'w'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'r'}{'x'} = ILLEGAL_PAIR;
    $digram{'r'}{'y'} = ANY_COMBINATION;
    $digram{'r'}{'z'} = NOT_FRONT | PREFIX;
    $digram{'r'}{'ch'} = NOT_FRONT | PREFIX;
    $digram{'r'}{'gh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'r'}{'ph'} = NOT_FRONT | PREFIX;
    $digram{'r'}{'rh'} = ILLEGAL_PAIR;
    $digram{'r'}{'sh'} = NOT_FRONT | PREFIX;
    $digram{'r'}{'th'} = NOT_FRONT | PREFIX;
    $digram{'r'}{'wh'} = ILLEGAL_PAIR;
    $digram{'r'}{'qu'} = NOT_FRONT | PREFIX | NOT_BACK;
    $digram{'r'}{'ck'} = NOT_FRONT | PREFIX;

    $digram{'s'}{'a'} = ANY_COMBINATION;
    $digram{'s'}{'b'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'s'}{'c'} = NOT_BACK;
    $digram{'s'}{'d'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'s'}{'e'} = ANY_COMBINATION;
    $digram{'s'}{'f'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'s'}{'g'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'s'}{'h'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'s'}{'i'} = ANY_COMBINATION;
    $digram{'s'}{'j'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'s'}{'k'} = ANY_COMBINATION;
    $digram{'s'}{'l'} = FRONT | SUFFIX | NOT_BACK;
    $digram{'s'}{'m'} = SUFFIX | NOT_BACK;
    $digram{'s'}{'n'} = PREFIX | SUFFIX | NOT_BACK;
    $digram{'s'}{'o'} = ANY_COMBINATION;
    $digram{'s'}{'p'} = ANY_COMBINATION;
    $digram{'s'}{'r'} = NOT_FRONT | NOT_BACK;
    $digram{'s'}{'s'} = NOT_FRONT | PREFIX;
    $digram{'s'}{'t'} = ANY_COMBINATION;
    $digram{'s'}{'u'} = ANY_COMBINATION;
    $digram{'s'}{'v'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'s'}{'w'} = FRONT | SUFFIX | NOT_BACK;
    $digram{'s'}{'x'} = ILLEGAL_PAIR;
    $digram{'s'}{'y'} = ANY_COMBINATION;
    $digram{'s'}{'z'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'s'}{'ch'} = FRONT | SUFFIX | NOT_BACK;
    $digram{'s'}{'gh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'s'}{'ph'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'s'}{'rh'} = ILLEGAL_PAIR;
    $digram{'s'}{'sh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'s'}{'th'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'s'}{'wh'} = ILLEGAL_PAIR;
    $digram{'s'}{'qu'} = SUFFIX | NOT_BACK;
    $digram{'s'}{'ck'} = NOT_FRONT;

    $digram{'t'}{'a'} = ANY_COMBINATION;
    $digram{'t'}{'b'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'t'}{'c'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'t'}{'d'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'t'}{'e'} = ANY_COMBINATION;
    $digram{'t'}{'f'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'t'}{'g'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'t'}{'h'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'t'}{'i'} = ANY_COMBINATION;
    $digram{'t'}{'j'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'t'}{'k'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'t'}{'l'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'t'}{'m'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'t'}{'n'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'t'}{'o'} = ANY_COMBINATION;
    $digram{'t'}{'p'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'t'}{'r'} = NOT_BACK;
    $digram{'t'}{'s'} = NOT_FRONT | BACK;
    $digram{'t'}{'t'} = NOT_FRONT | PREFIX;
    $digram{'t'}{'u'} = ANY_COMBINATION;
    $digram{'t'}{'v'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'t'}{'w'} = FRONT | SUFFIX | NOT_BACK;
    $digram{'t'}{'x'} = ILLEGAL_PAIR;
    $digram{'t'}{'y'} = ANY_COMBINATION;
    $digram{'t'}{'z'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'t'}{'ch'} = NOT_FRONT;
    $digram{'t'}{'gh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'t'}{'ph'} = NOT_FRONT | BACK;
    $digram{'t'}{'rh'} = ILLEGAL_PAIR;
    $digram{'t'}{'sh'} = NOT_FRONT | BACK;
    $digram{'t'}{'th'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'t'}{'wh'} = ILLEGAL_PAIR;
    $digram{'t'}{'qu'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'t'}{'ck'} = ILLEGAL_PAIR;

    $digram{'u'}{'a'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'u'}{'b'} = ANY_COMBINATION;
    $digram{'u'}{'c'} = ANY_COMBINATION;
    $digram{'u'}{'d'} = ANY_COMBINATION;
    $digram{'u'}{'e'} = NOT_FRONT;
    $digram{'u'}{'f'} = ANY_COMBINATION;
    $digram{'u'}{'g'} = ANY_COMBINATION;
    $digram{'u'}{'h'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'u'}{'i'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'u'}{'j'} = ANY_COMBINATION;
    $digram{'u'}{'k'} = ANY_COMBINATION;
    $digram{'u'}{'l'} = ANY_COMBINATION;
    $digram{'u'}{'m'} = ANY_COMBINATION;
    $digram{'u'}{'n'} = ANY_COMBINATION;
    $digram{'u'}{'o'} = NOT_FRONT | BREAK;
    $digram{'u'}{'p'} = ANY_COMBINATION;
    $digram{'u'}{'r'} = ANY_COMBINATION;
    $digram{'u'}{'s'} = ANY_COMBINATION;
    $digram{'u'}{'t'} = ANY_COMBINATION;
    $digram{'u'}{'u'} = ILLEGAL_PAIR;
    $digram{'u'}{'v'} = ANY_COMBINATION;
    $digram{'u'}{'w'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'u'}{'x'} = ANY_COMBINATION;
    $digram{'u'}{'y'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'u'}{'z'} = ANY_COMBINATION;
    $digram{'u'}{'ch'} = ANY_COMBINATION;
    $digram{'u'}{'gh'} = NOT_FRONT | PREFIX;
    $digram{'u'}{'ph'} = ANY_COMBINATION;
    $digram{'u'}{'rh'} = ILLEGAL_PAIR;
    $digram{'u'}{'sh'} = ANY_COMBINATION;
    $digram{'u'}{'th'} = ANY_COMBINATION;
    $digram{'u'}{'wh'} = ILLEGAL_PAIR;
    $digram{'u'}{'qu'} = BREAK | NOT_BACK;
    $digram{'u'}{'ck'} = ANY_COMBINATION;

    $digram{'v'}{'a'} = ANY_COMBINATION;
    $digram{'v'}{'b'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'v'}{'c'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'v'}{'d'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'v'}{'e'} = ANY_COMBINATION;
    $digram{'v'}{'f'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'v'}{'g'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'v'}{'h'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'v'}{'i'} = ANY_COMBINATION;
    $digram{'v'}{'j'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'v'}{'k'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'v'}{'l'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'v'}{'m'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'v'}{'n'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'v'}{'o'} = ANY_COMBINATION;
    $digram{'v'}{'p'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'v'}{'r'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'v'}{'s'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'v'}{'t'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'v'}{'u'} = ANY_COMBINATION;
    $digram{'v'}{'v'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'v'}{'w'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'v'}{'x'} = ILLEGAL_PAIR;
    $digram{'v'}{'y'} = NOT_FRONT;
    $digram{'v'}{'z'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'v'}{'ch'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'v'}{'gh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'v'}{'ph'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'v'}{'rh'} = ILLEGAL_PAIR;
    $digram{'v'}{'sh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'v'}{'th'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'v'}{'wh'} = ILLEGAL_PAIR;
    $digram{'v'}{'qu'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'v'}{'ck'} = ILLEGAL_PAIR;

    $digram{'w'}{'a'} = ANY_COMBINATION;
    $digram{'w'}{'b'} = NOT_FRONT | PREFIX;
    $digram{'w'}{'c'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'w'}{'d'} = NOT_FRONT | PREFIX | BACK;
    $digram{'w'}{'e'} = ANY_COMBINATION;
    $digram{'w'}{'f'} = NOT_FRONT | PREFIX;
    $digram{'w'}{'g'} = NOT_FRONT | PREFIX | BACK;
    $digram{'w'}{'h'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'w'}{'i'} = ANY_COMBINATION;
    $digram{'w'}{'j'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'w'}{'k'} = NOT_FRONT | PREFIX;
    $digram{'w'}{'l'} = NOT_FRONT | PREFIX | SUFFIX;
    $digram{'w'}{'m'} = NOT_FRONT | PREFIX;
    $digram{'w'}{'n'} = NOT_FRONT | PREFIX;
    $digram{'w'}{'o'} = ANY_COMBINATION;
    $digram{'w'}{'p'} = NOT_FRONT | PREFIX;
    $digram{'w'}{'r'} = FRONT | SUFFIX | NOT_BACK;
    $digram{'w'}{'s'} = NOT_FRONT | PREFIX;
    $digram{'w'}{'t'} = NOT_FRONT | PREFIX;
    $digram{'w'}{'u'} = ANY_COMBINATION;
    $digram{'w'}{'v'} = NOT_FRONT | PREFIX;
    $digram{'w'}{'w'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'w'}{'x'} = NOT_FRONT | PREFIX;
    $digram{'w'}{'y'} = ANY_COMBINATION;
    $digram{'w'}{'z'} = NOT_FRONT | PREFIX;
    $digram{'w'}{'ch'} = NOT_FRONT;
    $digram{'w'}{'gh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'w'}{'ph'} = NOT_FRONT;
    $digram{'w'}{'rh'} = ILLEGAL_PAIR;
    $digram{'w'}{'sh'} = NOT_FRONT;
    $digram{'w'}{'th'} = NOT_FRONT;
    $digram{'w'}{'wh'} = ILLEGAL_PAIR;
    $digram{'w'}{'qu'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'w'}{'ck'} = NOT_FRONT;

    $digram{'x'}{'a'} = NOT_FRONT;
    $digram{'x'}{'b'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'x'}{'c'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'x'}{'d'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'x'}{'e'} = NOT_FRONT;
    $digram{'x'}{'f'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'x'}{'g'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'x'}{'h'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'x'}{'i'} = NOT_FRONT;
    $digram{'x'}{'j'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'x'}{'k'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'x'}{'l'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'x'}{'m'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'x'}{'n'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'x'}{'o'} = NOT_FRONT;
    $digram{'x'}{'p'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'x'}{'r'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'x'}{'s'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'x'}{'t'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'x'}{'u'} = NOT_FRONT;
    $digram{'x'}{'v'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'x'}{'w'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'x'}{'x'} = ILLEGAL_PAIR;
    $digram{'x'}{'y'} = NOT_FRONT;
    $digram{'x'}{'z'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'x'}{'ch'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'x'}{'gh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'x'}{'ph'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'x'}{'rh'} = ILLEGAL_PAIR;
    $digram{'x'}{'sh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'x'}{'th'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'x'}{'wh'} = ILLEGAL_PAIR;
    $digram{'x'}{'qu'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'x'}{'ck'} = ILLEGAL_PAIR;

    $digram{'y'}{'a'} = ANY_COMBINATION;
    $digram{'y'}{'b'} = NOT_FRONT;
    $digram{'y'}{'c'} = NOT_FRONT | NOT_BACK;
    $digram{'y'}{'d'} = NOT_FRONT;
    $digram{'y'}{'e'} = ANY_COMBINATION;
    $digram{'y'}{'f'} = NOT_FRONT | NOT_BACK;
    $digram{'y'}{'g'} = NOT_FRONT;
    $digram{'y'}{'h'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'y'}{'i'} = FRONT | NOT_BACK;
    $digram{'y'}{'j'} = NOT_FRONT | NOT_BACK;
    $digram{'y'}{'k'} = NOT_FRONT;
    $digram{'y'}{'l'} = NOT_FRONT | NOT_BACK;
    $digram{'y'}{'m'} = NOT_FRONT;
    $digram{'y'}{'n'} = NOT_FRONT;
    $digram{'y'}{'o'} = ANY_COMBINATION;
    $digram{'y'}{'p'} = NOT_FRONT;
    $digram{'y'}{'r'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'y'}{'s'} = NOT_FRONT;
    $digram{'y'}{'t'} = NOT_FRONT;
    $digram{'y'}{'u'} = ANY_COMBINATION;
    $digram{'y'}{'v'} = NOT_FRONT | NOT_BACK;
    $digram{'y'}{'w'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'y'}{'x'} = NOT_FRONT;
    $digram{'y'}{'y'} = ILLEGAL_PAIR;
    $digram{'y'}{'z'} = NOT_FRONT;
    $digram{'y'}{'ch'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'y'}{'gh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'y'}{'ph'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'y'}{'rh'} = ILLEGAL_PAIR;
    $digram{'y'}{'sh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'y'}{'th'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'y'}{'wh'} = ILLEGAL_PAIR;
    $digram{'y'}{'qu'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'y'}{'ck'} = ILLEGAL_PAIR;

    $digram{'z'}{'a'} = ANY_COMBINATION;
    $digram{'z'}{'b'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'z'}{'c'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'z'}{'d'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'z'}{'e'} = ANY_COMBINATION;
    $digram{'z'}{'f'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'z'}{'g'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'z'}{'h'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'z'}{'i'} = ANY_COMBINATION;
    $digram{'z'}{'j'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'z'}{'k'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'z'}{'l'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'z'}{'m'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'z'}{'n'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'z'}{'o'} = ANY_COMBINATION;
    $digram{'z'}{'p'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'z'}{'r'} = NOT_FRONT | NOT_BACK;
    $digram{'z'}{'s'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'z'}{'t'} = NOT_FRONT;
    $digram{'z'}{'u'} = ANY_COMBINATION;
    $digram{'z'}{'v'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'z'}{'w'} = SUFFIX | NOT_BACK;
    $digram{'z'}{'x'} = ILLEGAL_PAIR;
    $digram{'z'}{'y'} = ANY_COMBINATION;
    $digram{'z'}{'z'} = NOT_FRONT;
    $digram{'z'}{'ch'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'z'}{'gh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'z'}{'ph'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'z'}{'rh'} = ILLEGAL_PAIR;
    $digram{'z'}{'sh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'z'}{'th'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'z'}{'wh'} = ILLEGAL_PAIR;
    $digram{'z'}{'qu'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'z'}{'ck'} = ILLEGAL_PAIR;

    $digram{'ch'}{'a'} = ANY_COMBINATION;
    $digram{'ch'}{'b'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ch'}{'c'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ch'}{'d'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ch'}{'e'} = ANY_COMBINATION;
    $digram{'ch'}{'f'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ch'}{'g'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ch'}{'h'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ch'}{'i'} = ANY_COMBINATION;
    $digram{'ch'}{'j'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ch'}{'k'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ch'}{'l'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ch'}{'m'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ch'}{'n'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ch'}{'o'} = ANY_COMBINATION;
    $digram{'ch'}{'p'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ch'}{'r'} = NOT_BACK;
    $digram{'ch'}{'s'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ch'}{'t'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ch'}{'u'} = ANY_COMBINATION;
    $digram{'ch'}{'v'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ch'}{'w'} = NOT_FRONT | NOT_BACK;
    $digram{'ch'}{'x'} = ILLEGAL_PAIR;
    $digram{'ch'}{'y'} = ANY_COMBINATION;
    $digram{'ch'}{'z'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ch'}{'ch'} = ILLEGAL_PAIR;
    $digram{'ch'}{'gh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ch'}{'ph'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ch'}{'rh'} = ILLEGAL_PAIR;
    $digram{'ch'}{'sh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ch'}{'th'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ch'}{'wh'} = ILLEGAL_PAIR;
    $digram{'ch'}{'qu'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ch'}{'ck'} = ILLEGAL_PAIR;

    $digram{'gh'}{'a'} = ANY_COMBINATION;
    $digram{'gh'}{'b'} = NOT_FRONT | BREAK | PREFIX | NOT_BACK;
    $digram{'gh'}{'c'} = NOT_FRONT | BREAK | PREFIX | NOT_BACK;
    $digram{'gh'}{'d'} = NOT_FRONT | BREAK | PREFIX | NOT_BACK;
    $digram{'gh'}{'e'} = ANY_COMBINATION;
    $digram{'gh'}{'f'} = NOT_FRONT | BREAK | PREFIX | NOT_BACK;
    $digram{'gh'}{'g'} = NOT_FRONT | BREAK | PREFIX | NOT_BACK;
    $digram{'gh'}{'h'} = NOT_FRONT | BREAK | PREFIX | NOT_BACK;
    $digram{'gh'}{'i'} = FRONT | NOT_BACK;
    $digram{'gh'}{'j'} = NOT_FRONT | BREAK | PREFIX | NOT_BACK;
    $digram{'gh'}{'k'} = NOT_FRONT | BREAK | PREFIX | NOT_BACK;
    $digram{'gh'}{'l'} = NOT_FRONT | BREAK | PREFIX | NOT_BACK;
    $digram{'gh'}{'m'} = NOT_FRONT | BREAK | PREFIX | NOT_BACK;
    $digram{'gh'}{'n'} = NOT_FRONT | BREAK | PREFIX | NOT_BACK;
    $digram{'gh'}{'o'} = FRONT | NOT_BACK;
    $digram{'gh'}{'p'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'gh'}{'r'} = NOT_FRONT | BREAK | PREFIX | NOT_BACK;
    $digram{'gh'}{'s'} = NOT_FRONT | PREFIX;
    $digram{'gh'}{'t'} = NOT_FRONT | PREFIX;
    $digram{'gh'}{'u'} = NOT_FRONT | BREAK | PREFIX | NOT_BACK;
    $digram{'gh'}{'v'} = NOT_FRONT | BREAK | PREFIX | NOT_BACK;
    $digram{'gh'}{'w'} = NOT_FRONT | BREAK | PREFIX | NOT_BACK;
    $digram{'gh'}{'x'} = ILLEGAL_PAIR;
    $digram{'gh'}{'y'} = NOT_FRONT | BREAK | PREFIX | NOT_BACK;
    $digram{'gh'}{'z'} = NOT_FRONT | BREAK | PREFIX | NOT_BACK;
    $digram{'gh'}{'ch'} = NOT_FRONT | BREAK | PREFIX | NOT_BACK;
    $digram{'gh'}{'gh'} = ILLEGAL_PAIR;
    $digram{'gh'}{'ph'} = NOT_FRONT | BREAK | PREFIX | NOT_BACK;
    $digram{'gh'}{'rh'} = ILLEGAL_PAIR;
    $digram{'gh'}{'sh'} = NOT_FRONT | BREAK | PREFIX | NOT_BACK;
    $digram{'gh'}{'th'} = NOT_FRONT | BREAK | PREFIX | NOT_BACK;
    $digram{'gh'}{'wh'} = ILLEGAL_PAIR;
    $digram{'gh'}{'qu'} = NOT_FRONT | BREAK | PREFIX | NOT_BACK;
    $digram{'gh'}{'ck'} = ILLEGAL_PAIR;

    $digram{'ph'}{'a'} = ANY_COMBINATION;
    $digram{'ph'}{'b'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ph'}{'c'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ph'}{'d'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ph'}{'e'} = ANY_COMBINATION;
    $digram{'ph'}{'f'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ph'}{'g'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ph'}{'h'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ph'}{'i'} = ANY_COMBINATION;
    $digram{'ph'}{'j'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ph'}{'k'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ph'}{'l'} = FRONT | SUFFIX | NOT_BACK;
    $digram{'ph'}{'m'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ph'}{'n'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ph'}{'o'} = ANY_COMBINATION;
    $digram{'ph'}{'p'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ph'}{'r'} = NOT_BACK;
    $digram{'ph'}{'s'} = NOT_FRONT;
    $digram{'ph'}{'t'} = NOT_FRONT;
    $digram{'ph'}{'u'} = ANY_COMBINATION;
    $digram{'ph'}{'v'} = NOT_FRONT | NOT_BACK;
    $digram{'ph'}{'w'} = NOT_FRONT | NOT_BACK;
    $digram{'ph'}{'x'} = ILLEGAL_PAIR;
    $digram{'ph'}{'y'} = NOT_FRONT;
    $digram{'ph'}{'z'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ph'}{'ch'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ph'}{'gh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ph'}{'ph'} = ILLEGAL_PAIR;
    $digram{'ph'}{'rh'} = ILLEGAL_PAIR;
    $digram{'ph'}{'sh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ph'}{'th'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ph'}{'wh'} = ILLEGAL_PAIR;
    $digram{'ph'}{'qu'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ph'}{'ck'} = ILLEGAL_PAIR;

    $digram{'rh'}{'a'} = FRONT | NOT_BACK;
    $digram{'rh'}{'b'} = ILLEGAL_PAIR;
    $digram{'rh'}{'c'} = ILLEGAL_PAIR;
    $digram{'rh'}{'d'} = ILLEGAL_PAIR;
    $digram{'rh'}{'e'} = FRONT | NOT_BACK;
    $digram{'rh'}{'f'} = ILLEGAL_PAIR;
    $digram{'rh'}{'g'} = ILLEGAL_PAIR;
    $digram{'rh'}{'h'} = ILLEGAL_PAIR;
    $digram{'rh'}{'i'} = FRONT | NOT_BACK;
    $digram{'rh'}{'j'} = ILLEGAL_PAIR;
    $digram{'rh'}{'k'} = ILLEGAL_PAIR;
    $digram{'rh'}{'l'} = ILLEGAL_PAIR;
    $digram{'rh'}{'m'} = ILLEGAL_PAIR;
    $digram{'rh'}{'n'} = ILLEGAL_PAIR;
    $digram{'rh'}{'o'} = FRONT | NOT_BACK;
    $digram{'rh'}{'p'} = ILLEGAL_PAIR;
    $digram{'rh'}{'r'} = ILLEGAL_PAIR;
    $digram{'rh'}{'s'} = ILLEGAL_PAIR;
    $digram{'rh'}{'t'} = ILLEGAL_PAIR;
    $digram{'rh'}{'u'} = FRONT | NOT_BACK;
    $digram{'rh'}{'v'} = ILLEGAL_PAIR;
    $digram{'rh'}{'w'} = ILLEGAL_PAIR;
    $digram{'rh'}{'x'} = ILLEGAL_PAIR;
    $digram{'rh'}{'y'} = FRONT | NOT_BACK;
    $digram{'rh'}{'z'} = ILLEGAL_PAIR;
    $digram{'rh'}{'ch'} = ILLEGAL_PAIR;
    $digram{'rh'}{'gh'} = ILLEGAL_PAIR;
    $digram{'rh'}{'ph'} = ILLEGAL_PAIR;
    $digram{'rh'}{'rh'} = ILLEGAL_PAIR;
    $digram{'rh'}{'sh'} = ILLEGAL_PAIR;
    $digram{'rh'}{'th'} = ILLEGAL_PAIR;
    $digram{'rh'}{'wh'} = ILLEGAL_PAIR;
    $digram{'rh'}{'qu'} = ILLEGAL_PAIR;
    $digram{'rh'}{'ck'} = ILLEGAL_PAIR;

    $digram{'sh'}{'a'} = ANY_COMBINATION;
    $digram{'sh'}{'b'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'sh'}{'c'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'sh'}{'d'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'sh'}{'e'} = ANY_COMBINATION;
    $digram{'sh'}{'f'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'sh'}{'g'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'sh'}{'h'} = ILLEGAL_PAIR;
    $digram{'sh'}{'i'} = ANY_COMBINATION;
    $digram{'sh'}{'j'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'sh'}{'k'} = NOT_FRONT;
    $digram{'sh'}{'l'} = FRONT | SUFFIX | NOT_BACK;
    $digram{'sh'}{'m'} = FRONT | SUFFIX | NOT_BACK;
    $digram{'sh'}{'n'} = FRONT | SUFFIX | NOT_BACK;
    $digram{'sh'}{'o'} = ANY_COMBINATION;
    $digram{'sh'}{'p'} = NOT_FRONT;
    $digram{'sh'}{'r'} = FRONT | SUFFIX | NOT_BACK;
    $digram{'sh'}{'s'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'sh'}{'t'} = SUFFIX;
    $digram{'sh'}{'u'} = ANY_COMBINATION;
    $digram{'sh'}{'v'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'sh'}{'w'} = SUFFIX | NOT_BACK;
    $digram{'sh'}{'x'} = ILLEGAL_PAIR;
    $digram{'sh'}{'y'} = ANY_COMBINATION;
    $digram{'sh'}{'z'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'sh'}{'ch'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'sh'}{'gh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'sh'}{'ph'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'sh'}{'rh'} = ILLEGAL_PAIR;
    $digram{'sh'}{'sh'} = ILLEGAL_PAIR;
    $digram{'sh'}{'th'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'sh'}{'wh'} = ILLEGAL_PAIR;
    $digram{'sh'}{'qu'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'sh'}{'ck'} = ILLEGAL_PAIR;

    $digram{'th'}{'a'} = ANY_COMBINATION;
    $digram{'th'}{'b'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'th'}{'c'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'th'}{'d'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'th'}{'e'} = ANY_COMBINATION;
    $digram{'th'}{'f'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'th'}{'g'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'th'}{'h'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'th'}{'i'} = ANY_COMBINATION;
    $digram{'th'}{'j'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'th'}{'k'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'th'}{'l'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'th'}{'m'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'th'}{'n'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'th'}{'o'} = ANY_COMBINATION;
    $digram{'th'}{'p'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'th'}{'r'} = NOT_BACK;
    $digram{'th'}{'s'} = NOT_FRONT | BACK;
    $digram{'th'}{'t'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'th'}{'u'} = ANY_COMBINATION;
    $digram{'th'}{'v'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'th'}{'w'} = SUFFIX | NOT_BACK;
    $digram{'th'}{'x'} = ILLEGAL_PAIR;
    $digram{'th'}{'y'} = ANY_COMBINATION;
    $digram{'th'}{'z'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'th'}{'ch'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'th'}{'gh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'th'}{'ph'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'th'}{'rh'} = ILLEGAL_PAIR;
    $digram{'th'}{'sh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'th'}{'th'} = ILLEGAL_PAIR;
    $digram{'th'}{'wh'} = ILLEGAL_PAIR;
    $digram{'th'}{'qu'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'th'}{'ck'} = ILLEGAL_PAIR;

    $digram{'wh'}{'a'} = FRONT | NOT_BACK;
    $digram{'wh'}{'b'} = ILLEGAL_PAIR;
    $digram{'wh'}{'c'} = ILLEGAL_PAIR;
    $digram{'wh'}{'d'} = ILLEGAL_PAIR;
    $digram{'wh'}{'e'} = FRONT | NOT_BACK;
    $digram{'wh'}{'f'} = ILLEGAL_PAIR;
    $digram{'wh'}{'g'} = ILLEGAL_PAIR;
    $digram{'wh'}{'h'} = ILLEGAL_PAIR;
    $digram{'wh'}{'i'} = FRONT | NOT_BACK;
    $digram{'wh'}{'j'} = ILLEGAL_PAIR;
    $digram{'wh'}{'k'} = ILLEGAL_PAIR;
    $digram{'wh'}{'l'} = ILLEGAL_PAIR;
    $digram{'wh'}{'m'} = ILLEGAL_PAIR;
    $digram{'wh'}{'n'} = ILLEGAL_PAIR;
    $digram{'wh'}{'o'} = FRONT | NOT_BACK;
    $digram{'wh'}{'p'} = ILLEGAL_PAIR;
    $digram{'wh'}{'r'} = ILLEGAL_PAIR;
    $digram{'wh'}{'s'} = ILLEGAL_PAIR;
    $digram{'wh'}{'t'} = ILLEGAL_PAIR;
    $digram{'wh'}{'u'} = ILLEGAL_PAIR;
    $digram{'wh'}{'v'} = ILLEGAL_PAIR;
    $digram{'wh'}{'w'} = ILLEGAL_PAIR;
    $digram{'wh'}{'x'} = ILLEGAL_PAIR;
    $digram{'wh'}{'y'} = FRONT | NOT_BACK;
    $digram{'wh'}{'z'} = ILLEGAL_PAIR;
    $digram{'wh'}{'ch'} = ILLEGAL_PAIR;
    $digram{'wh'}{'gh'} = ILLEGAL_PAIR;
    $digram{'wh'}{'ph'} = ILLEGAL_PAIR;
    $digram{'wh'}{'rh'} = ILLEGAL_PAIR;
    $digram{'wh'}{'sh'} = ILLEGAL_PAIR;
    $digram{'wh'}{'th'} = ILLEGAL_PAIR;
    $digram{'wh'}{'wh'} = ILLEGAL_PAIR;
    $digram{'wh'}{'qu'} = ILLEGAL_PAIR;
    $digram{'wh'}{'ck'} = ILLEGAL_PAIR;

    $digram{'qu'}{'a'} = ANY_COMBINATION;
    $digram{'qu'}{'b'} = ILLEGAL_PAIR;
    $digram{'qu'}{'c'} = ILLEGAL_PAIR;
    $digram{'qu'}{'d'} = ILLEGAL_PAIR;
    $digram{'qu'}{'e'} = ANY_COMBINATION;
    $digram{'qu'}{'f'} = ILLEGAL_PAIR;
    $digram{'qu'}{'g'} = ILLEGAL_PAIR;
    $digram{'qu'}{'h'} = ILLEGAL_PAIR;
    $digram{'qu'}{'i'} = ANY_COMBINATION;
    $digram{'qu'}{'j'} = ILLEGAL_PAIR;
    $digram{'qu'}{'k'} = ILLEGAL_PAIR;
    $digram{'qu'}{'l'} = ILLEGAL_PAIR;
    $digram{'qu'}{'m'} = ILLEGAL_PAIR;
    $digram{'qu'}{'n'} = ILLEGAL_PAIR;
    $digram{'qu'}{'o'} = ANY_COMBINATION;
    $digram{'qu'}{'p'} = ILLEGAL_PAIR;
    $digram{'qu'}{'r'} = ILLEGAL_PAIR;
    $digram{'qu'}{'s'} = ILLEGAL_PAIR;
    $digram{'qu'}{'t'} = ILLEGAL_PAIR;
    $digram{'qu'}{'u'} = ILLEGAL_PAIR;
    $digram{'qu'}{'v'} = ILLEGAL_PAIR;
    $digram{'qu'}{'w'} = ILLEGAL_PAIR;
    $digram{'qu'}{'x'} = ILLEGAL_PAIR;
    $digram{'qu'}{'y'} = ILLEGAL_PAIR;
    $digram{'qu'}{'z'} = ILLEGAL_PAIR;
    $digram{'qu'}{'ch'} = ILLEGAL_PAIR;
    $digram{'qu'}{'gh'} = ILLEGAL_PAIR;
    $digram{'qu'}{'ph'} = ILLEGAL_PAIR;
    $digram{'qu'}{'rh'} = ILLEGAL_PAIR;
    $digram{'qu'}{'sh'} = ILLEGAL_PAIR;
    $digram{'qu'}{'th'} = ILLEGAL_PAIR;
    $digram{'qu'}{'wh'} = ILLEGAL_PAIR;
    $digram{'qu'}{'qu'} = ILLEGAL_PAIR;
    $digram{'qu'}{'ck'} = ILLEGAL_PAIR;

    $digram{'ck'}{'a'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ck'}{'b'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ck'}{'c'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ck'}{'d'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ck'}{'e'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ck'}{'f'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ck'}{'g'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ck'}{'h'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ck'}{'i'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ck'}{'j'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ck'}{'k'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ck'}{'l'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ck'}{'m'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ck'}{'n'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ck'}{'o'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ck'}{'p'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ck'}{'r'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ck'}{'s'} = NOT_FRONT;
    $digram{'ck'}{'t'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ck'}{'u'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ck'}{'v'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ck'}{'w'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ck'}{'x'} = ILLEGAL_PAIR;
    $digram{'ck'}{'y'} = NOT_FRONT;
    $digram{'ck'}{'z'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ck'}{'ch'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ck'}{'gh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ck'}{'ph'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ck'}{'rh'} = ILLEGAL_PAIR;
    $digram{'ck'}{'sh'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ck'}{'th'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ck'}{'wh'} = ILLEGAL_PAIR;
    $digram{'ck'}{'qu'} = NOT_FRONT | BREAK | NOT_BACK;
    $digram{'ck'}{'ck'} = ILLEGAL_PAIR;

    ##############################################################################################
    # } END DIGRAM
    ##############################################################################################



sub report(@) {
    $main::DEBUG and print @_;
}




=head2 word

  word = word( minlen, maxlen );
  ( word, hyphenated_form ) = word( minlen, maxlen );

Generates a random word, as well as its hyphenated form.
The length of the returned word will be between minlen and maxlen.  

=cut

sub word($$) {
    @_ > 2 and shift;
    my( $minlen, $maxlen ) = @_;

    $minlen <= $maxlen or die "minlen $minlen is greater than maxlen $maxlen";

    init();

    # 
    # Check for zero length words.  This is technically not an error,
    # so we take the short cut and return empty words.
    #
    $maxlen or return wantarray ? ('','') : '';

    my( $word, $hyphenated_word );

    for ( my $try = 1 ; $try <= MAX_UNACCEPTABLE and not defined $word; $try++ ) {
         ( $word, $hyphenated_word ) = _random_word( rand_int_in_range( $minlen, $maxlen ) );
         $word = restrict( $word );
    }

    $word or die "failed to generate an acceptable random password.\n";

    return wantarray ? ( $word, $hyphenated_word ) : $word;
}


=head2 letters

  word = letters( minlen, maxlen );

Generates a string of random letters.
The length of the returned word is between minlen and maxlen.  
Calls C<random_chars_in_range( 'a' => 'z' )>.

=cut

sub letters($$) {
    @_ > 2 and shift;
    my( $minlen, $maxlen ) = @_;
    random_chars_in_range( $minlen, $maxlen, 'a' => 'z' ); # range of lowercase letters in ASCII
}


=head2 chars

  word = chars( minlen, maxlen );

Generates a string of random printable characters.
The length of the returned word is between minlen and maxlen.  
Calls C<random_chars_in_range( '!' => '~' )>.

=cut

sub chars($$) {
    @_ > 2 and shift;
    my( $minlen, $maxlen ) = @_;
    random_chars_in_range( $minlen, $maxlen, '!' => '~' ); # range of printable chars in ASCII
}



=head2 random_chars_in_range

  word = random_chars_in_range( minlen, maxlen, lo_char => hi_char );
  
Generates a string of printable characters.
The length of the returned string is between minlen and maxlen.  
Each character is selected from the range of ASCII characters
delimited by (lo_char,hi_char).

=cut

sub random_chars_in_range($$$$) {
     my( $minlen, $maxlen, $lo_char, $hi_char ) = @_;

     $minlen <= $maxlen or die "minlen $minlen is greater than maxlen $maxlen";

     init();

     my $string_size = rand_int_in_range( $minlen, $maxlen );

     my $string;
     for ( my $try = 1 ; $try <= MAX_UNACCEPTABLE and not defined $string; $try++ ) {
          my $s = '';
          while ( length($s) < $string_size ) {
              $s .= chr( rand_int_in_range( ord($lo_char), ord($hi_char) ) );
          }
          next if length($s) > $string_size;
          $string = restrict( $s );
     }

     $string
}



=head2 rand_int_in_range

  n = rand_int_in_range( min, max );

Returns an integer between min and max, inclusive.
Calls C<rng> like so:

  n = min + int( rng( max - min + 1 ) )

=cut

sub rand_int_in_range($$) {
    my( $min, $max ) = @_;
    $min + int( rng( $max - $min + 1 ) )
}


=head2 random_element

  e = random_element( \@elts )

Selects a random element from an array, which is passed by ref.

=cut

sub random_element($) {
    my $ar = shift;
    $ar->[ rand_int_in_range( 0, $#{$ar} ) ]
}



=head2 rng

  r = rng( n );

C<rng> is designed to have the same interface as the built-in C<rand> function.
The default implementation here is a simple wrapper around C<rand>,
which is typically a wrapper for some pseudo-random number function in the
underlying C library.

The reason for having this simple wrapper is so the user can
easily substitute a different random number generator if desired.
Since many rng's have the same interface as C<rand>, replacing C<rng()>
is as simple as

    {
        local $^W; # squelch sub redef warning.
        *Crypt::RandPasswd::rng = \&my_rng;
    }

See L<rand>.

=cut

sub rng($) {
  my $x = shift;
  rand($x)
}



=head2 restrict

  word = restrict( word );

A filter.  Returns the arg unchanged if it is allowable; returns undef if not.

The default version of C<restrict()> allows everything.
You may install a different form to implement other restrictions,
by doing something like this:

    {
      local $^W; # squelch sub redef warning.
      *Crypt::RandPasswd::restrict = \&my_filter;
    }

=cut

sub restrict($) { $_[0] } # MUST return a real scalar; returning @_ causes scalar(@_) !!!


=head2 init

This initializes the environment, which by default simply seeds the random number generator.

=cut

# can be called multiple times without harm, since it remembers whether
# it has already been called.

sub init() {
    unless ( $Crypt::RandPasswd::initialized )  {
        # only do stuff if I haven't already been called before.

        $Crypt::RandPasswd::initialized = 1;
        if ( defined $Crypt::RandPasswd::seed ) {
            srand( $Crypt::RandPasswd::seed );
        }
        else {
            srand; # use default, which can be pretty good.
        }
    }
}




=head2 _random_word

This is the routine that returns a random word.
It collects random syllables until a predetermined word length is found. 
If a retry threshold is reached, another word is tried.  

returns ( word, hyphenated_word ).

=cut

sub _random_word($) {
    my( $pwlen ) = @_;

    my $word = '';
    my @word_syllables;

    my $max_retries = ( 4 * $pwlen ) + scalar( @grams );

    my $tries = 0;       # count of retries.


    # @word_units used to be an array of indices into the 'rules' C-array.
    # now it's an array of actual units (grams).
    my @word_units; 

    #
    # Find syllables until the entire word is constructed.
    #
    while ( length($word) < $pwlen ) {
        #
        # Get the syllable and find its length.
        #
        report "About to call get_syllable( $pwlen - length($word) )\n";
        my( $new_syllable, @syllable_units ) = get_syllable( $pwlen - length($word) );
        report "get_syllable returned ( $new_syllable; @syllable_units )\n";

        # 
        # If the word has been improperly formed, throw out
        # the syllable.  The checks performed here are those
        # that must be formed on a word basis.  The other
        # tests are performed entirely within the syllable.
        # Otherwise, append the syllable to the word.
        #
        unless (
             _improper_word( @word_units, @syllable_units ) # join the arrays
             ||
             (
                 $word eq ''
                 and
                 _have_initial_y( @syllable_units )
             )
             ||
             (
                 length( $word . $new_syllable ) == $pwlen
                 and
                 _have_final_split( @syllable_units )
             )
        ) {
             $word .= $new_syllable;
             push @word_syllables, $new_syllable;
        }

        # 
        # Keep track of the times we have tried to get syllables.  
        # If we have exceeded the threshold, start from scratch.
        #
        $tries++;
        if ( $tries > $max_retries ) {
            $tries = 0;
            $word = '';
            @word_syllables = ();
            @word_units = ();
        }
    }

    return( $word, join('-',@word_syllables) );
}



=head2 _random_unit

Selects a gram (aka "unit").
This is the standard random unit generating routine for get_syllable().  

This routine attempts to return grams (units) with a distribution
approaching that of the distribution of the units in English. 

The distribution of the units may be altered in this procedure without
affecting the digram table or any other programs using the random_word subroutine,
as long as the set of grams (units) is kept consistent throughout this library.

I<NOTE that where this func used to return a numeric index into
the 'rules' C-array, it now returns a gram.>

=cut

my %occurrence_frequencies = (
    'a'  => 10,      'b'  =>  8,      'c'  => 12,      'd'  => 12,      
    'e'  => 12,      'f'  =>  8,      'g'  =>  8,      'h'  =>  6,      
    'i'  => 10,      'j'  =>  8,      'k'  =>  8,      'l'  =>  6,      
    'm'  =>  6,      'n'  => 10,      'o'  => 10,      'p'  =>  6,      
    'r'  => 10,      's'  =>  8,      't'  => 10,      'u'  =>  6,      
    'v'  =>  8,      'w'  =>  8,      'x'  =>  1,      'y'  =>  8,      
    'z'  =>  1,      'ch' =>  1,      'gh' =>  1,      'ph' =>  1,      
    'rh' =>  1,      'sh' =>  2,      'th' =>  1,      'wh' =>  1,      
    'qu' =>  1,      'ck' =>  1,      
);

my @numbers = map {
  ( ($_) x $occurrence_frequencies{$_} )
} @grams;

my @vowel_numbers = map {
  ( ($_) x $occurrence_frequencies{$_} )
} @vowel_grams;



sub _random_unit($) {
    my $type = shift; # byte

    random_element( $type & VOWEL
        ? \@vowel_numbers # Sometimes, we are asked to explicitly get a vowel (i.e., if
                          # a digram pair expects one following it).  This is a shortcut
                          # to do that and avoid looping with rejected consonants.

        : \@numbers       # Get any letter according to the English distribution.
    )
}




=head2 _improper_word

Check that the word does not contain illegal combinations
that may span syllables.  Specifically, these are:

  1. An illegal pair of units between syllables.
  2. Three consecutive vowel units.
  3. Three consecutive consonant units.

The checks are made against units (1 or 2 letters), not against
the individual letters, so three consecutive units can have
the length of 6 at most.

returns boolean

=cut

sub _improper_word(@) {
    my @units = @_;

    my $failure; # bool, init False.

    for my $unit_count ( 0 .. $#units ) {
        # 
        # Check for ILLEGAL_PAIR. 
        # This should have been caught for units within a syllable,
        # but in some cases it would have gone unnoticed for units between syllables
        # (e.g., when saved units in get_syllable() were not used).
        #
        $unit_count > 0
            and $digram{$units[$unit_count-1]}{$units[$unit_count]} & ILLEGAL_PAIR
                and return(1); # Failure!

        next if $unit_count < 2;
        # 
        # Check for consecutive vowels or consonants. 
        # Because the initial y of a syllable is treated as a consonant rather
        # than as a vowel, we exclude y from the first vowel in the vowel test.  
        # The only problem comes when y ends a syllable and two other vowels start the next, like fly-oint.  
        # Since such words are still pronounceable, we accept this.
        #
            #
            # Vowel check.
            #
            (
                ($rules{$units[$unit_count - 2]} & VOWEL)
            &&
               !($rules{$units[$unit_count - 2]} & ALTERNATE_VOWEL)
            &&
                ($rules{$units[$unit_count - 1]} & VOWEL)
            &&
                ($rules{$units[$unit_count    ]} & VOWEL)
            )
                ||
            #
            # Consonant check.
            #
            (
               !($rules{$units[$unit_count - 2]} & VOWEL)
            &&
               !($rules{$units[$unit_count - 1]} & VOWEL)
            &&
               !($rules{$units[$unit_count    ]} & VOWEL)
            ) 
                and return(1); # Failure!
    }

    0 # success
}


=head2 _have_initial_y

Treating y as a vowel is sometimes a problem.  Some words get formed that look irregular.  
One special group is when y starts a word and is the only vowel in the first syllable.
The word ycl is one example.  We discard words like these.

return boolean

=cut

sub _have_initial_y(@) {
    my @units = @_;

    my $vowel_count = 0;
    my $normal_vowel_count = 0;

    for my $unit_count ( 0 .. $#units ) {
        #
        # Count vowels.
        #
        if ( $rules{$units[$unit_count]} & VOWEL ) {
            $vowel_count++;

            #
            # Count the vowels that are not:
            #  1. 'y'
            #  2. at the start of the word.
            #
            if ( !($rules{$units[$unit_count]} & ALTERNATE_VOWEL) || ($unit_count > 0) ) {
                $normal_vowel_count++;
           }
        }
    }

    ($vowel_count <= 1) && ($normal_vowel_count == 0)
}


=head2 _have_final_split

Besides the problem with the letter y, there is one with
a silent e at the end of words, like face or nice. 
We allow this silent e, but we do not allow it as the only
vowel at the end of the word or syllables like ble will
be generated.

returns boolean

=cut

sub _have_final_split(@) {
    my @units = @_;

    my $vowel_count = 0;

    #
    # Count all the vowels in the word.
    #
    for my $unit_count ( 0 .. $#units ) {
        if ( $rules{$units[$unit_count]} & VOWEL ) {
            $vowel_count++;
        }
    }

    #
    # Return TRUE iff the only vowel was e, found at the end if the word.
    #
    ($vowel_count == 1) && ( $rules{$units[$#units]} & NO_FINAL_SPLIT )
}


=head2 get_syllable

Generate next unit to password, making sure that it follows these rules:

1. Each syllable must contain exactly 1 or 2 consecutive vowels, where y is considered a vowel.

2. Syllable end is determined as follows:

   a. Vowel is generated and previous unit is a consonant and syllable already has a vowel. 
      In this case, new syllable is started and already contains a vowel.
   b. A pair determined to be a "break" pair is encountered. 
      In this case new syllable is started with second unit of this pair.
   c. End of password is encountered.
   d. "begin" pair is encountered legally.  New syllable is started with this pair.
   e. "end" pair is legally encountered.  New syllable has nothing yet.

3. Try generating another unit if:

   a. third consecutive vowel and not y.
   b. "break" pair generated but no vowel yet in current or previous 2 units are "not_end".
   c. "begin" pair generated but no vowel in syllable preceding begin pair,
      or both previous 2 pairs are designated "not_end".
   d. "end" pair generated but no vowel in current syllable or in "end" pair.
   e. "not_begin" pair generated but new syllable must begin (because previous syllable ended as defined in 2 above).
   f. vowel is generated and 2a is satisfied, but no syllable break is possible in previous 3 pairs.
   g. Second and third units of syllable must begin, and first unit is "alternate_vowel".


=cut

# global (like a C static)
use vars qw( @saved_pair );
@saved_pair = (); # 0..2 elements, which are units (grams).

sub get_syllable($) {
    my $pwlen = shift;

    # these used to be "out" params:
    my $syllable;               # string, returned
    my @units_in_syllable = (); # array of units, returned


    # grams:
    my $unit;
    my $current_unit;
    my $last_unit;

    # numbers:
    my $vowel_count;
    my $tries;
    my $length_left;

    # flags:
    my $rule_broken;
    my $want_vowel;
    my $want_another_unit;


    #
    # This is needed if the saved_pair is tried and the syllable then
    # discarded because of the retry limit. Since the saved_pair is OK and
    # fits in nicely with the preceding syllable, we will always use it.
    #
    my @hold_saved_pair = @saved_pair;

    my $max_retries = ( 4 * $pwlen ) + scalar( @grams );
    # note that this used to be a macro, which means it could have changed
    # dynamically based on the value of $pwlen...

    #
    # Loop until valid syllable is found.
    #
    do {
        # 
        # Try for a new syllable.  Initialize all pertinent
        # syllable variables.
        #
        $tries = 0;
        @saved_pair = @hold_saved_pair;
        $syllable = "";
        $vowel_count = 0;
        $current_unit = 0;
        $length_left = $pwlen;
        $want_another_unit = 1; # true

        #
        # This loop finds all the units for the syllable.
        #
        do {
            $want_vowel = 0; # false

            #
            # This loop continues until a valid unit is found for the
            # current position within the syllable.
            #
            do {
                # 
                # If there are saved units from the previous syllable, use them up first.
                #

                # 
                # If there were two saved units, the first is guaranteed
                # (by checks performed in the previous syllable) to be valid.
                # We ignore the checks and place it in this syllable manually.
                #
                if ( @saved_pair == 2 ) {
                    $syllable = 
                    $units_in_syllable[0] = pop @saved_pair;
                    $vowel_count++  if $rules{$syllable} & VOWEL;
                    $current_unit++;
                    $length_left -= length $syllable;
                }

                if ( @saved_pair ) {
                    # 
                    # The unit becomes the last unit checked in the previous syllable.
                    #
                    $unit = pop @saved_pair;

                    #
                    # The saved units have been used. 
                    # Do not try to reuse them in this syllable
                    # (unless this particular syllable is rejected
                    # at which point we start to rebuild it with these same saved units).
                    #
                }
                else {
                    # 
                    # If we don't have to consider the saved units, we generate a random one. 
                    #
                    $unit = _random_unit( $want_vowel ? VOWEL : NO_SPECIAL_RULE );
                }

                $length_left -= length $unit;

                #
                # Prevent having a word longer than expected.
                #
                $rule_broken = ( $length_left < 0 ); # boolean

                #
                # First unit of syllable. 
                # This is special because the digram tests require 2 units and we don't have that yet.
                # Nevertheless, we can perform some checks.
                #
                if ( $current_unit == 0 ) {
                    # 
                    # If the shouldn't begin a syllable, don't use it.
                    #
                    if ( $rules{$unit} & NOT_BEGIN_SYLLABLE ) {
                        $rule_broken = 1; # true
                        # 
                        # If this is the last unit of a word, we have a one unit syllable.
                        # Since each syllable must have a vowel, we make sure the unit is a vowel.
                        # Otherwise, we discard it.
                        #
                    }
                    elsif ( $length_left == 0 ) {
                        if ( $rules{$unit} & VOWEL ) {
                            $want_another_unit = 0; # false
                        }
                        else {
                            $rule_broken = 1; # true
                        }
                    }
                }
                else {
#
# this ALLOWED thing is only used in this code block.
# note that $unit and $current_unit are (used to be) numeric indices; should now be actual grams.
#
local *ALLOWED = sub {
  my $flag = shift;
  $digram{$units_in_syllable[$current_unit-1]}{$unit} & $flag
};

                    # 
                    # There are some digram tests that are universally true.  We test them out.
                    #

                    if (
                        #
                        # Reject ILLEGAL_PAIRS of units.
                        #
                        (ALLOWED(ILLEGAL_PAIR))
                    ||

                        #
                        # Reject units that will be split between syllables
                        # when the syllable has no vowels in it.
                        #
                        (ALLOWED(BREAK) && ($vowel_count == 0))
                    ||

                        #
                        # Reject a unit that will end a syllable when no
                        # previous unit was a vowel and neither is this one.
                        #
                        (
                            ALLOWED(BACK)
                        &&
                            ($vowel_count == 0)
                        &&
                            !($rules{$unit} & VOWEL)
                        )
                    ) {
                        $rule_broken = 1; # true
                    }

                    if ($current_unit == 1) {
                        #
                        # Reject the unit if we are at te starting digram of
                        # a syllable and it does not fit.
                        #
                        if (ALLOWED(NOT_FRONT)) {
                            $rule_broken = 1; # true
                        }
                    }
                    else {
                        # 
                        # We are not at the start of a syllable.
                        # Save the previous unit for later tests.
                        #
                        $last_unit = $units_in_syllable[$current_unit - 1];

                        #
                        # Do not allow syllables where the first letter is y
                        # and the next pair can begin a syllable.  This may
                        # lead to splits where y is left alone in a syllable.
                        # Also, the combination does not sound to good even
                        # if not split.
                        #
                        if (
                            (
                                ($current_unit == 2)
                            &&
                                ALLOWED(FRONT)
                            &&
                                ($rules{$units_in_syllable[0]} & ALTERNATE_VOWEL)
                            )
                        ||

                            #
                            # If this is the last unit of a word, we should
                            # reject any digram that cannot end a syllable.
                            #
                            (
                                ALLOWED(NOT_BACK)
                            &&
                                ($length_left == 0)
                            )
                        ||

                            #
                            # Reject the unit if the digram it forms wants
                            # to break the syllable, but the resulting
                            # digram that would end the syllable is not
                            # allowed to end a syllable.
                            #
                            (
                                ALLOWED(BREAK)
                            ||
                                ($digram{ $units_in_syllable[$current_unit-2] }{$last_unit} & NOT_BACK)
                            )
                        ||

                            #
                            # Reject the unit if the digram it forms expects a vowel preceding it and there is none.
                            #
                            (
                                ALLOWED(PREFIX)
                            &&
                                !($rules{ $units_in_syllable[$current_unit-2] } & VOWEL)
                            )
                        ) {
                            $rule_broken = 1; # true
                        }

                        #
                        # The following checks occur when the current unit is a vowel
                        # and we are not looking at a word ending with an e.
                        #
                        if (
                            !$rule_broken
                        &&
                            ($rules{$unit} & VOWEL)
                        &&
                            (
                                ($length_left > 0)
                            ||
                                !($rules{$last_unit} & NO_FINAL_SPLIT)
                            )
                        ) {
                            #
                            # Don't allow 3 consecutive vowels in a syllable. 
                            # Although some words formed like this are OK, like "beau", most are not.
                            #
                            if ( ($vowel_count > 1) && ($rules{$last_unit} & VOWEL) ) {
                                $rule_broken = 1; # true
                            }
                            #
                            # Check for the case of vowels-consonants-vowel,
                            # which is only legal if the last vowel is an e and we are the end of the word
                            # (which is not happening here due to a previous check).
                            #
                            elsif ( ($vowel_count != 0) && !($rules{$last_unit} & VOWEL) ) {
                                #
                                # Try to save the vowel for the next syllable,
                                # but if the syllable left here is not proper
                                # (i.e., the resulting last digram cannot legally end it),
                                # just discard it and try for another.
                                #
                                if ( $digram{ $units_in_syllable[ $current_unit - 2] }{$last_unit} & NOT_BACK ) {
                                    $rule_broken = 1; # true
                                }
                                else {
                                    @saved_pair = ( $unit );
                                    $want_another_unit = 0; # false
                                }
                            }
                        }
                    }

                    #
                    # The unit picked and the digram formed are legal.
                    # We now determine if we can end the syllable.  It may,
                    # in some cases, mean the last unit(s) may be deferred to
                    # the next syllable.  We also check here to see if the
                    # digram formed expects a vowel to follow.
                    #
                    if ( !$rule_broken and $want_another_unit ) {
                        #
                        # This word ends in a silent e.
                        #
                        if (
                            (
                                ($vowel_count != 0)
                            &&
                                ($rules{$unit} & NO_FINAL_SPLIT)
                            &&
                                ($length_left == 0)
                            &&
                                !($rules{$last_unit} & VOWEL)
                            )
                        or

                            #
                            # This syllable ends either because the digram
                            # is a BACK pair or we would otherwise exceed
                            # the length of the word.
                            #
                            ( ALLOWED(BACK) || ($length_left == 0) )
                        ) {
                            $want_another_unit = 0; # false
                        }

                        #
                        # Since we have a vowel in the syllable
                        # already, if the digram calls for the end of the
                        # syllable, we can legally split it off. We also
                        # make sure that we are not at the end of the
                        # dangerous because that syllable may not have
                        # vowels, or it may not be a legal syllable end,
                        # and the retrying mechanism will loop infinitely
                        # with the same digram.
                        #
                        elsif ( $vowel_count != 0 and $length_left > 0 ) {
                            #
                            # If we must begin a syllable, we do so if
                            # the only vowel in THIS syllable is not part
                            # of the digram we are pushing to the next
                            # syllable.
                            #
                            if (
                                ALLOWED(FRONT)
                            &&
                                ($current_unit > 1)
                            &&
                                !(
                                    ($vowel_count == 1)
                                &&
                                    ($rules{$last_unit} & VOWEL)
                                )
                            ) {
                                @saved_pair = ( $unit, $last_unit );
                                $want_another_unit = 0; # false
                            }
                            elsif (ALLOWED (BREAK)) {
                                @saved_pair = ( $unit );
                                $want_another_unit = 0; # false
                            }
                        }
                        elsif (ALLOWED (SUFFIX)) {
                            $want_vowel = 1; # true
                        }
                    }
                }

                $tries++;

                #
                # If this unit was illegal, redetermine the amount of
                # letters left to go in the word.
                #
                if ( $rule_broken ) {
                    $length_left += length $unit;
                }
            }
            while ( $rule_broken and $tries <= $max_retries );

            #
            # The unit fit OK.
            #
            if ( $tries <= $max_retries ) {
                #
                # If the unit were a vowel, count it in.
                # However, if the unit were a y and appear at the start of the syllable,
                # treat it like a constant (so that words like "year" can appear and
                # not conflict with the 3 consecutive vowel rule).
                #
                if (
                    ($rules{$unit} & VOWEL)
                &&
                    ( ($current_unit > 0) || !($rules{$unit} & ALTERNATE_VOWEL) )
                ) {
                    $vowel_count++;
                }

                #
                # If a unit or units were to be saved, we must adjust the syllable formed. 
                # Otherwise, we append the current unit to the syllable.
                #
                if ( @saved_pair == 2 ) {
                    # strcpy( &syllable[ strlen( syllable ) - strlen( last_unit ) ], "" );
                    my $n = length $last_unit;
                    $syllable =~ s/.{$n}$//; # DOES THIS WORK?
                    $length_left += length $last_unit;
                    $current_unit -= 2;
                }
                elsif ( @saved_pair == 1 ) {
                    $current_unit--;
                }
                else {
                    $units_in_syllable[ $current_unit ] = $unit;
                    $syllable .= $unit;
                }
            }
            else {
                #
                # Whoops!  Too many tries. 
                # We set rule_broken so we can loop in the outer loop and try another syllable.
                #
                $rule_broken = 1; # true
            }

            $current_unit++;
        }
        while ( $tries <= $max_retries and $want_another_unit );
    }
    while ( $rule_broken or _illegal_placement( @units_in_syllable ) );

    return( $syllable, @units_in_syllable );
} # sub get_syllable



=head2 alt_get_syllable

Takes an integer, the maximum number of chars to generate. (or is it minimum?)

returns a list of ( string, units-in-syllable )

I<This is an alternative version of C<get_syllable()>, which
can be useful for unit testing the other functions.>

=cut

sub alt_get_syllable($) { # alternative version, has no smarts.
   my $pwlen = shift; # max or min?
   for ( 0 .. $#grams ) {
       my $syl = '';
       my @syl_units = ();
       while ( @syl_units < 3 ) {
           my $unit = _random_unit( NO_SPECIAL_RULE );
           $syl .= $unit;
           push @syl_units, $unit;
           length($syl) >= $pwlen and return( $syl, @syl_units );
       }
       @syl_units and return( $syl, @syl_units );
   }
   return(); # failed
}


=head2 _illegal_placement

goes through an individual syllable and checks for illegal
combinations of letters that go beyond looking at digrams. 

We look at things like 3 consecutive vowels or consonants,
or syllables with consonants between vowels
(unless one of them is the final silent e).

returns boolean.

=cut

sub _illegal_placement(@) {
    my @units = @_;

    my $vowel_count = 0;
    my $failure = 0; # false

    for my $unit_count ( 0 .. $#units ) {
        last if $failure;

        if ( $unit_count >= 1 ) {
            #
            # Don't allow vowels to be split with consonants in a single syllable.
            # If we find such a combination (except for the silent e) we have to discard the syllable.
            #
            if (
                (
                    !( $rules{$units[$unit_count-1]} & VOWEL)
                 &&
                     ( $rules{$units[$unit_count  ]} & VOWEL)
                 &&
                    !(($rules{$units[$unit_count  ]} & NO_FINAL_SPLIT) && ($unit_count == $#units))
                 &&
                     $vowel_count
                 )
             ||

                 #
                 # Perform these checks when we have at least 3 units.
                 #
                 (
                     ($unit_count >= 2)
                 &&
                     (
                         #
                         # Disallow 3 consecutive consonants.
                         #
                         (
                             !($rules{$units[$unit_count-2]} & VOWEL)
                         &&
                             !($rules{$units[$unit_count-1]} & VOWEL)
                         &&
                             !($rules{$units[$unit_count  ]} & VOWEL)
                         )
                     ||

                         #
                         # Disallow 3 consecutive vowels, where the first is not a y.
                         #
                         (
                             ( $rules{$units[$unit_count-2]} & VOWEL)
                         &&
                            !(($rules{$units[0            ]} & ALTERNATE_VOWEL) && ($unit_count == 2))
                         &&
                             ( $rules{$units[$unit_count-1]} & VOWEL)
                         &&
                             ( $rules{$units[$unit_count  ]} & VOWEL)
                         )
                     )
                 )
             ) {
                 $failure = 1; # true
             }
        }

        #
        # Count the vowels in the syllable. 
        # As mentioned somewhere above, exclude the initial y of a syllable. 
        # Instead, treat it as a consonant.
        #
        if (
            ($rules{$units[$unit_count]} & VOWEL)
        &&
            !(
                ($rules{$units[0]} & ALTERNATE_VOWEL)
            &&
                ($unit_count == 0)
            &&
                (@units > 1)
            )
        ) {
            $vowel_count++;
        }
    }

    $failure;
}

}

=head1 AUTHOR

JDPORTER@cpan.org (John Porter)

=head1 COPYRIGHT

This perl module is free software; it may be redistributed and/or modified 
under the same terms as Perl itself.

=cut

unless ( defined caller ) {

# this can be used for unit testing or to make the module a stand-alone program.
package main;
use Getopt::Long;

$^W = 1;

my $algorithm = 'word'; # default: word
my $maxlen = 8;
my $minlen = 6;
my $num_words = 1;
$main::DEBUG = 0;

GetOptions(
    'seed=s'        => \$Crypt::RandPasswd::seed,
    'algorithm=s'   => \$algorithm, # select word, letters, chars
    'max=s'         => \$maxlen,
    'min=s'         => \$minlen,
    'count=s'       => \$num_words,
    'debug!'        => \$main::DEBUG,
)
    or die "Usage: $0  --count N  --min N  --max N  --algorithm [word|letters|chars]  --seed N  --[no]debug \n";

$minlen <= $maxlen or die "minimum word length ($minlen) must be <= maximum ($maxlen)\n";

UNIVERSAL::can( "Crypt::RandPasswd", $algorithm ) or die "Invalid algorithm '$algorithm'\n";

print STDERR "$num_words '$algorithm' words of $minlen-$maxlen chars \n"
    if $main::DEBUG ;

for ( 1 .. $num_words ) {
    my( $unhyphenated_word, $hyphenated_word ) = Crypt::RandPasswd->$algorithm( $minlen, $maxlen );

    print
        $algorithm eq 'word' 
            ? "$unhyphenated_word ($hyphenated_word)\n"
            : "$unhyphenated_word\n";
}

} # end of 'main' code.

1;

