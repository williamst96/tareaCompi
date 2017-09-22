%{
#include<stdio.h>
#include <stdlib.h>
%}

dig [0-9]
id ([A-Za-zñ][A-Za-z0-9ñ]*)

letter[a-zA-Z]

graphic ([a-z]|[A-Z])|[0-9]|(\+|-|\*|=|<|>|\\|&|@|%|\^|\?|\/)|\t|[.:,;~(){}_|!'`"#$]|\[|\]

opchar (\+|-|\*|=|<|>|\\|&|@|%|\^|\?|\/)

blank [ \n\t]+

charlit 'graphic'

token (array|begin|const|do|else|end|func|if|in|let|of|proc|record|then|type|var|while|:=)

%%

{opchar}{id} {printf("Error\n");}

{token} {printf("Token\n");}

{dig}* {printf("Entero\n");}

{opchar}+ {printf("Operator\n");}

'{graphic}' {printf("Charlit\n");}

{blank}+ {}

!{graphic}*\n {printf("Comment\n");}

{id} {printf( "Identificador\n");}

. {printf("error");}

%%

int main(int argc[],char *argv[])
{
	yyin=fopen(argv[1],"r");
	yylex();
	
	return 0;
}