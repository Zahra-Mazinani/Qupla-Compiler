grammar Qupla_deb;

prog:
block EOF
;

block:
(module|vari_defining|COMMENT)*
;

module:
MODULE ID INPUT DEFINE  (vari_defining)+ OUTPUT DEFINE type SEPERATOR codeblock
|MODULE ID codeblock1
|vari_defining
|ERROR   {print("structure ERROR")}
;


assignment:
ID ASSIGN exp SEPERATOR
|ERROR  {print(" assignment ERROR")} 
;

vari_defining:
ID DEFINE type SEPERATOR
|ERROR  {print(" DEFINE ERROR")} 
;

type:
T_BOOL
|T_STRING
|T_REAL
|ERROR  {print(" type ERROR")} 
;

codeblock:
BEGIN ( ((vari_defining) | (assignment)|(print) | (reading) |(ifthen) |(loop)| (return_value)|COMMENT|(sub_block ))* ) END
|ERROR  {print(" codeblock ERROR")} 
;

codeblock1:
BEGIN ( ((vari_defining) | (assignment)|(print) | (reading) |(ifthen) |(loop)|COMMENT|(sub_block1 )) *)END
|ERROR  {print(" codeblock1 ERROR")} 
;


 sub_block:
 BEGIN ( ((vari_defining) | (assignment)|(print) | (reading) |(ifthen) |(loop)| (return_value)|COMMENT)* ) END
|ERROR  {print(" codeblock ERROR")} 
;

sub_block1:
 BEGIN ( ((vari_defining) | (assignment)|(print) | (reading) |(ifthen) |(loop)|COMMENT)* ) END
|ERROR  {print(" s_block1 ERROR")} 
;


print:
WRITE exp SEPERATOR
;

reading:
READ ID SEPERATOR
|ERROR  {print(" unreadble ERROR")} 
;

return_value:
RETURN exp SEPERATOR

;

ifthen:
IF exp THEN code ELSE code 
|IF exp THEN code
;

code:
print
|reading
|return_value
|ifthen
|loop
|assignment
|codeblock
;

loop:
WHILE exp code
;

exp:
REAL
|INT
|BOOL
|STRING
|ID 
|exp POWER exp    {print(" exp power")}
|exp FACT         {print(" exp fact")} 
|exp MUL exp      {print(" exp mul")}
|exp DIV exp      {print(" exp div")}  
|exp MODE exp     {print(" exp mod")}
|exp PLUS exp     {print(" exp plus")}  
|exp MINES exp    {print(" exp mines")} 
|exp NOTEQ exp         {print(" exp <>")}
|exp GREATEREQ exp     {print(" exp <=")}
|exp LESSEQ exp        {print(" exp >=")}
|exp ASSIGN exp        {print(" exp =")}
|exp GREATER exp       {print(" exp grt")}
|exp LESS exp          {print(" exp >")}
|exp XOR exp      {print(" exp xor")}
|exp OR exp       {print(" exp or")}
|exp NOT exp      {print(" exp not")}
|exp AND exp      {print(" exp and")} 
|P_O exp P_C    
|callmodule   
;
callmodule:
ID P_O exp         (COMMA exp)*        P_C 
|ID P_O exp P_C 
;



// ----------------
// lexer rules
// ----------------
INT:[0-9]+ ;
FLOAT:[-]?([0-9]+([.][0-9]*)?|[.][0-9]+) ;
REAL : [0-9]+ | [0][xX][0-9a-fA-F]+ | [-]?([0-9]+([.][0-9]*)?|[.][0-9]+);
T_REAL: [rR][Ee][Aa][Ll] ;
COMMENT:'%%%'.*? '%%%'|'%%'~[\r\n]* ;

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

BOOL :  [tT][rR][uU][eE] |[fF][aA][Ll][sS][eE] ;


WT : [ \r\n\t]+ -> skip;
SEPERATOR :(';');
ID : [a-zA-Z]SUBID?SUBID?SUBID?SUBID?SUBID?SUBID?SUBID?SUBID?SUBID?
        SUBID?SUBID?SUBID?SUBID?SUBID?SUBID?SUBID?SUBID?SUBID?SUBID?
        SUBID?SUBID?SUBID?SUBID?SUBID?SUBID?SUBID?SUBID?SUBID?SUBID?
        SUBID?SUBID?;

SUBID :[0-9a-zA-Z];

ERROR : .;