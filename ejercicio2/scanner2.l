%pointer
%option noyywrap

 /* ── Sección de definiciones ERX ───────────────────────────────────────
   Las definiciones permiten nombrar expresiones regulares para reutilizarlas.
   Formato:   nombre   expresion_regular
   Uso en reglas:  {nombre}
   ─────────────────────────────────────────────────────────────────── */

 /* Definición ya dada como ejemplo: */
digitoHexa      [0-9a-fA-F]

 /* TODO 1 */
digito         [0-9]        

 /* TODO 2 */ 
letra          [a-zA-Z_]

 /* TODO 3 */
identificador {letra}({letra}|{digito})* 

%%

 /* ── Reglas usando las definiciones ─────────────────────────────────── */

0[xX]{digitoHexa}+  { printf("constante hexadecimal de longitud %d: %s\n", yyleng, yytext); }

 /* TODO 4 — Regla para constante decimal usando {digito} */
[1-9]{digito}*  { printf("constante decimal de longitud %d: %s\n", yyleng, yytext); }   

 /* TODO 5 — Regla para identificador usando {identificador} */
{identificador} { printf("identificador de longitud %d: %s\n", yyleng, yytext); }      

[ \t\n]     { }
.           { printf("caracter no reconocido: %s\n", yytext); }

%%

int main(void) {
    yylex();
    return 0;
}
