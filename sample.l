%{
// This is the definition section
// In this section you can declare variables/data structures
// which can be accessed inside yylex()
    char keys[50][50];
    int keys_index = 0;

    char seps[50][50];
    int seps_index = 0;

    char ids[50][50];
    int ids_index = 0;

    char ops[50][50];
    int ops_index = 0;

    char ints[50][50];
    int ints_index = 0;

    char reals[50][50];
    int reals_index = 0;

    char puncs[50][50];
    int puncs_index = 0;

    char strs[50][50];
    int strs_index = 0;

    char cmts[50][50];
    int cmts_index = 0;

%}

/*The following section is the Rule section*/
/*Here you will write your regex as well as commands that will be ran according*/
/*to your regex*/
%%
"//"[a-zA-Z0-9]*[" "][a-zA-Z0-9]* {printf("comment:  %s\n", yytext);
                                   strcpy(cmts[cmts_index], yytext);
                                   cmts_index++;}
char|double|float|int|while|for|cout|return|if {printf("keyword:  %s\n", yytext);
                           strcpy(keys[keys_index], yytext);
                           keys_index++;}
"\""([a-zA-Z0-9!?.]|[" "])*"\"" {printf("string:  %s\n", yytext);
                                 strcpy(strs[strs_index], yytext);
                                 strs_index++;}
[(){}] {printf("separator:  %s\n", yytext);
      strcpy(seps[seps_index], yytext);
      seps_index++;}
[a-zA-Z_][a-zA-Z0-9_]* {printf("identifier: %s\n", yytext);
                    strcpy(ids[ids_index],yytext);
                    ids_index++;}
"+"|"-"|"/"|"*"|"="|"<"|">"|"<="|">="|"=="|"<<"|">>" {printf("operator:  %s\n", yytext);
                                            strcpy(ops[ops_index], yytext);
                                            ops_index++;}
[0-9]+ {printf("integer: %s\n", yytext);
        strcpy(ints[ints_index], yytext);
        ints_index++;}
[0-9]+["."][0-9]+ {printf("real: %s\n", yytext);
        strcpy(reals[reals_index], yytext);
        reals_index++;}
";" {printf("punctuation: %s\n", yytext);
        strcpy(puncs[puncs_index], yytext);
        puncs_index++;}
end return 0;
%%

int yywrap() {}


//The following section is the User routines Section
//Here is where you can write regular C code to manipulate
//the results of your lexer
int main() {
    yylex(); //runs the 'Rule' sections
    FILE * fp; //creates a pointer to a file, fp
    fp = fopen("output.txt", "w+"); //opens the file, fp
    fprintf(fp, "\n");
    fprintf(fp, "token               lexeme\n");
    fprintf(fp, "__________________________\n");

    //print keywords
    fprintf(fp, "keyword            ");
    for (int i = 0; i < 50; i++){
        fprintf(fp, "%s,", keys[i]);
        if (strlen(keys[i+1]) < 1){
            break;
        }

    }

    //print seperators
    fprintf(fp, "\n");
    fprintf(fp, "seperator            ");
    for (int i = 0; i < 50; i++){
        fprintf(fp, "%s", seps[i]);
        if (strlen(seps[i+1]) < 1){
            break;
        }
        fprintf(fp, ",");
    }
    //print identifiers
    fprintf(fp, "\n");
    fprintf(fp, "identifier            ");
    for (int i = 0; i < 50; i++){
        fprintf(fp, "%s", ids[i]);
        if (strlen(ids[i+1]) < 1){
            break;
        }
        fprintf(fp, ",");
    }
    //print operators
    fprintf(fp, "\n");
    fprintf(fp, "operator            ");
    for (int i = 0; i < 50; i++){
        fprintf(fp, "%s", ops[i]);
        if (strlen(ops[i+1]) < 1){
            break;
        }
        fprintf(fp, ",");
    }

    //print integers
    fprintf(fp, "\n");
    fprintf(fp, "integer            ");
    for (int i = 0; i < 50; i++){
        fprintf(fp, "%s", ints[i]);
        if (strlen(ints[i+1]) < 1){
            break;
        }
        fprintf(fp, ",");
    }

    //print reals
    fprintf(fp, "\n");
    fprintf(fp, "real            ");
    for (int i = 0; i < 50; i++){
        fprintf(fp, "%s", reals[i]);
        if (strlen(reals[i+1]) < 1){
            break;
        }
        fprintf(fp, ",");
    }

    //print punctuations
    fprintf(fp, "\n");
    fprintf(fp, "punctuation            ");
    for (int i = 0; i < 50; i++){
        fprintf(fp, "%s", puncs[i]);
        if (strlen(puncs[i+1]) < 1){
            break;
        }
        fprintf(fp, ",");
    }

    //print strings
    fprintf(fp, "\n");
    fprintf(fp, "string            ");
    for (int i = 0; i < 50; i++){
        fprintf(fp, "%s", strs[i]);
        if (strlen(strs[i+1]) < 1){
            break;
        }
        fprintf(fp, ",");
    }

    //print strings
    fprintf(fp, "\n");
    fprintf(fp, "comment            ");
    for (int i = 0; i < 50; i++){
        fprintf(fp, "%s", cmts[i]);
        if (strlen(cmts[i+1]) < 1){
            break;
        }
        fprintf(fp, ",");
    }


    fclose(fp);
    return 0;
}
