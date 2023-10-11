%{
#include<stdio.h>
int yylex(void);
%}
%token NAME NUMBER
%left GE LE NE EQ '<' '>' '%'
%left '-' '+'
%left '*' '/'
%nonassoc UMINUS
%%
statement : NAME '=' exp
|exp {printf("=%d\n",$1);}
;
exp : NUMBER {$$ == $1;}
|exp '+' exp {$$ = $1 + $3 ;}
|exp '-' exp {$$ = $1 - $3 ;}
|exp '*' exp {$$ = $1 * $3 ;}
|exp '/' exp {$$ = $1 / $3 ;}
|exp '-' exp %prec UMINUS {$$ = -$2 ;}
|'(' exp ')' {$$ = $2 ;}
;
%%
main()
{
printf("Enter the expression: ");
yyparse();
}
yyerror()
{ printf("\nError Occured\n");
}
