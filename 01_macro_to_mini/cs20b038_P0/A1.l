%{

#include<stdio.h>
#include<stdlib.h>
#include <string.h>

%}

%%

"#defineExpr"  {yylval.strval = strdup(yytext);return DefineExpr;}
"#defineExpr0" {yylval.strval = strdup(yytext);return DefineExpr0;}
"#defineExpr1" {yylval.strval = strdup(yytext);return DefineExpr1;}
"#defineExpr2" {yylval.strval = strdup(yytext);return DefineExpr2;}
"#defineStmt"  {yylval.strval = strdup(yytext);return DefineStmt;} 		
"#defineStmt0" {yylval.strval = strdup(yytext);return DefineStmt0;}
"#defineStmt1" {yylval.strval = strdup(yytext);return DefineStmt1;}
"#defineStmt2" {yylval.strval = strdup(yytext);return DefineStmt2;}
"int" 		   {yylval.strval = strdup(yytext);return INT;}
"boolean" 	   {yylval.strval = strdup(yytext);return BOOL;}
"class"		   {yylval.strval = strdup(yytext);return CLASS;}
"public" 	   {yylval.strval = strdup(yytext);return PUBLIC;}
"static" 	   {yylval.strval = strdup(yytext);return STATIC;}
"void"         {yylval.strval = strdup(yytext);return VOID;}
"main"         {yylval.strval = strdup(yytext);return MAIN;}
"if" 		   {yylval.strval = strdup(yytext);return IF;}
"else" 		   {yylval.strval = strdup(yytext);return ELSE;}
"while" 	   {yylval.strval = strdup(yytext);return WHILE;}
"(" 		   {yylval.strval = strdup(yytext);return NORMALLEFTBRACE;}
")" 		   {yylval.strval = strdup(yytext);return NORMALRIGHTBRACE;}
"[" 		   {yylval.strval = strdup(yytext);return SQLEFTBRACE;}
"]" 		   {yylval.strval = strdup(yytext);return SQRIGHTBRACE;}
"{" 		   {yylval.strval = strdup(yytext);return CURLYLEFTBRACE;}
"}" 		   {yylval.strval = strdup(yytext);return CURLYRIGHTBRACE;}
"&&"		   {yylval.strval = strdup(yytext);return AND;}
"||"		   {yylval.strval = strdup(yytext);return OR;}
"!="		   {yylval.strval = strdup(yytext);return NEQ;}
"=" 		   {yylval.strval = strdup(yytext);return EQUAL;}
"<="		   {yylval.strval = strdup(yytext);return LESSTHANEQUAL;}			   
"+" 		   {yylval.strval = strdup(yytext);return PLUS;}
"-" 		   {yylval.strval = strdup(yytext);return MINUS;}
"*" 		   {yylval.strval = strdup(yytext);return MUL;}
"/"		       {yylval.strval = strdup(yytext);return DIV;}
"!"			   {yylval.strval = strdup(yytext);return NOT;}
".length"	   {yylval.strval = strdup(yytext);return LENGTH;}
"," 		   {yylval.strval = strdup(yytext);return COMMA;}
";" 		   {yylval.strval = strdup(yytext);return SEMICOLON;}
"new" 		   {yylval.strval = strdup(yytext);return NEW;}
"true"         {yylval.strval = strdup(yytext);return TRUE;}
"false"        {yylval.strval = strdup(yytext);return FALSE;}
"this" 		   {yylval.strval = strdup(yytext);return THIS;}
"String"       {yylval.strval = strdup(yytext);return STRING;}
"System.out.println" {yylval.strval = strdup(yytext);return SYSOUTPRINTLN;}
"."            {yylval.strval = strdup(yytext);return DOT;}
"extends"      {yylval.strval = strdup(yytext);return EXTENDS;}
"return"       {yylval.strval = strdup(yytext);return RETURN;}
[a-zA-Z][a-zA-Z0-9_]* {yylval.strval = strdup(yytext);return IDENTIFIER;}
[1-9][0-9]*|0  {yylval.strval = strdup(yytext);return NUMBER;}
" "            { }
[\r]	       { } 
[\t]           { }
[\f]           { }
[\n]           { }
\/\/.*         { }
\/\*.*\*\/     { } 
.              {yylval.strval = strdup(yytext);return OTHER;}

%%