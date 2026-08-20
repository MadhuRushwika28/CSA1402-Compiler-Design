%{
#include <stdio.h>
%}

%%

[ \t\n]+                    ;
"//".*                      ;
"/*"([^*]|\*+[^*/])*\*+"/"  ;

[a-zA-Z_][a-zA-Z0-9_]*      { printf("Identifier: %s\n", yytext); }
[0-9]+                      { printf("Constant: %s\n", yytext); }
[+\-*/=]                    { printf("Operator: %s\n", yytext); }
.                           { printf("Other: %s\n", yytext); }

%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter input:\n");
    yylex();
    return 0;
}
