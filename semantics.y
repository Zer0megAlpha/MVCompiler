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
  char *b_brace;
  char *e_brace;
  char *semicolon;
  char *type;
}

//Define Terminal Symbols

%token <ival> INT
%token <sval> STRING
%token <identifier> IDENTIFIER
%token <equals> EQUALS
%token <operator> OP
%token <b_paren> B_PAREN
%token <e_paren> E_PAREN
%token <b_brace> B_BRACE
%token <e_brace> E_BRACE
%token <semicolon> SEMICOLON
%token <type> TYPE
%token RETURN
%token END_OF_FILE

//Grammar
%%
input: func { printf("ENDED\n"); };

func:  TYPE IDENTIFIER B_PAREN E_PAREN B_BRACE block E_BRACE { printf("FUNC\n"); };

block: stmt block { printf("BLOCK\n"); }
    |  /* EMPTY */
;

stmt:  IDENTIFIER B_PAREN expr E_PAREN SEMICOLON { printf("STATEMENT\n"); }
|  RETURN INT SEMICOLON { printf("RETURNED\n"); };

expr:  STRING { printf("Found STRING\n"); }
|  INT  { printf("Found INT\n"); };

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

void yyerror(const char *s) {
  printf("Parsing error: %s", s);
  return;
}
