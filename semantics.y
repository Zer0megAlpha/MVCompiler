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
  int ival;
  char *sval;
  char *identifier;
  char *equals;
  char *op;
  char *b_paren;
  char *e_paren;
  char *b_bracket;
  char *e_bracket;
  char *colon;
  char *type;
  char *ret;
}

//Define Terminal Symbols

%token <ival> INT
%token <sval> STRING
%token <identifier> IDENTIFIER
%token <equals> EQUALS
%token <operator> OP
%token <b_paren> B_PAREN
%token <e_paren> E_PAREN
%token <b_bracket> B_BRACKET
%token <e_bracket> E_BRACKET
%token <colon> COLON
%token <type> TYPE
%token <ret> RETURN

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
