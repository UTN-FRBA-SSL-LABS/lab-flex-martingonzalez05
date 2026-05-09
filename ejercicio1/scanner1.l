%pointer
%option noyywrap

%%

 /* ── Reglas ya implementadas ────────────────────────── */

 /* Constante Hexa : Empieza con 0x o 0X, seguido de digitos hexadecimal */
0[xX][0-9a-fA-F]+       { printf("constante hexadecimal: %s\n", yytext); }

 /* Constante octal: 0 seguido de dígitos octales (o solo 0) */
0[0-7]*         { printf("constante octal: %s\n", yytext); }

 /* constante decimal: Empieza con un digito del 1-9, seguido de cero o mas digitos [0-9]*/
[1-9][0-9]* { printf("constante decimal: %s\n", yytext); }

 /*Identificador: Empieza con letra o _, seguido de letras, digitos o _ */
[a-zA-Z_][a-zA-Z0-9_]* { printf("identificador: %s\n", yytext); }

 /* Ignorar espacios, tabs y saltos de línea */
[ \t\n]         { }

 /*Comodin (Siempre al final) */
.                   { printf("caracter no reconocido: %s\n", yytext); }


%%

int main(void) {
    yylex();
    return 0;
}

