# LogComp-APS

### Sobre a Linguagem DesesperoAlvinegro
#### Motivação

A linguagem de programação DesesperoAlvinegro foi criada para encapsular a emoção e o desespero vivenciados pelos torcedores do time de futebol Ceará Sporting Club durante os jogos dos últimos anos. Esta linguagem não apenas serve como uma ferramenta de programação prática, mas também como uma forma de expressão cultural e emocional através de algumas gírias regionais, e permitindo também aos desenvolvedores explorar a programação em um contexto divertido e único.

### EBNF para o DesesperoAlvinegro
```ebnf
program = { statement } ;

statement = var_declaration | assignment | conditional | loop | event_call | print_statement | comment ;

var_declaration = type, identifier, "é", expression, ";" ;

assignment = identifier, "recebe", expression, ";" ;

conditional = "se", expression, "então", "{", { statement }, "}", [ "senão", "{", { statement }, "}" ], ";" ;

loop = "enquanto", expression, "faça", "{", { statement }, "}", ";" ;

event_call = "naJogada", event_name, "{", { action }, "}", ";" ;
event_name = "golDe" | "cartaoPara" | "ChamouNoVar" | "InicioDeJogo" ;
action = decision_action | "mostra", string, { ",", expression }, ";" ;
decision_action = "se", decision_condition, "então", "{", { action }, "}", [ "senão", "{", { action }, "}" ], ";" ;
decision_condition = "decisao VAR é", var_decision, ";" ;
var_decision = "Anular" | "Confirmar" ;

print_statement = "mostra", string, { ",", expression }, ";" ;

comment = "//", { any_char - newline }, newline ;

type = "Ruma" | "Sentimento" | "Torcedor" | "Rival" ;
expression = simple_expression, { relational_op, simple_expression } ;
simple_expression = term, { add_op, term } ;
term = factor, { mul_op, factor } ;
factor = number | string | identifier | "(", expression, ")" ;

add_op = "+" | "-" ;
mul_op = "*" | "/" ;
relational_op = "<" | ">" | "==" | "!=" ;

identifier = letter, { letter | digit | "_" } ;
number = digit, { digit } ;
string = '"', { any_char - '"' }, '"' ;
letter = "A" | "B" | ... | "Z" | "a" | "b" | ... | "z" ;
digit = "0" | "1" | ... | "9" ;
any_char = letter | digit | punctuation | whitespace ;
punctuation = "." | "," | ";" | ":" | "!" | "?" | "(" | ")" | "[" | "]" | "{" | "}" ;
whitespace = " " | "\t" | "\n" ;
newline = "\n" ;
```
