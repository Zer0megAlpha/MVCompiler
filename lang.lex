%{
  // Comment
  
  #include "tok.h"
%}

%%
(" "|\t|\n|\r)                          { }
"//"                           	 	{ }  //printf("Ignore single linecomments\n");
"/*"[^/]*"*/"	                        { }  //printf("Ignore multi-line comments\n");
[0-9]+                                  { yylval.ival = atoi(yytext);         return INT;}
"\""[^\"]*"\""                          { yylval.sval = strdup(yytext);       return STRING; }
"="                                     { yylval.equals = strdup(yytext);     return EQUALS; }
";"                                     { yylval.semicolon = strdup(yytext);  return SEMICOLON; }
"("				        { yylval.b_paren = strdup(yytext);    return B_PAREN; }
")"                                     { yylval.e_paren = strdup(yytext);    return E_PAREN; }
"{"				        { yylval.b_brace = strdup(yytext);    return B_BRACE; }
"}"				        { yylval.e_brace = strdup(yytext);    return E_BRACE; }
"int"                                   { yylval.type = strdup(yytext);       return TYPE; }
"return"			        { yylval.ret = strdup(yytext);        return RETURN; }
"<"                                     { yylval.op = strdup(yytext);         return OP; }
"<="                                    { yylval.op = strdup(yytext);         return OP; }
">"                                     { yylval.op = strdup(yytext);         return OP; }
">="                                    { yylval.op = strdup(yytext);         return OP; }
"<>"                                    { yylval.op = strdup(yytext);         return OP; }
"+"                                     { yylval.op = strdup(yytext);         return OP; }
"-"                                     { yylval.op = strdup(yytext);         return OP; }
"*"                                     { yylval.op = strdup(yytext);         return OP; }
"/"                                     { yylval.op = strdup(yytext);         return OP; }
[a-zA-Z_][a-zA-Z_0-9]*                  { yylval.identifier = strdup(yytext); return IDENTIFIER; }
<<EOF>>                                 {                                     return END_OF_FILE; }
%%
int     yywrap()
{
        return(1);
}

int     main()
{
        yylex();
        return(0);
}
