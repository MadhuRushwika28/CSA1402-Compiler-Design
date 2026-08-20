%{
#include <stdio.h>
%}

%%

"//".*                      { printf("Single-line comment\n"); }
"/*"([^*]|\*+[^*/])*\*+"/"  { printf("Multi-line comment\n"); }
[ \t\n]+                    ;
.                           { printf("Not a comment\n"); }

%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter a comment:\n");
    yylex();
    return 0;
}
