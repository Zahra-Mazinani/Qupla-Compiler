grammar Qupla;

INT:[0-9]+ | [Ii][Nn][Tt];
HEX:[0][xX][0-9a-fA-F]+;
FLOAT:[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+);
COMMENT:'%%%' .*? '%%%'|'%%' [.]|~[\r\n]*'%%' ;
NEWLINE : [\r\t\n]+ -> skip;

STRING :'"' ~[\r\n]*'"';

AND:'&'|'and';
OR:'|'|'or';
NOT : ('not');
XOR : ('xor');

PLUS:[+];
MINES :[-];
DIV : [/];
MUL : [*];
POWER : [^];
MODE : [%];
FACT : [!];

NOTEQ : ('<>');
ASSIGN : [=];
LESS : [<];
LESSEQ : ('<=');
GREATER : [>];
GREATEREQ : ('>=');

IF:[Ii][Ff];
THEN:[Tt][Hh][Ee][Nn];

BEGIN:[Bb][Ee][Gg][Ii][Nn];
END:[Ee][Nn][Dd];

WHILE:[Ww][Hh][Ii][Ll][Ee];

WRITE:[Ww][Rr][Ii][Tt][Ee];
READ:[Rr][Ee][Aa][Dd];

DOUBLE:[dD][oO][uU][Bb][Ll][Ee];
LONG:[Ll][oO][Nn][Gg];

RETURN:[Rr][Ee][Tt][uU][rR][Nn];

TRUE:[tT][rR][uU][eE];
FALSE:[fF][aA][Ll][sS][eE];

TAB: ([' ']+| '\\''t');
SPACE:(' ');

IDENTIFIER:[a-zA-Z][0-9a-zA-Z]*;
ERROR : .;