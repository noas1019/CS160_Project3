%option yylineno
%pointer

%{
    #include <cstdlib>
    #include <cerrno>
    #include <climits>
    #include <limits>
    #include "parser.hpp"
    
	void yyerror(const char *);
%}

/* WRITEME: Write any definitions here. You can find information on
            definitions here:
            ftp://ftp.gnu.org/old-gnu/Manuals/flex-2.5.4/html_mono/flex.html#SEC10 */

/* WRITEME: If you are going to use start conditions, write them here.
            You can find more information on start conditions here:
            ftp://ftp.gnu.org/old-gnu/Manuals/flex-2.5.4/html_mono/flex.html#SEC11
            You will probably want to use exclusive conditions rather
            than inclusive conditions (use the %x instead of the %s). */

%%
  /* WRITEME: Write your Flex token rules here */
"->"              { return T_ARROW; }
";"               { return T_SEMICOLON; }
"."               { return T_DOT; }
"{"               { return T_OPENBRACKET; }
"}"               { return T_CLOSEBRACKET; }
"("               { return T_OPENPAREN; }
")"               { return T_CLOSEPAREN; }
","               { return T_COMMA; }
"not"             { return T_NOT; }
"*"               { return T_MULT; }
"/"               { return T_DIV; }
"+"               { return T_PLUS; }
"-"               { return T_MINUS; }
">="              { return T_GREATEREQUAL; }
">"               { return T_GREATER; }
"="               { return T_EQUAL; }
"and"             { return T_AND; }
"or"              { return T_OR; }
"print"           { return T_PRINT; }
"return"          { return T_RETURN; }
"if"              { return T_IF; }
"else"            { return T_ELSE; }
"while"           { return T_WHILE; }
"new"             { return T_NEW; }
"integer"         { return T_INTEGER; }
"boolean"         { return T_BOOLEAN; }
"none"            { return T_NONE; }
"equals"          { return T_EQUALS; }
"true"            { return T_TRUE; }
"false"           { return T_FALSE; }
"extends"         { return T_EXTENDS; }
"do"              { return T_DO; }
[a-zA-Z][a-zA-Z0-9]* { return T_IDENTIFIER; }
[0-9]+\.?[0-9]+   { return T_LITERAL; }
[0]               { return T_LITERAL; }
[\t\n]            ;
.                 { yyerror("invalid character"); }
%%

int yywrap(void) {
  return 1;
}
