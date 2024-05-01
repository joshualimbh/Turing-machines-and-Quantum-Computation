/*  flex  file for lexical analyser for PLUS-TIMES-POWER expressions,
    which involve simple arithmetic for nonnegative integers
    with addition, multiplication and powers.
    Graham Farr, Monash University
    Initially, copied from the Wikipedia page for  lex, then modified over time.
    Last updated:  11 September 2021
*/
    
/*** Definition section ***/

%{
/* C code to be copied verbatim */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void yyerror(char *);
#include "quant.h"
#include "y.tab.h"

%}


%%
    /*** Rules section ***/

            /* yytext is a string containing the matched text. */

    /* Nonnegative integers ...  */

I   {
            yylval.str = strdup(yytext);
            return  I;

        }



H  {
            yylval.str = strdup(yytext);
            return  H;

         }

X  {

            yylval.str = strdup(yytext);
            return  X;

         }

Z  {

            yylval.str = strdup(yytext);
            return  Z;

         }

CNOT  {

            yylval.str = strdup(yytext);
            return  CNOT;

         }

TOF  {

            yylval.str = strdup(yytext);
            return  TOF;         }

\(x\)  {

            yylval.str = strdup(yytext);
            return  KRONECKERPROD;

         }

[*()]   {

            return  *yytext;

        }

\n      {

            return  *yytext;

        }


[ \t]   {    }     /*  skip whitespace  */


.       {

           yyerror("invalid character");

        }
     /*  will match any single character that does not match
         any of the above patterns
     */


%%
    /*** C Code section ***/

void yyerror(char *s) {
      fprintf(stderr, "line %d: yytext = %s.  Error msg: %s.\n", yylineno, yytext, s);
}


int yywrap(void) {
   return 1;
}

