%{
  // Comment
  
  #include "tok.h"
%}

%%
(" "|\t|\n|\r)                          { }
"//"                           	 	{ }  //printf("Ignore single linecomments\n");
"/*"[^/]*"*/"	                        { }  //printf("Ignore multi-line comments\n");
[0-9]+                                  { yylval.ival = atoi(yytext);         return INT;}
"\""[^\"]*"\""                          { yylval.sval = strdup(yytext);        return STRING; }
"="                                     { yylval.equals = strdup(yytext);     return EQUALS; }
";"                                     { yylval.colon = strdup(yytext);      return COLON; }
"("				        { yylval.b_paren = strdup(yytext);    return B_PAREN; }
")"                                     { yylval.e_paren = strdup(yytext);    return E_PAREN; }
"{"				        { yylval.b_bracket = strdup(yytext);  return B_BRACKET; }
"}"				        { yylval.e_bracket = strdup(yytext);  return E_BRACKET; }
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
