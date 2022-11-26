grammar Qupla;

INT:[0-9]+ ;
HEX:[0][xX][0-9a-fA-F]+;
FLOAT:[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+);

COMMENT:'%%%'.*? '%%%'|'%%'~[\r\n]*'%%' ;
NEWLINE : [\r\t\n]+ -> skip;

STRING :'"'~[\r\n]*'"';

AND:'&'|'and';
OR:'|'|[oO][Rr];
NOT : ([Nn][oO][Tt]);
XOR : ([xX][oO][Rr]);

P_O:'(';
P_C:')';
B_O:'[';
B_C:']';

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
DO:[Dd][oO];
FOR:[Ff][oO][Rr];
BREAK:[Bb][Rr][Ee][Aa][Kk];
CONTINUE:[Cc][oO][Nn][Tt][Ii][Nn][uU][Ee];

WRITE:[Ww][Rr][Ii][Tt][Ee];
READ:[Rr][Ee][Aa][Dd];

DOUBLE:[dD][oO][uU][Bb][Ll][Ee];
LONG:[Ll][oO][Nn][Gg];
T_INT : [Ii][Nn][Tt];
T_FLOAT:[Ff][Ll][oO][Aa][Tt];
T_STRING:[sS][Tt][Rr][Ii][Nn][Gg];

RETURN:[Rr][Ee][Tt][uU][rR][Nn];

TRUE:[tT][rR][uU][eE];
FALSE:[fF][aA][Ll][sS][eE];

TAB: ([' ']+| '\\''t');
SPACE:(' ');
SEPERATOR:[;];

IDENTIFIER:[_]*[a-zA-Z][0-9a-zA-Z]*;
ERROR : .;