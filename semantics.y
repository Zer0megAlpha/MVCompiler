%{
  #include <stdio.h>
  
  //Flex variables
  extern int yylex();
  extern int yyparse();
  extern FILE *yyin;
  
  void yyerror(const char *s);
%}




//Data types
%union {


}

//Define Terminal Symbols

/*
%token <ival> INT
%token <sval> STRING
*/

//Grammar
%%
input:        /* empty */

%%

int main(int argc, char **argv[]) {
  
  FILE *fp;

  char fileName[] = "test.c"; 
  
  //Open file & Check Validity

  fp = fopen(fileName, "r");

  if (!fp) {
    printf("Cannot open file");
    return -1;
  }
  
  //Flex parsing
  yyin = fp;

  do {
    yyparse();
  } while (!feof(yyin));

  return 0;
}
