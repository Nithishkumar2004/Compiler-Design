%{
#include "y.tab.h"
%}
%%
[a-zA-Z] { return ALPHA ;}
[0-9]+ { return NUMBER ; }
"\n" { return ENTER ;}
. { return ER; }
%%
yywrap()
{}
