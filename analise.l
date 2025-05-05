%{
#include <stdio.h>
%}

%% 

[" "]         {}
[\r\n]+         {}
[\t]        {}

int       { printf("Palavra reservada: int\n"); }
void      { printf("Palavra reservada: void\n"); }
if        { printf("Palavra reservada: if\n"); }
else      { printf("Palavra reservada: else\n"); }
return    { printf("Palavra reservada: return\n"); }
while     { printf("Palavra reservada: while\n"); }

[0-9]+[a-zA-Z_][a-zA-Z0-9_]*  { printf("Erro léxico: identificador inválido (não pode começar com número): %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]*        { printf("Identificador: %s\n", yytext); }
[0-9]+                        { printf("Número Inteiro: %s\n", yytext); }

"("       { printf("Delimitador: (\n"); }
")"       { printf("Delimitador: )\n"); }
"{"       { printf("Delimitador: {\n"); }
"}"       { printf("Delimitador: }\n"); }
"["       { printf("Delimitador: [\n"); }
"]"       { printf("Delimitador: ]\n"); }
";"       { printf("Delimitador: ;\n"); }
","       { printf("Delimitador: ,\n"); }

"="       { printf("Atribuição: =\n"); }

"+"       { printf("Operador Aritmético: +\n"); }
"-"       { printf("Operador Aritmético: -\n"); }
"*"       { printf("Operador Aritmético: *\n"); }
"/"       { printf("Operador Aritmético: /\n"); }

"<"       { printf("Operador Relacional: <\n"); }
">"       { printf("Operador Relacional: >\n"); }
"<="       { printf("Operador Relacional: <=\n"); }
">="       { printf("Operador Relacional: >=\n"); }
"=="       { printf("Operador Relacional: ==\n"); }
"!="       { printf("Operador Relacional: !=\n"); }



.         { printf("Erro léxico: caractere inválido: %s\n", yytext); }
%%

int yywrap(void) {
    return 1;  
}

int main() {
    yylex();  
    return 0;
}
