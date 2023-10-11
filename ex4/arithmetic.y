%{
#include<stdio.h>
%}
%token NUMBER
%token VARIABLE
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'
%%
S: VARIABLE'='E {
printf("\nEntered arithmetic expression is Valid\n\n");
return 0;
}
E:E'+'E
|E'-'E
|E'*'E
|E'/'E
|E'%'E
|'('E')'
| NUMBER
| VARIABLE
;
%%
main()
{
printf("\nEnter Any Arithmetic Expression:\n");
yyparse();
}
yyerror()
{
printf("\nEntered arithmetic expression is Invalid\n\n");
}
