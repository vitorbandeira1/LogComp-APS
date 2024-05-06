%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
extern int yylex();
%}

%union {
    int ival;
    char *sval;
}

%token <sval> IDENTIFIER TYPE STRING
%token <ival> NUMBER
%token SE ENTAO SENAO ENQUANTO FACA MOSTRA E RECEBE NAJOGADA VARDECISION FUNCTION RETURN

%type <sval> identifier
%type <ival> expression

%left '+' '-'
%left '*' '/'
%nonassoc SE ENTAO SENAO  // Tratando 'se então senão' como não associativos para evitar ambiguidades.
%right '='  // Supondo que você possa ter operadores de atribuição.

%%

program:
    statement_list
    ;

statement_list:
    statement
  | statement_list statement
  ;

statement:
    var_declaration
  | print_statement
  | conditional_statement
  | loop_statement
  | event_call
  | function_declaration
  | return_statement
  ;

var_declaration:
    TYPE identifier "e" expression ";" {
        printf("Variable declared: %s %s\n", $1, $2);
    }
  ;

identifier:
    IDENTIFIER { $$ = $1; }
    ;

print_statement:
    "mostra" STRING ";" {
        printf("Show: %s\n", $2);
    }
  ;

conditional_statement:
    SE expression ENTAO "{" statement_list "}" optional_else_part
  ;

optional_else_part:
    | SENAO "{" statement_list "}"
  ;

loop_statement:
    ENQUANTO expression FACA "{" statement_list "}"
  ;

event_call:
    NAJOGADA event_name "{" action_list "}"
  ;

event_name:
    "golDe" | "cartaoPara" | "ChamouNoVar" | "InicioDeJogo"
  ;

action_list:
    action
  | action_list action
  ;

action:
    print_statement  // Utilizando print_statement como exemplo de ação.
  ;

function_declaration:
    FUNCTION identifier "(" parameter_list ")" "{" statement_list "}" {
        printf("Function declared: %s\n", $2);
    }
  ;

parameter_list:
    | identifier
    | parameter_list "," identifier
  ;

return_statement:
    RETURN expression ";" {
        printf("Return: %d\n", $2);
    }
  ;

expression:
    expression '+' expression { $$ = $1 + $3; }
  | expression '-' expression { $$ = $1 - $3; }
  | expression '*' expression { $$ = $1 * $3; }
  | expression '/' expression { $$ = $1 / $3; }
  | NUMBER { $$ = $1; }
  | identifier { $$ = atoi($1); }  // Conversão, se necessário.
  ;

%%
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    yyparse();
    return 0;
}
