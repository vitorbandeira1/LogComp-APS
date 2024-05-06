%{
#include "DesesperoAlvinegro.tab.h"  // Inclua o arquivo gerado pelo Bison
%}

%%

"Ruma"         { yylval.sval = strdup("Ruma"); return TYPE; }
"Sentimento"   { yylval.sval = strdup("Sentimento"); return TYPE; }
"Torcedor"     { yylval.sval = strdup("Torcedor"); return TYPE; }
"Rival"        { yylval.sval = strdup("Rival"); return TYPE; }
"se"           { return SE; }
"entao"        { return ENTAO; }
"senao"        { return SENAO; }
"enquanto"     { return ENQUANTO; }
"faca"         { return FACA; }
"mostra"       { return MOSTRA; }
"e"            { return E; }
"recebe"       { return RECEBE; }
"naJogada"     { return NAJOGADA; }
[0-9]+         { yylval.ival = atoi(yytext); return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]* { yylval.sval = strdup(yytext); return IDENTIFIER; }
\"[^"]*\"      { yylval.sval = strdup(yytext); return STRING; }

%%
