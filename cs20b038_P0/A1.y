%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#define SIZE sizeof(char)

extern int yylex();
void yyerror(char *);

char* breaking[1000][1000];
int mycount;
void registering_macro(char *identifier,char* args,char *replace, int typ);
char* replacing_macro(char *id,char *args,int typ);

%}

%union 
{
	char *strval;
}

%token <strval> DefineExpr 
%token <strval> DefineExpr0
%token <strval> DefineExpr1
%token <strval> DefineExpr2
%token <strval> DefineStmt 
%token <strval> DefineStmt0
%token <strval> DefineStmt1
%token <strval> DefineStmt2
%token <strval> INT
%token <strval> BOOL
%token <strval> CLASS
%token <strval> PUBLIC
%token <strval> STATIC
%token <strval> VOID
%token <strval> MAIN
%token <strval> IF
%token <strval> ELSE
%token <strval> WHILE
%token <strval> NORMALLEFTBRACE
%token <strval> NORMALRIGHTBRACE
%token <strval> SQLEFTBRACE
%token <strval> SQRIGHTBRACE
%token <strval> CURLYLEFTBRACE
%token <strval> CURLYRIGHTBRACE
%token <strval> AND
%token <strval> OR
%token <strval> NEQ
%token <strval> EQUAL
%token <strval> LESSTHANEQUAL
%token <strval> PLUS
%token <strval> MINUS
%token <strval> MUL
%token <strval> DIV
%token <strval> NOT
%token <strval> LENGTH
%token <strval> COMMA
%token <strval> SEMICOLON
%token <strval> NEW
%token <strval> TRUE
%token <strval> FALSE
%token <strval> THIS
%token <strval> STRING
%token <strval> SYSOUTPRINTLN
%token <strval> DOT
%token <strval> EXTENDS
%token <strval> RETURN
%token <strval> IDENTIFIER
%token <strval> NUMBER
%token <strval> OTHER

%type <strval> Goal
%type <strval> MacroDefinitioncatenation
%type <strval> TypeDeclarationcatenation
%type <strval> MainClass
%type <strval> TypeDeclaration
%type <strval> TypeIdentifiercatenation
%type <strval> TypeIdentifierSemicolon
%type <strval> MethodDeclarationcatenation
%type <strval> MethodDeclaration
%type <strval> Statementcatenation
%type <strval> CommaTypeIdentifiercatenation
%type <strval> CommaTypeIdentifier
%type <strval> Statement
%type <strval> Type
%type <strval> MacroStatementExpressionQ
%type <strval> Expression
%type <strval> MacroExpression
%type <strval> CommaExpressioncatenation
%type <strval> CommaExpression
%type <strval> PrimaryExpression
%type <strval> Identifier
%type <strval> MacroDefinition
%type <strval> MacroDefStatement
%type <strval> CommaIdentifiercatenation
%type <strval> CommaIdentifier
%type <strval> MacroDefExpression

%start Goal

%%
Goal :  MacroDefinitioncatenation MainClass TypeDeclarationcatenation {
													char *haha = (char*) calloc((strlen($2)+strlen($3)+100),SIZE);
													$$ = haha;
													 int i=0,j=0;
													 while ($2[i] != '\0') {
														$$[j] = $2[i];
														i++;
														j++;
													 }
													 $$[j]='\n';
													 j++;
													 i=0;
													 while ($3[i]!='\0'){
														$$[j] = $3[i];
														i++;
														j++;
													 }
													 $$[j]='\n';
													 j++;												
													printf("%s\n",$$);		
														  };

MacroDefinitioncatenation : {}
					       | MacroDefinition MacroDefinitioncatenation ;

TypeDeclarationcatenation : 										{char* haha = (char*)calloc((100),SIZE);
                                                                     $$ = haha;
																	 $$="\0";
																	 }
					        | TypeDeclaration TypeDeclarationcatenation   {
																           char* haha = (char*)calloc((strlen($1)+strlen($2)+30),SIZE); 
																		   $$ = haha;
																		   int i=0,j=0;
																		   while($1[i]!='\0'){
																			   $$[j] = $1[i];
																			   i++;
																			   j++;
																		   }
																		   i=0;
																		   $$[j]='\n';
																		   j++;
																		   while ($2[i]!='\0'){
																			   $$[j] = $2[i];
																			   i++;
																			   j++;
																		   }
															              };

MainClass : CLASS Identifier CURLYLEFTBRACE PUBLIC STATIC VOID MAIN NORMALLEFTBRACE STRING SQLEFTBRACE SQRIGHTBRACE Identifier NORMALRIGHTBRACE CURLYLEFTBRACE SYSOUTPRINTLN NORMALLEFTBRACE Expression NORMALRIGHTBRACE SEMICOLON CURLYRIGHTBRACE CURLYRIGHTBRACE {
	                                                                                                                                                                                                                                                                int length=strlen($1)+strlen($2)+strlen($3)+strlen($4)+strlen($5)+strlen($6)+strlen($7)+strlen($8)+strlen($9)+strlen($10)+strlen($11)+strlen($12)+strlen($13)+strlen($14)+strlen($15)+strlen($16)+strlen($17)+strlen($18)+strlen($19)+strlen($20)+strlen($21)+1000;
											 																											                                                                                                            $$ = (char*)calloc(length,SIZE);
																																																																	int i=0,j=0;
																																																																	while($1[i]!='\0'){
																																																																		$$[j]=$1[i];
																																																																		i++;
																																																																		j++;
																																																																	}
																																																																	i=0;
																																																																	$$[j]=' ';
																																																																	j++;
																																																																	while($2[i]!='\0'){
																																																																		$$[j]=$2[i];
																																																																		i++;
																																																																		j++;
																																																																	}
																																																																	i=0;
																																																																	$$[j]=' ';
																																																																	j++;
																																																																	while($3[i]!='\0'){
																																																																		$$[j]=$3[i];
																																																																		i++;
																																																																		j++;
																																																																	}
																																																																	i=0;
																																																																	$$[j]=' ';
																																																																	j++;
																																																																	while($4[i]!='\0'){
																																																																		$$[j]=$4[i];
																																																																		i++;
																																																																		j++;
																																																																	}
																																																																	i=0;
																																																																	$$[j]=' ';
																																																																	j++;
																																																																	while($5[i]!='\0'){
																																																																		$$[j]=$5[i];
																																																																		i++;
																																																																		j++;
																																																																	}
																																																																	i=0;
																																																																	$$[j]=' ';
																																																																	j++;
																																																																	while($6[i]!='\0'){
																																																																		$$[j]=$6[i];
																																																																		i++;
																																																																		j++;
																																																																	}
																																																																	i=0;
																																																																	$$[j]=' ';
																																																																	j++;
																																																																	while($7[i]!='\0'){
																																																																		$$[j]=$7[i];
																																																																		i++;
																																																																		j++;
																																																																	}
																																																																	i=0;
																																																																	$$[j]=' ';
																																																																	j++;
																																																																	while($8[i]!='\0'){
																																																																		$$[j]=$8[i];
																																																																		i++;
																																																																		j++;
																																																																	}
																																																																	i=0;
																																																																	$$[j]=' ';
																																																																	j++;
																																																																	while($9[i]!='\0'){
																																																																		$$[j]=$9[i];
																																																																		i++;
																																																																		j++;
																																																																	}
																																																																	i=0;
																																																																	$$[j]=' ';
																																																																	j++;
																																																																	while($10[i]!='\0'){
																																																																		$$[j]=$10[i];
																																																																		i++;
																																																																		j++;
																																																																	}
																																																																	i=0;
																																																																	$$[j]=' ';
																																																																	j++;
																																																																	while($11[i]!='\0'){
																																																																		$$[j]=$11[i];
																																																																		i++;
																																																																		j++;
																																																																	}
																																																																	i=0;
																																																																	$$[j]=' ';
																																																																	j++;
																																																																	while($12[i]!='\0'){
																																																																		$$[j]=$12[i];
																																																																		i++;
																																																																		j++;
																																																																	}
																																																																	i=0;
																																																																	$$[j]=' ';
																																																																	j++;
																																																																	while($13[i]!='\0'){
																																																																		$$[j]=$13[i];
																																																																		i++;
																																																																		j++;
																																																																	}
																																																																	i=0;
																																																																	$$[j]=' ';
																																																																	j++;
																																																																	while($14[i]!='\0'){
																																																																		$$[j]=$14[i];
																																																																		i++;
																																																																		j++;
																																																																	}
																																																																	i=0;
																																																																	$$[j]=' ';
																																																																	j++;
																																																																	while($15[i]!='\0'){
																																																																		$$[j]=$15[i];
																																																																		i++;
																																																																		j++;
																																																																	}
																																																																	i=0;
																																																																	$$[j]=' ';
																																																																	j++;
																																																																	while($16[i]!='\0'){
																																																																		$$[j]=$16[i];
																																																																		i++;
																																																																		j++;
																																																																	}
																																																																	i=0;
																																																																	$$[j]=' ';
																																																																	j++;
																																																																	while($17[i]!='\0'){
																																																																		$$[j]=$17[i];
																																																																		i++;
																																																																		j++;
																																																																	}
																																																																	i=0;
																																																																	$$[j]=' ';
																																																																	j++;
																																																																	while($18[i]!='\0'){
																																																																		$$[j]=$18[i];
																																																																		i++;
																																																																		j++;
																																																																	}
																																																																	i=0;
																																																																	$$[j]=' ';
																																																																	j++;
																																																																	while($19[i]!='\0'){
																																																																		$$[j]=$19[i];
																																																																		i++;
																																																																		j++;
																																																																	}
																																																																	i=0;
																																																																	$$[j]=' ';
																																																																	j++;
																																																																	while($20[i]!='\0'){
																																																																		$$[j]=$20[i];
																																																																		i++;
																																																																		j++;
																																																																	}
																																																																	i=0;
																																																																	$$[j]=' ';
																																																																	j++;
																																																																	while($21[i]!='\0'){
																																																																		$$[j]=$21[i];
																																																																		i++;
																																																																		j++;
																																																																	}
																																																																   };

TypeDeclaration : 	CLASS Identifier CURLYLEFTBRACE TypeIdentifiercatenation MethodDeclarationcatenation CURLYRIGHTBRACE 	{
	                                                                                                                         int length=strlen($1)+strlen($2)+strlen($3)+strlen($4)+strlen($5)+strlen($6)+100;
																                                                             $$ = (char*)calloc(length,SIZE);
																															 int i=0,j=0;
																																while($1[i]!='\0'){
																																	$$[j]=$1[i];
																																	i++;
																																	j++;
																																}
																																i=0;
																																$$[j]=' ';
																																j++;
																																while($2[i]!='\0'){
																																	$$[j]=$2[i];
																																	i++;
																																	j++;
																																}
																																i=0;
																																$$[j]=' ';
																																j++;
																																while($3[i]!='\0'){
																																	$$[j]=$3[i];
																																	i++;
																																	j++;
																																}
																																i=0;
																																$$[j]='\n';
																																j++;
																																while($4[i]!='\0'){
																																	$$[j]=$4[i];
																																	i++;
																																	j++;
																																}
																																i=0;
																																$$[j]=' ';
																																j++;
																																while($5[i]!='\0'){
																																	$$[j]=$5[i];
																																	i++;
																																	j++;
																																}
																																i=0;
																																$$[j]='\n';
																																j++;
																																while($6[i]!='\0'){
																																	$$[j]=$6[i];
																																	i++;
																																	j++;
																																}
																							   					            }				 
				| 	CLASS Identifier EXTENDS Identifier CURLYLEFTBRACE TypeIdentifiercatenation MethodDeclarationcatenation CURLYRIGHTBRACE {
					                                                                                                                         int length=strlen($1)+strlen($2)+strlen($3)+strlen($4)+strlen($5)+strlen($6)+strlen($7)+strlen($8)+100;
																														                     $$ = (char*)calloc(length,SIZE);
																																			 int i=0,j=0;
																																				while($1[i]!='\0'){
																																					$$[j]=$1[i];
																																					i++;
																																					j++;
																																				}
																																				i=0;
																																				$$[j]=' ';
																																				j++;
																																				while($2[i]!='\0'){
																																					$$[j]=$2[i];
																																					i++;
																																					j++;
																																				}
																																				i=0;
																																				$$[j]=' ';
																																				j++;
																																				while($3[i]!='\0'){
																																					$$[j]=$3[i];
																																					i++;
																																					j++;
																																				}
																																				i=0;
																																				$$[j]=' ';
																																				j++;
																																				while($4[i]!='\0'){
																																					$$[j]=$4[i];
																																					i++;
																																					j++;
																																				}
																																				i=0;
																																				$$[j]=' ';
																																				j++;
																																				while($5[i]!='\0'){
																																					$$[j]=$5[i];
																																					i++;
																																					j++;
																																				}
																																				i=0;
																																				$$[j]='\n';
																																				j++;
																																				while($6[i]!='\0'){
																																					$$[j]=$6[i];
																																					i++;
																																					j++;
																																				}
																																				i=0;
																																				$$[j]=' ';
																																				j++;
																																				while($7[i]!='\0'){
																																					$$[j]=$7[i];
																																					i++;
																																					j++;
																																				}
																																				i=0;
																																				$$[j]='\n';
																																				j++;
																																				while($8[i]!='\0'){
																																					$$[j]=$8[i];
																																					i++;
																																					j++;
																																				}
																							 					                            };

TypeIdentifiercatenation :   												{$$ = (char*)calloc(10,SIZE);$$="\0";}
					      | TypeIdentifiercatenation TypeIdentifierSemicolon   {
							                                                      int length=strlen($1)+strlen($2)+100;
																                  $$ = (char*)calloc(length,SIZE); 
																				  int i=0,j=0;
																				  while($1[i]!='\0'){
																					  $$[j]=$1[i];
																					  i++;
																					  j++;
																				  }
																				  $$[j]='\n';
																				  j++;
																				  i=0;
																				  while($2[i]!='\0'){
																					$$[j]=$2[i];
																					i++;
																					j++;
																				  }
																		       };	

TypeIdentifierSemicolon : Type Identifier SEMICOLON  	{
	                                                        int length=strlen($1)+strlen($2)+strlen($3)+100;
															$$ = (char*)calloc(length,SIZE);
															int i=0,j=0;
															while($1[i]!='\0'){
																$$[j]=$1[i];
																i++;
																j++;
															}
															$$[j]=' ';
															j++;
															i=0;
															while($2[i]!='\0'){
															$$[j]=$2[i];
															i++;
															j++;
															}
															i=0;
															$$[j]=' ';
															j++;
															while($3[i]!='\0'){
																$$[j]=$3[i];
																i++;
																j++;															
															}
														};

MethodDeclarationcatenation :  												{$$ = (char*)calloc(10,SIZE);$$="\0";}																					   				      																																							 
					         |MethodDeclarationcatenation MethodDeclaration  	{
								                                                    int length=strlen($1)+strlen($2)+100;
																					$$ = (char*)calloc(length,SIZE); 
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																					$$[j]='\n';
																					j++;
																					i=0;
																					while($2[i]!='\0'){
																					$$[j]=$2[i];
																					i++;
																					j++;
																					}
														                        };	

MethodDeclaration : PUBLIC Type Identifier NORMALLEFTBRACE NORMALRIGHTBRACE CURLYLEFTBRACE TypeIdentifiercatenation Statementcatenation RETURN Expression SEMICOLON CURLYRIGHTBRACE  {
	                                                                                                        int length=strlen($1)+strlen($2)+strlen($3)+strlen($4)+strlen($5)+strlen($6)+strlen($7)+strlen($8)+strlen($9)+strlen($10)+strlen($11)+strlen($12)+200;
																											$$ = (char*)calloc(length,SIZE);
																											int i=0;
																											int j=0;
																											while($1[i]!='\0'){
																												$$[j]=$1[i];
																												i++;
																												j++;
																											}
																											$$[j]=' ';
																											j++;
																											i=0;
																											while($2[i]!='\0'){
																												$$[j]=$2[i];
																												i++;
																												j++;
																											}
																											$$[j]=' ';
																											j++;
																											i=0;
																											while($3[i]!='\0'){
																												$$[j]=$3[i];
																												i++;
																												j++;
																											}
																											$$[j]=' ';
																											j++;
																											i=0;
																											while($4[i]!='\0'){
																												$$[j]=$4[i];
																												i++;
																												j++;
																											}						
																											i=0;
																											while($5[i]!='\0'){
																												$$[j]=$5[i];
																												i++;
																												j++;
																											}
																											$$[j]=' ';
																											j++;
																											i=0;
																											while($6[i]!='\0'){
																												$$[j]=$6[i];
																												i++;
																												j++;
																											}
																											$$[j]='\n';
																											j++;
																											i=0;
																											while($7[i]!='\0'){
																												$$[j]=$7[i];
																												i++;
																												j++;
																											}
																											$$[j]=' ';
																											j++;
																											i=0;
																											while($8[i]!='\0'){
																												$$[j]=$8[i];
																												i++;
																												j++;
																											}
																											$$[j]=' ';
																											j++;
																											i=0;
																											while($9[i]!='\0'){
																												$$[j]=$9[i];
																												i++;
																												j++;
																											}
																											$$[j]=' ';
																											j++;
																											i=0;
																											while($10[i]!='\0'){
																												$$[j]=$10[i];
																												i++;
																												j++;
																											}
																											$$[j]=' ';
																											j++;
																											i=0;
																											while($11[i]!='\0'){
																												$$[j]=$11[i];
																												i++;
																												j++;
																											}
																											$$[j]='\n';
																											j++;
																											i=0;
																											while($12[i]!='\0'){
																												$$[j]=$12[i];
																												i++;
																												j++;
																											}
																											
				   																						}
				  | PUBLIC Type Identifier NORMALLEFTBRACE Type Identifier CommaTypeIdentifiercatenation NORMALRIGHTBRACE CURLYLEFTBRACE TypeIdentifiercatenation Statementcatenation RETURN Expression SEMICOLON CURLYRIGHTBRACE {
					                                                                                        int length=strlen($1)+strlen($2)+strlen($3)+strlen($4)+strlen($5)+strlen($6)+strlen($7)+strlen($8)+strlen($9)+strlen($10)+strlen($11)+strlen($12)+strlen($13)+strlen($14)+strlen($15)+300;
				  																							$$ = (char*)calloc(length,SIZE);
																											int i=0;
																											int j=0;
																											while($1[i]!='\0'){
																												$$[j]=$1[i];
																												i++;
																												j++;
																											}
																											$$[j]=' ';
																											j++;
																											i=0;
																											while($2[i]!='\0'){
																												$$[j]=$2[i];
																												i++;
																												j++;
																											}
																											$$[j]=' ';
																											j++;
																											i=0;
																											while($3[i]!='\0'){
																												$$[j]=$3[i];
																												i++;
																												j++;
																											}
																											$$[j]=' ';
																											j++;
																											i=0;
																											while($4[i]!='\0'){
																												$$[j]=$4[i];
																												i++;
																												j++;
																											}						
																											i=0;
																											$$[j]=' ';
																											j++;
																											while($5[i]!='\0'){
																												$$[j]=$5[i];
																												i++;
																												j++;
																											}
																											$$[j]=' ';
																											j++;
																											i=0;
																											while($6[i]!='\0'){
																												$$[j]=$6[i];
																												i++;
																												j++;
																											}
																											$$[j]=' ';
																											j++;
																											i=0;
																											while($7[i]!='\0'){
																												$$[j]=$7[i];
																												i++;
																												j++;
																											}
																											$$[j]=' ';
																											j++;
																											i=0;
																											while($8[i]!='\0'){
																												$$[j]=$8[i];
																												i++;
																												j++;
																											}
																											$$[j]=' ';
																											j++;
																											i=0;
																											while($9[i]!='\0'){
																												$$[j]=$9[i];
																												i++;
																												j++;
																											}
																											$$[j]='\n';
																											j++;
																											i=0;
																											while($10[i]!='\0'){
																												$$[j]=$10[i];
																												i++;
																												j++;
																											}
																											$$[j]=' ';
																											j++;
																											i=0;
																											while($11[i]!='\0'){
																												$$[j]=$11[i];
																												i++;
																												j++;
																											}
																											$$[j]=' ';
																											j++;
																											i=0;
																											while($12[i]!='\0'){
																												$$[j]=$12[i];
																												i++;
																												j++;
																											}
																											$$[j]=' ';
																											j++;
																											i=0;
																											while($13[i]!='\0'){
																												$$[j]=$13[i];
																												i++;
																												j++;
																											}
																											$$[j]=' ';
																											j++;
																											i=0;
																											while($14[i]!='\0'){
																												$$[j]=$14[i];
																												i++;
																												j++;
																											}
																											$$[j]='\n';
																											j++;
																											i=0;
																											while($15[i]!='\0'){
																												$$[j]=$15[i];
																												i++;
																												j++;
																											}
				  																						};

Statementcatenation :  														{$$ = (char*)calloc(10,SIZE);$$="\0";}
			         |  Statement Statementcatenation  						    {
																			        int length=strlen($1)+strlen($2)+100;
																					$$ = (char*)calloc(length,SIZE); 
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																					$$[j]='\n';
																					j++;
																					i=0;
																					while($2[i]!='\0'){
																					$$[j]=$2[i];
																					i++;
																					j++;
																					}
																		        };  

CommaTypeIdentifiercatenation : 											{$$ = (char*)calloc(10,SIZE);$$="\0";}
						       | CommaTypeIdentifiercatenation CommaTypeIdentifier   {
																			        int length=strlen($1)+strlen($2)+100;
																					$$ = (char*)calloc(length,SIZE); 
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($2[i]!='\0'){
																						$$[j]=$2[i];
																						i++;
																						j++;
																					}
																		    };

CommaTypeIdentifier : COMMA Type Identifier                                   {
																			        int length=strlen($1)+strlen($2)+strlen($3)+100;
																					$$ = (char*)calloc(length,SIZE);
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($2[i]!='\0'){
																						$$[j]=$2[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($3[i]!='\0'){
																						$$[j]=$3[i];
																						i++;
																						j++;
																					}
																		      };


Statement : CURLYLEFTBRACE Statementcatenation CURLYRIGHTBRACE 		{
				  										                            int length=strlen($1)+strlen($2)+strlen($3)+100;
																					$$ = (char*)calloc(length,SIZE);
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																					$$[j]='\n';
																					j++;
																					i=0;
																					while($2[i]!='\0'){
																						$$[j]=$2[i];
																						i++;
																						j++;
																					}
																					$$[j]='\n';
																					j++;
																					i=0;
																					while($3[i]!='\0'){
																						$$[j]=$3[i];
																						i++;
																						j++;
																					}
																					$$[j]='\n';
				  													}							 
		  | Identifier EQUAL Expression SEMICOLON 						   {
				  						                                            int length=strlen($1)+strlen($2)+strlen($3)+strlen($4)+100;
																					$$ = (char*)calloc(length,SIZE);
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($2[i]!='\0'){
																						$$[j]=$2[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($3[i]!='\0'){
																						$$[j]=$3[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($4[i]!='\0'){
																						$$[j]=$4[i];
																						i++;
																						j++;
																					}
				  														   }		 
		  | SYSOUTPRINTLN NORMALLEFTBRACE Expression NORMALRIGHTBRACE SEMICOLON {
				  					                                                int length=strlen($1)+strlen($2)+strlen($3)+strlen($4)+strlen($5)+100;
																					$$ = (char*)calloc(length,SIZE);
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($2[i]!='\0'){
																						$$[j]=$2[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($3[i]!='\0'){
																						$$[j]=$3[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($4[i]!='\0'){
																						$$[j]=$4[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($5[i]!='\0'){
																						$$[j]=$5[i];
																						i++;
																						j++;
																					}
				  														   }	 
		    
		  | IF NORMALLEFTBRACE Expression NORMALRIGHTBRACE Statement 	{
				  																	int length=strlen($1)+strlen($2)+strlen($3)+strlen($4)+strlen($5)+100;
																					$$ = (char*)calloc(length,SIZE);
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($2[i]!='\0'){
																						$$[j]=$2[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($3[i]!='\0'){
																						$$[j]=$3[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($4[i]!='\0'){
																						$$[j]=$4[i];
																						i++;
																						j++;
																					}
																					$$[j]='\n';
																					j++;
																					i=0;
																					while($5[i]!='\0'){
																						$$[j]=$5[i];
																						i++;
																						j++;
																					}
																					$$[j]='\n';
				  														   } 
		  | IF NORMALLEFTBRACE Expression NORMALRIGHTBRACE Statement ELSE Statement 	{
		   																		    int length=strlen($1)+strlen($2)+strlen($3)+strlen($4)+strlen($5)+strlen($6)+strlen($7)+100;
																					$$ = (char*)calloc(length,SIZE);
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($2[i]!='\0'){
																						$$[j]=$2[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($3[i]!='\0'){
																						$$[j]=$3[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($4[i]!='\0'){
																						$$[j]=$4[i];
																						i++;
																						j++;
																					}
																					$$[j]='\n';
																					j++;
																					i=0;
																					while($5[i]!='\0'){
																						$$[j]=$5[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($6[i]!='\0'){
																						$$[j]=$6[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($7[i]!='\0'){
																						$$[j]=$7[i];
																						i++;
																						j++;
																					}
																					$$[j]='\n';
		   												  				   } 
		| Identifier SQLEFTBRACE Expression SQRIGHTBRACE EQUAL Expression SEMICOLON {
		   								                                            int length=strlen($1)+strlen($2)+strlen($3)+strlen($4)+strlen($5)+strlen($6)+strlen($7)+100;
																					$$ = (char*)calloc(length,SIZE);
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($2[i]!='\0'){
																						$$[j]=$2[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($3[i]!='\0'){
																						$$[j]=$3[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($4[i]!='\0'){
																						$$[j]=$4[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($5[i]!='\0'){
																						$$[j]=$5[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($6[i]!='\0'){
																						$$[j]=$6[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($7[i]!='\0'){
																						$$[j]=$7[i];
																						i++;
																						j++;
																					}													
		   																   }
		  | WHILE NORMALLEFTBRACE Expression NORMALRIGHTBRACE Statement   	{
				  																    int length=strlen($1)+strlen($2)+strlen($3)+strlen($4)+strlen($5)+100;
																					$$ = (char*)calloc(length,SIZE);
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($2[i]!='\0'){
																						$$[j]=$2[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($3[i]!='\0'){
																						$$[j]=$3[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($4[i]!='\0'){
																						$$[j]=$4[i];
																						i++;
																						j++;
																					}
																					$$[j]='\n';
																					j++;
																					i=0;
																					while($5[i]!='\0'){
																						$$[j]=$5[i];
																						i++;
																						j++;
																					}
																					$$[j]='\n';
				  														    } 
		  | MacroStatementExpressionQ 	 {
											                                        int length=strlen($1)+50;
																					$$ = (char*)calloc(length,SIZE);
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					} 
																					$$[j]='\n';
																		   };
Type : INT SQLEFTBRACE SQRIGHTBRACE  	{
		  															                int len=strlen($1)+strlen($2)+strlen($3)+50;
																					$$ = (char*)calloc(len,SIZE);
																	                int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($2[i]!='\0'){
																						$$[j]=$2[i];
																						i++;
																						j++;
																					}																					
																					i=0;
																					while($3[i]!='\0'){
																						$$[j]=$3[i];
																						i++;
																						j++;
																					}
				  									}
	 | BOOL  															{           
		                                                                            int len=strlen($1)+20;
																					$$ = (char*)calloc(len,SIZE); 
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																		}
	 | INT   															{
												                                    int len=strlen($1)+20;
																					$$ = (char*)calloc(len,SIZE); 
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																		}
	 | Identifier  														{
										                                    		int len=strlen($1)+20;
																					$$ = (char*)calloc(len,SIZE); 
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																		};

MacroStatementExpressionQ : Identifier NORMALLEFTBRACE NORMALRIGHTBRACE SEMICOLON 						   			{ 
																														$$ = replacing_macro($1,NULL,1);
																														}							 
			  				 | Identifier NORMALLEFTBRACE Expression CommaExpressioncatenation NORMALRIGHTBRACE SEMICOLON 	{
				                                   int len=strlen($3)+strlen($4)+50;
			   									   char* haha=(char*)calloc(len,SIZE);
															  sprintf(haha,"%s%s",$3,$4);
															   $$ = replacing_macro($1,haha,1);
			   																		};



Expression : PrimaryExpression AND PrimaryExpression 					{
				  															        int len=strlen($1)+strlen($2)+strlen($3)+50;
																					$$ = (char*)calloc(len,SIZE);
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($2[i]!='\0'){
																						$$[j]=$2[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;																					
																					i=0;
																					while($3[i]!='\0'){
																						$$[j]=$3[i];
																						i++;
																						j++;
																					}
				  														}	 
		  
		   | PrimaryExpression PLUS PrimaryExpression 		 			{				  															
				  									                                int len=strlen($1)+strlen($2)+strlen($3)+50;
																					$$ = (char*)calloc(len,SIZE);
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($2[i]!='\0'){
																						$$[j]=$2[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;																					
																					i=0;
																					while($3[i]!='\0'){
																						$$[j]=$3[i];
																						i++;
																						j++;
																					}
				  														}
		   | PrimaryExpression MINUS PrimaryExpression  				{				  								
				  																	int len=strlen($1)+strlen($2)+strlen($3)+50;
																					$$ = (char*)calloc(len,SIZE);
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($2[i]!='\0'){
																						$$[j]=$2[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;																					
																					i=0;
																					while($3[i]!='\0'){
																						$$[j]=$3[i];
																						i++;
																						j++;
																					}
				  														}
		   | PrimaryExpression OR PrimaryExpression  					{
				  					                                                int len=strlen($1)+strlen($2)+strlen($3)+50;
																					$$ = (char*)calloc(len,SIZE);
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($2[i]!='\0'){
																						$$[j]=$2[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;																					
																					i=0;
																					while($3[i]!='\0'){
																						$$[j]=$3[i];
																						i++;
																						j++;
																					}
				  														}
		   | PrimaryExpression NEQ PrimaryExpression 	 			{
				  				                                                   	int len=strlen($1)+strlen($2)+strlen($3)+50;
																					$$ = (char*)calloc(len,SIZE);
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($2[i]!='\0'){
																						$$[j]=$2[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;																					
																					i=0;
																					while($3[i]!='\0'){
																						$$[j]=$3[i];
																						i++;
																						j++;
																					}
				  														}
			 | PrimaryExpression LESSTHANEQUAL PrimaryExpression 		 	{
				  																	int len=strlen($1)+strlen($2)+strlen($3)+50;
																					$$ = (char*)calloc(len,SIZE);
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($2[i]!='\0'){
																						$$[j]=$2[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;																					
																					i=0;
																					while($3[i]!='\0'){
																						$$[j]=$3[i];
																						i++;
																						j++;
																					}
				  														} 	 
		   | PrimaryExpression MUL PrimaryExpression 		 			{
				  																	int len=strlen($1)+strlen($2)+strlen($3)+50;
																					$$ = (char*)calloc(len,SIZE);
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($2[i]!='\0'){
																						$$[j]=$2[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;																					
																					i=0;
																					while($3[i]!='\0'){
																						$$[j]=$3[i];
																						i++;
																						j++;
																					}
				  														}
		  
		   | PrimaryExpression SQLEFTBRACE PrimaryExpression SQRIGHTBRACE  		{
			 																		int len=strlen($1)+strlen($2)+strlen($3)+strlen($4)+50;
				  																	$$ = (char*)calloc(len,SIZE);
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($2[i]!='\0'){
																						$$[j]=$2[i];
																						i++;
																						j++;
																					}
																					i=0;
																					while($3[i]!='\0'){
																						$$[j]=$3[i];
																						i++;
																						j++;
																					}
																					i=0;
																					while($4[i]!='\0'){
																						$$[j]=$4[i];
																						i++;
																						j++;
																					}

				  														}
		   | PrimaryExpression LENGTH 					 			{               
			                                                                        int len=strlen($1)+strlen($2)+40;
																					$$ = (char*)calloc(len,SIZE); 
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}																					
																					i=0;
																					while($2[i]!='\0'){
																						$$[j]=$2[i];
																						i++;
																						j++;
																					}
																					sprintf($$,"%s%s",$1,$2);
																		}
		    | PrimaryExpression DIV PrimaryExpression 		 			{
				  																	int len=strlen($1)+strlen($2)+strlen($3)+50;
																					$$ = (char*)calloc(len,SIZE);
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($2[i]!='\0'){
																						$$[j]=$2[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;																					
																					i=0;
																					while($3[i]!='\0'){
																						$$[j]=$3[i];
																						i++;
																						j++;
																					}
				  														}
		   | PrimaryExpression											{
													                                int len=strlen($1)+20;
																					$$ = (char*)calloc(len,SIZE); 
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																		}
		   | PrimaryExpression DOT Identifier NORMALLEFTBRACE NORMALRIGHTBRACE 	 {
																					int len=strlen($1)+strlen($2)+strlen($3)+strlen($4)+strlen($5)+100;
																					$$ = (char*)calloc(len,SIZE);
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																					i=0;
																					while($2[i]!='\0'){
																						$$[j]=$2[i];
																						i++;
																						j++;
																					}																					
																					i=0;
																					while($3[i]!='\0'){
																						$$[j]=$3[i];
																						i++;
																						j++;
																					}
																					i=0;
																					while($4[i]!='\0'){
																						$$[j]=$4[i];
																						i++;
																						j++;
																					}																					
																					i=0;
																					while($5[i]!='\0'){
																						$$[j]=$5[i];
																						i++;
																						j++;
																					}
				  														}
		   | PrimaryExpression DOT Identifier NORMALLEFTBRACE Expression CommaExpressioncatenation NORMALRIGHTBRACE 	{
			 																		int len=strlen($1)+strlen($2)+strlen($3)+strlen($4)+strlen($5)+strlen($6)+strlen($7)+100;
		   															      			$$ = (char*)calloc(len,SIZE);
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																					i=0;
																					while($2[i]!='\0'){
																						$$[j]=$2[i];
																						i++;
																						j++;
																					}																					
																					i=0;
																					while($3[i]!='\0'){
																						$$[j]=$3[i];
																						i++;
																						j++;
																					}
																					i=0;
																					while($4[i]!='\0'){
																						$$[j]=$4[i];
																						i++;
																						j++;
																					}	
																					$$[j]=' ';
																					j++;																				
																					i=0;
																					while($5[i]!='\0'){
																						$$[j]=$5[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;																				
																					i=0;
																					while($6[i]!='\0'){
																						$$[j]=$6[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;																				
																					i=0;
																					while($7[i]!='\0'){
																						$$[j]=$7[i];
																						i++;
																						j++;
																					}
		   															} 
		   | MacroExpression 								 			{
																					int len=strlen($1)+20;
																					$$ = (char*)calloc(len,SIZE); 
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
												};

MacroExpression : Identifier NORMALLEFTBRACE Expression CommaExpressioncatenation NORMALRIGHTBRACE  {
																					int len=strlen($3)+strlen($4)+40;
																			char* haha=(char*)calloc(len,SIZE);
																			sprintf(haha,"%s%s",$3,$4);
																			$$ = replacing_macro($1,haha,0);
																		 }
				 | Identifier NORMALLEFTBRACE NORMALRIGHTBRACE 								 { 
				                                                                               $$ = replacing_macro($1,NULL,0);
																							  };



CommaExpressioncatenation : 	 												{$$ = (char*)calloc(10,SIZE);$$="\0";}
					|CommaExpressioncatenation CommaExpression  	{
																					int len=strlen($1)+strlen($2)+5;
																					$$ = (char*)calloc(len,SIZE); 
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																					i=0;
																					while($2[i]!='\0'){
																						$$[j]=$2[i];
																						i++;
																						j++;
																					}
																		};

CommaExpression : COMMA Expression 										{
																					int len=strlen($1)+strlen($2)+5;
																					$$ = (char*)calloc(len,SIZE); 
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																					i=0;
																					while($2[i]!='\0'){
																						$$[j]=$2[i];
																						i++;
																						j++;
																					}
															};					 

PrimaryExpression : NUMBER 												{
																			        int len=strlen($1)+10;
																					$$ = (char*)calloc(len,SIZE); 
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																		}
				  | TRUE 								 				{
																					int len=strlen($1)+10;
																					$$ = (char*)calloc(len,SIZE); 
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																		}
				  | FALSE 								 				{
																					int len=strlen($1)+10;
																					$$ = (char*)calloc(len,SIZE); 
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																		}
				  | Identifier  						 				{
																					int len=strlen($1)+10;
																					$$ = (char*)calloc(len,SIZE); 
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																		}
				  | THIS								 				{
																					int len=strlen($1)+10;
																					$$ = (char*)calloc(len,SIZE); 
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																		}
				  | NEW INT SQLEFTBRACE Expression SQRIGHTBRACE  	 {
				  		                                                            int len=strlen($1)+strlen($2)+strlen($3)+strlen($4)+strlen($5)+100;
																					$$ = (char*)calloc(len,SIZE);
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($2[i]!='\0'){
																						$$[j]=$2[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($3[i]!='\0'){
																						$$[j]=$3[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($4[i]!='\0'){
																						$$[j]=$4[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($5[i]!='\0'){
																						$$[j]=$5[i];
																						i++;
																						j++;
																					}
				  														}
				  | NEW Identifier NORMALLEFTBRACE NORMALRIGHTBRACE         {
				  																	
																					int len=strlen($1)+strlen($2)+strlen($3)+strlen($4)+60;
																					$$ = (char*)calloc(len,SIZE);
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($2[i]!='\0'){
																						$$[j]=$2[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($3[i]!='\0'){
																						$$[j]=$3[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($4[i]!='\0'){
																						$$[j]=$4[i];
																						i++;
																						j++;
																					}
				  														}
				  | NOT Expression  					 				{
																		    		int len=strlen($1)+strlen($2)+40;
																					$$ = (char*)calloc(len,SIZE); 
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																					i=0;
																					while($2[i]!='\0'){
																						$$[j]=$2[i];
																						i++;
																						j++;
																					}
																		}
				  | NORMALLEFTBRACE Expression NORMALRIGHTBRACE             {
																					int len=strlen($1)+strlen($2)+strlen($3)+50;
																					$$ = (char*)calloc(len,SIZE);
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($2[i]!='\0'){
																						$$[j]=$2[i];
																						i++;
																						j++;
																					}
																					$$[j]=' ';
																					j++;
																					i=0;
																					while($3[i]!='\0'){
																						$$[j]=$3[i];
																						i++;
																						j++;
																					}
																		};

Identifier : IDENTIFIER    												{
																					int len=strlen($1)+10;
																					$$ = (char*)calloc(len,SIZE); 
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																		};

MacroDefinition : MacroDefExpression
				| MacroDefStatement ;

MacroDefStatement  : DefineStmt0 Identifier NORMALLEFTBRACE NORMALRIGHTBRACE CURLYLEFTBRACE Statementcatenation CURLYRIGHTBRACE	
                                           {
												int len=strlen($6)+50;
												char* haha=(char*)calloc(len,SIZE);
												sprintf(haha,"%s",$6);
												registering_macro($2,NULL,haha,1);
										   }
				   | DefineStmt1 Identifier NORMALLEFTBRACE Identifier NORMALRIGHTBRACE CURLYLEFTBRACE Statementcatenation CURLYRIGHTBRACE					
				                           {
												int len1=strlen($7)+60;
												char* haha=(char*)calloc(len1,SIZE); 
												sprintf(haha,"%s",$7);
												int len2=strlen($4)+40;
												char* hehe=(char*)calloc(len2,SIZE);
												sprintf(hehe,"%s",$4);
										        registering_macro($2,hehe,haha,1);
					   						}

				   | DefineStmt2 Identifier NORMALLEFTBRACE Identifier COMMA Identifier NORMALRIGHTBRACE CURLYLEFTBRACE Statementcatenation CURLYRIGHTBRACE	
				                            {
					   							int len1=strlen($9)+100;
												char* haha=(char*)calloc(len1,SIZE);
												sprintf(haha,"%s",$9);
												int len2=strlen($4)+strlen($5)+strlen($6)+50;							 																													
												char* hehe=(char*)calloc(len2,SIZE);
												sprintf(hehe,"%s%s%s",$4,$5,$6);													 
												registering_macro($2,hehe,haha,1);
				   							}


				   | DefineStmt Identifier NORMALLEFTBRACE Identifier CommaIdentifiercatenation NORMALRIGHTBRACE CURLYLEFTBRACE Statementcatenation CURLYRIGHTBRACE 	
				                           {    
											    int len1=strlen($4)+strlen($5)+50;
												char* haha=(char*)calloc(len1,SIZE);
												sprintf(haha,"%s%s",$4,$5);
												int len2=strlen($8)+60;
												char* hehe=(char*)calloc(len2,SIZE);
												sprintf(hehe,"%s",$8);										 
												registering_macro($2,haha,hehe,1);
										    };

CommaIdentifiercatenation :   											{$$ = (char*)calloc(10,SIZE);$$="\0";}
					|  CommaIdentifiercatenation CommaIdentifier               {
																			        int len=strlen($1)+strlen($2);
																					$$ = (char*)calloc(len,SIZE); 
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																					i=0;
																					while($2[i]!='\0'){
																						$$[j]=$2[i];
																						i++;
																						j++;
																					}
																	};

CommaIdentifier : COMMA Identifier  						{
																					int len=strlen($1)+strlen($2);
																					$$ = (char*)calloc(len,SIZE); 
																					int i=0,j=0;
																					while($1[i]!='\0'){
																						$$[j]=$1[i];
																						i++;
																						j++;
																					}
																					i=0;
																					while($2[i]!='\0'){
																						$$[j]=$2[i];
																						i++;
																						j++;
																					}
															};

MacroDefExpression : DefineExpr0 Identifier NORMALLEFTBRACE NORMALRIGHTBRACE NORMALLEFTBRACE Expression NORMALRIGHTBRACE 	 
											{	
												int len=strlen($6)+50;
												char* haha=(char*)calloc(len,SIZE);
												sprintf(haha,"%s%s%s","(",$6,")");
												registering_macro($2,NULL,haha,0);
											}
				   | DefineExpr1 Identifier NORMALLEFTBRACE Identifier NORMALRIGHTBRACE NORMALLEFTBRACE Expression NORMALRIGHTBRACE     
				   							{   
												int len1=strlen($7)+50;
												char* haha=(char*)calloc(len1,SIZE);
												sprintf(haha,"%s%s%s","(",$7,")");
												int len2=strlen($4)+40;
												char* hehe=(char*)calloc(len2,SIZE); 
												sprintf(hehe,"%s",$4);
												registering_macro($2,hehe,haha,0);
					   						}
 				   | DefineExpr2 Identifier NORMALLEFTBRACE Identifier COMMA Identifier NORMALRIGHTBRACE NORMALLEFTBRACE Expression NORMALRIGHTBRACE         
				   							{	
												int len1=strlen($9)+50;
												char* haha=(char*)calloc(len1,SIZE);
												sprintf(haha,"%s%s%s","(",$9,")");
												int len2=strlen($4)+strlen($5)+strlen($6)+50;
												char* hehe=(char*)calloc(len2,SIZE);
												sprintf(hehe,"%s%s%s",$4,$5,$6);
												registering_macro($2,hehe,haha,0);
				   							}

				   | DefineExpr Identifier NORMALLEFTBRACE Identifier CommaIdentifiercatenation NORMALRIGHTBRACE NORMALLEFTBRACE Expression NORMALRIGHTBRACE  		
				                            {
												int len1=strlen($4)+strlen($5)+40;
												char* hehe=(char*)calloc(len1,SIZE);
												sprintf(hehe,"%s%s",$4,$5);
												int len2=strlen($8)+40;
												char* haha=(char*)calloc(len2,SIZE);
												sprintf(haha,"%s%s%s","(",$8,")");
												registering_macro($2,hehe,haha,0);
											};  
		           

 
%%



void registering_macro(char *idenf,char* args,char *replace, int typ){
	
	char* arguments[1000];
	int appearenceargu[1000];
	for(int i=0;i<1000;i++){
		appearenceargu[i]=0;
	}
	
	for(int i=0;i<1000;i++){
		arguments[i]=(char*)calloc(1000,SIZE);
	}
    for(int i=0; i<mycount; i++)
	{
		if(strcmp(idenf,breaking[i][1]) == 0)
			{
				printf("failed to parse");
				exit(0);
			}
	}
	
	breaking[mycount][0]=(char*)calloc(1,SIZE);
	sprintf(breaking[mycount][0],"%d",typ);
	
	breaking[mycount][1]=idenf;
	
	int k=0;
	int l=0;
	if(args==NULL){
		args=(char*)calloc(1,SIZE);
	}else{
		k=1;
		int m=0;
		int n=0;
		while(args[l]!='\0'){
			if(args[l]==','){
				k++;
				m++;
				n=0;
			}else{
				arguments[m][n]=args[l];
				n++;
			}
			l++;
		}
	}
	breaking[mycount][2]=(char*)calloc(10,SIZE);
	sprintf(breaking[mycount][2],"%d",k);
	
	l=0;
	breaking[mycount][3]=replace;
	while(replace[l]!='\0'){
		l++;
	}

	
	int fromto[1000][1000];
	if(k>=1){
		int flag=0;
		int BOOL[1000][1000];
		for(int i=0;i<1000;i++){
			for(int j=0;j<1000;j++){
				BOOL[i][j]=0;
			}
		}
		int totalfromtos=0;
		for(int i=0;i<k;i++){
			int len=0;
			while(arguments[i][len]!='\0'){
				len++;
			}
			for(int j=0;j<l;j++){
				int b=0;
				for(int a=j;a<l&&a<j+len;a++){
					if(replace[a]==arguments[i][b]){
						b++;
					}
				}
				if(b==len){
					int d=appearenceargu[i];
					appearenceargu[i]=d+1;
					fromto[i][2*d]=j;
					
					fromto[i][2*d+1]=j+len-1;
					BOOL[i][d]=1;
					totalfromtos++;
				}
			}
		}
		char *hehe=(char*)calloc(10,SIZE);
		sprintf(hehe,"%d",2*totalfromtos+1);
		breaking[mycount][4]=hehe;
		
		int stringallocfromto[totalfromtos][3];
		for(int c=0;c<totalfromtos;c++){
			int mini,minj,argno;
			for(int i=0;i<k;i++){
				if(appearenceargu[i]>0){
					for(int j=0;j<appearenceargu[i];j++){
						if(BOOL[i][j]==1){
							if(flag==0){
								mini=fromto[i][2*j];
								minj=fromto[i][2*j+1];
								argno=i;
								flag=1;
							}else{
								if(mini>fromto[i][2*j]){
									mini=fromto[i][2*j];
									minj=fromto[i][2*j+1];
									argno=i;
								}
							}
						}
					}
				}
			}
		    BOOL[mini][minj]=0;
		    stringallocfromto[c][0]=mini;
			stringallocfromto[c][1]=minj;
			stringallocfromto[c][2]=argno;
			flag=0;
		}
		for(int i=5,c=0;i<5+2*totalfromtos+1;i++){
			if(i%2==1){
				if(c<=totalfromtos){
					char *haha=(char*)calloc(1000,SIZE);
					if(c==0){
						for(int j=0,d=0;j<stringallocfromto[c][0];j++){
							haha[d]=replace[j];
							d++;
						}
						c++;
					}else{
						for(int j=stringallocfromto[c-1][1]+1,d=0;j<l;j++){
							if(c==totalfromtos){
								haha[d]=replace[j];
								d++;
							}else{
								if(stringallocfromto[c][0]>j){
									haha[d]=replace[j];
									d++;
								}else{
									break;
								}
							}
							
						}
						c++;
					}
					breaking[mycount][i]=haha;
					
				}
			}else{
				char* haha=(char*)calloc(10,SIZE);
				sprintf(haha,"%d",stringallocfromto[c-1][2]);
				breaking[mycount][i]=haha;
			}
		}
		
	}
	

	mycount++;

}

char* replacing_macro(char *id,char *args,int typ){
	char* length=(char*)calloc(10,SIZE);
	char* arguments[1000];
	for(int i=0;i<1000;i++){
		arguments[i]=(char*)calloc(1000,SIZE);
	}
	int k=0;
	int l=0;
	if(args==NULL){
		args=(char*)calloc(1,SIZE);
	}else{
		k=1;
		int m=0;
		int n=0;
		while(args[l]!='\0'){
			if(args[l]==','){
				k++;
				m++;
				n=0;
			}else{
				arguments[m][n]=args[l];
				n++;
			}
			l++;
		}
	}
	char* type=(char*)calloc(1,SIZE);
	sprintf(type,"%d",typ);
	sprintf(length,"%d",k);
	int i=0;
	for(;i<mycount;i++){
		int m=atoi(breaking[i][2]);
		if(strcmp(breaking[i][0],type)==0 && strcmp(breaking[i][1],id)==0 && m==k){
			break;
		}
	}
	if(i==mycount){
		printf("failed to parse\n");
		exit(0);
	}else{
		if(k>=1){
			char *ans=(char*)calloc(5000,SIZE);
			int p=atoi(breaking[i][4]);
			strcpy(ans,breaking[i][5]);
			for(int j=6;j<5+p;j++){
				if(j%2==0){
					int q=atoi(breaking[i][j]);
					strcat(ans,arguments[q]);
				}else{
					strcat(ans,breaking[i][j]);
				}
			}
			return ans;
		}
		return breaking[i][3];
	}
}

void yyerror(char *str) {
	printf("failed to parse");
}

int main(){
 yyparse();
}
#include "lex.yy.c"

