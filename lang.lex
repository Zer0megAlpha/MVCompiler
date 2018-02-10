%{
        // Comment
%}

%%
(" "|\t|\n|\r)                          { }
"/"                           	 	{ }//printf("Ignore single linecomments\n");
"/*"[^/]*"*/"	                        { }//printf("Ignore multi-line comments\n");
[0-9]+                                  printf("INTEGER %d\n",atoi(yytext));
"\""[^\"]*"\""                          printf("STRING CONSTANT %s\n",yytext);
"="                                     printf("EQUALS\n");
";"                                     printf("SEMICOLON\n");
"("					printf("BEGIN PAREN\n");
")"                                     printf("END PAREN\n");
"{"					printf("BEGIN BRACES\n");
"}"					printf("END BRACES\n");
"return"				printf("RETURN\n");
"for"                     		printf("FOR\n");
"while"					printf("WHILE\n");
"do"                        		printf("DO\n");
"<"                                     printf("LESS THAN\n");
"<="                                    printf("LESS THAN EQUAL TO\n");
">"                                     printf("GREATER THAN\n");
">="                                    printf("GREATER THAN EQUAL TO\n");
"<>"                                    printf("NOT EQUAL TO\n");
"+"                                     printf("PLUS\n");
"-"                                     printf("MINUS\n");
"*"                                     printf("MULTIPLICATION\n");
"/"                                     printf("DIVISION\n");
[a-zA-Z_][a-zA-Z_0-9]*                  printf("IDENTIFIER      %s\n",yytext);
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
