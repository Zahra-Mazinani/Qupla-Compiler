grammar Qupla;
parse:
block EOF
;
block:
module*
;
module:
MODULE ID INPUT DEFINE (vari_defining)+ OUTPUT DEFINE type SEMICOLON codeblock
|vari_defining
| MODULE ID codeblock1
;
codeblock:
BEGIN assignment END
|BEGIN if_stat END
|BEGIN write_state END
|BEGIN read_stat END
|BEGIN while_stat END
|BEGIN return_stat END
|BEGIN vari_defining END
;
codeblock1:
BEGIN assignment END
|BEGIN if_stat END
|BEGIN write_state END
|BEGIN read_stat END
|BEGIN while_stat END
|BEGIN vari_defining END
;

takstat:
assignment
|write_state
|read_stat
|vari_defining
;
assignment:
ID ASSIGN exp SEMICOLON
;

if_stat:
IF condition_block THEN code ELSE code
|IF condition_block THEN code
;

code:
codeblock
|takstat
;
while_stat:
WHILE exp code
;

vari_defining:
ID DEFINE type SEMICOLON  {print("vari_defining")}
;

type:
T_BOOL
|REAL
|T_STRING
;

write_state:
WRITE exp SEMICOLON
;
read_stat:
READ ID SEMICOLON
;        

exp:
INT
|FLOAT
|HEX
|ID 
|exp PLUS exp    {print(" exp plus");}  
|exp MINES exp    {print(" exp mines");} 
|exp MUL exp    {print(" exp mul");}
|exp DIV exp    {print(" exp div");}  
|exp POWER exp    {print(" exp power");}
|exp FACT   {print(" exp fact");}  
|exp MODE exp    {print(" exp mod");} 
|exp GREATER| GREATEREQ | LESS | LESSEQ |NOTEQ | ASSIGN  exp 
|exp XOR | OR| NOT | AND exp 
;


INT : [0-9]+ ;
HEX : [0][xX][0-9a-fA-F]+;
FLOAT:[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+);
REAL: [rR][Ee][Aa][Ll] ;

COMMENT:'%%%'.*? '%%%'|'%%'~[\r\n]*->skip ;

STRING :'"'~[\r\n]*'"';

AND:'&'|[aA][Nn][Dd];
OR:'|'|[oO][Rr];
NOT : ([Nn][oO][Tt]);
XOR : ([xX][oO][Rr]);

P_O:[(];
P_C:[)];
B_O:('[');
B_C:[\]];
A_O:[{];
A_C:[}];

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
DEFINE : (':');
COMMA : (',');

IF : [Ii][Ff];
THEN : [Tt][Hh][Ee][Nn];
ELSE: [eE][lL][Ss][eE];

BEGIN : [Bb][Ee][Gg][Ii][Nn];
END : [Ee][Nn][Dd];

WHILE : [Ww][Hh][Ii][Ll][Ee];
DO : [Dd][oO];
FOR : [Ff][oO][Rr];
BREAK : [Bb][Rr][Ee][Aa][Kk];
CONTINUE : [Cc][oO][Nn][Tt][Ii][Nn][uU][Ee];


WRITE : [Ww][Rr][Ii][Tt][Ee];
READ : [Rr][Ee][Aa][Dd];

T_DOUBLE : [dD][oO][uU][Bb][Ll][Ee];
T_LONG : [Ll][oO][Nn][Gg];
T_INT : [Ii][Nn][Tt];
T_FLOAT : [Ff][Ll][oO][Aa][Tt];
T_STRING : [sS][Tt][Rr][Ii][Nn][Gg];
T_BOOL : [Bb][Oo][Oo][Ll];
T_HEX : [Hh][Ee][xX];

VOID : [Vv][Oo][Ii][Dd];
INPUT:[Ii][Nn][Pp][Uu][Tt];
OUTPUT:[Oo][Uu][Tt][Pp][Uu][Tt];
RETURN : [Rr][Ee][Tt][uU][rR][Nn];
MODULE : [mM][oO][dD][Uu][Ll][Ee];


TRUE : [tT][rR][uU][eE];
FALSE : [fF][aA][Ll][sS][eE];

SEPERATOR : (' ')|[\r\n\t]*->skip;
SEMICOLON :(';');
ID : [a-zA-Z]SUBID?SUBID?SUBID?SUBID?SUBID?SUBID?SUBID?SUBID?SUBID?
        SUBID?SUBID?SUBID?SUBID?SUBID?SUBID?SUBID?SUBID?SUBID?SUBID?
        SUBID?SUBID?SUBID?SUBID?SUBID?SUBID?SUBID?SUBID?SUBID?SUBID?
        SUBID?SUBID?;

SUBID :[0-9a-zA-Z];

ERROR : .;