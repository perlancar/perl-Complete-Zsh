package Complete::Zsh;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(
                       parse_cmdline
                       format_completion
               );

require Complete::Bash;

our %SPEC;

$SPEC{':package'} = {
    v => 1.1,
    summary => 'Completion module for zsh shell',
};

$SPEC{format_completion} = {
    v => 1.1,
    summary => 'Format completion for output (for shell)',
    description => <<'_',

zsh accepts completion reply in the form of one entry per line to STDOUT.
Currently the formatting is done using `Complete::Bash`'s `format_completion`.

_
    args_as => 'array',
    args => {
        completion => {
            summary => 'Completion answer structure',
            description => <<'_',

Either an array or hash, as described in `Complete`.

_
            schema=>['any*' => of => ['hash*', 'array*']],
            req=>1,
            pos=>0,
        },
    },
    result => {
        summary => 'Formatted string (or array, if `as` key is set to `array`)',
        schema => ['any*' => of => ['str*', 'array*']],
    },
    result_naked => 1,
};
sub format_completion {
    Complete::Bash::format_completion(@_);
}

1;
#ABSTRACT:

=head1 DESCRIPTION

This module provides routines related to doing completion in zsh.


=head1 SEE ALSO

L<Complete>

L<Complete::Bash>, L<Complete::Fish>, L<Complete::Tcsh>.

zshcompctl manual page.

=cut
