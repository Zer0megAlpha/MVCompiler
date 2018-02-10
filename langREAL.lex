%{
        // Comment
%}
%%
(" "|"  "|"\n"|"\r")                    { }
"//"			                { }
"/*"[^*/)]*"*/"                         { }
[0-9]+                                  return INTEGER;
"null"					return NULL;
"true"					return TRUE;
"false"					return FALSE;
"'"[^']*"'"                             return STRING CONSTANT;
":="                                    return ASSIGNMENT;
"="                                     return EQUALS;
";"                                     return SEMICOLON;
","                                     return COMMA;
":"                                     return COLON;
".."                                    return RANGE;
"."                                     return PERIOD;
"("                                     return BEGIN PAREN;
")"                                     return END_PAREN;
"["                                     return BEGIN BRACKET;
"]"                                     return END_BRACKET;
"program"				return PROGRAM;
"const"					return CONST;
"type"		     			return TYPE;
"var"                    		return VAR;
"procedure"  				return PROCEDURE;
"function"     				return FUNCTION;
"begin"               			return BEGIN;
"end"                     		return END;
"if"                        		return IF;
"else"     				return ELSE;
"for"      				return FOR;
"while"    				return WHILE;
"do"       		                return DO;
"case"     				return CASE;
"<"                                     return LESS;
"<="                                    return LESS_EQUAL;
">"                                     return GREATER;
">="                                    return GREATER_EQUAL;
"<>"                                    return NOT_EQUAL;
"+"                                     return PLUS;
"-"                                     return MINUS;
"*"                                     return MULTIPLICATION;
"/"                                     return DIVISION;
[a-zA-Z_][a-zA-Z_0-9]*                  return IDENTIFIER;




"&"					return AMPERSAND;
"&&"					return ANDAND;
"&="					return ANDassign;
"->"					return ARROW;
"="					return ASSIGNOP;
"[]"					return BRACKETS;
"char"					return CHAR;
"const"					return CONST;
"--"					return DECR;
"/="					return DIVassign;
"double"				return DOUBLE;
"enum"					return ENUM;
"=="					return EQ;
"^="					return ERassign;
"float"					return FLOAT;
"^"					return HAT;
"++"					return INCR;
"int"					return INT;
"["					return LBRACKET;
"long"					return LONG;
"<<"					return LS;
"<<="					return LSassign;
"-"					return MINUS;
"-="					return MINUSassign;
"%"					return MOD;
"%="					return MODassign;
"*="					return MULTassign;
"!="					return NE;
"!"					return NOT;
"|"					return OR;
"|="					return ORassign;
"||"					return OROR;
"+"					return PLUS;
"+="					return PLUSassign;
"?"					return QUESTION;
"]"					return RBRACKET;
">>"					return RS;
">>="					return RSassign;
"short"					return SHORT;
"signed"				return SIGNED;
"sizeof"				return SIZEOF;
"struct"				return STRUCT;
"~"					return TWIDDLE;
"union"					return UNION;
"unsigned"				return UNSIGNED;
"void"					return VOID;
"volatile"				return VOLATILE;
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
