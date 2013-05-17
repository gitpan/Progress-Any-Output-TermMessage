package Progress::Any::Output::TermMessage;

use 5.010001;
use strict;
use warnings;

our $VERSION = '0.01'; # VERSION

sub new {
    my ($class, %args) = @_;

    $args{template} //= "(%c/%C) %m";

    bless \%args, $class;
}

sub update {
    my ($self, %args) = @_;

    my $s = $args{indicator}->fill_template($self->{template}, %args);
    $s .= "\n" unless $s =~ /\n\z/;
    print $s;
}

1;
# ABSTRACT: Output progress to terminal as simple message


__END__
=pod

=head1 NAME

Progress::Any::Output::TermMessage - Output progress to terminal as simple message

=head1 VERSION

version 0.01

=head1 SYNOPSIS

 use Progress::Any::Output;
 Progress::Any::Output->set('TermMessage', template=>"[%t] (%c/%C) %m");

=head1 DESCRIPTION

This output displays progress indicators as messages on terminal.

=for Pod::Coverage ^(update)$

=head1 METHODS

=head2 new(%args) => OBJ

Instantiate. Usually called through C<<
Progress::Any::Output->set("TermMessage", %args) >>.

Known arguments:

=over

=item * template => STR (default: '(%c/%C) %m')

Will be used to do C<< $progress->fill_template() >>. See L<Progress::Any> for
supported template strings.

=back

=head1 SEE ALSO

L<Progress::Any>

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
