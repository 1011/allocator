#ifndef lint
static const char yysccsid[] = "@(#)yaccpar	1.9 (Berkeley) 02/21/93";
#endif

#define YYBYACC 1
#define YYMAJOR 1
#define YYMINOR 9
#define YYPATCH 20130304

#define YYEMPTY        (-1)
#define yyclearin      (yychar = YYEMPTY)
#define yyerrok        (yyerrflag = 0)
#define YYRECOVERING() (yyerrflag != 0)

#define YYPREFIX "yy"

#define YYPURE 0

#line 32 "iloc.y"
  #include <stdio.h>
  #include <string.h>
  #include "instruction.h"

  #define MAX_ERROR_MESSAGE_LENGTH 100

  Operands* new_operands(void);
  Operand* append_operands(Operand*,Operand*);
  int verify_args(Opcode*,int,int,int,int);

  extern char yytext[];

  extern int line_counter;
  extern Opcode* current_opcode;

  /* This function must be defined */
  void yyerror(char*);

  /* If an error is encountered during parsing this is changed to 1 */
  int error_found = 0;

  /* Pointer to the first instruction */
  Instruction* first_instruction;

#line 69 "iloc.y"
#ifdef YYSTYPE
#undef  YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
#endif
#ifndef YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
typedef union {
    int ival;
    Instruction* inst_ptr;
    Operation* op_ptr;
    Operands* operands_ptr;
    Operand* operand_ptr;
    Opcode* opcode_ptr;
  char* label_ptr;
} YYSTYPE;
#endif /* !YYSTYPE_IS_DECLARED */
#line 61 "y.tab.c"

/* compatibility with bison */
#ifdef YYPARSE_PARAM
/* compatibility with FreeBSD */
# ifdef YYPARSE_PARAM_TYPE
#  define YYPARSE_DECL() yyparse(YYPARSE_PARAM_TYPE YYPARSE_PARAM)
# else
#  define YYPARSE_DECL() yyparse(void *YYPARSE_PARAM)
# endif
#else
# define YYPARSE_DECL() yyparse(void)
#endif

/* Parameters sent to lex. */
#ifdef YYLEX_PARAM
# define YYLEX_DECL() yylex(void *YYLEX_PARAM)
# define YYLEX yylex(YYLEX_PARAM)
#else
# define YYLEX_DECL() yylex(void)
# define YYLEX yylex()
#endif

/* Parameters sent to yyerror. */
#ifndef YYERROR_DECL
#define YYERROR_DECL() yyerror(const char *s)
#endif
#ifndef YYERROR_CALL
#define YYERROR_CALL(msg) yyerror(msg)
#endif

extern int YYPARSE_DECL();

#define OPEN_BRACKET 257
#define CLOSE_BRACKET 258
#define SEMICOLON 259
#define COMMA 260
#define ARROW 261
#define OPCODE 262
#define OUTPUT 263
#define REGISTER 264
#define NUMBER 265
#define LABEL 266
#define TARGET 267
#define YYERRCODE 256
static const short yylhs[] = {                           -1,
    0,    1,    1,    1,    1,    2,    2,    3,    3,    4,
    4,    4,    4,    5,    6,    6,    6,    6,    6,    6,
    7,    8,    9,   10,
};
static const short yylen[] = {                            2,
    1,    1,    2,    2,    3,    1,    3,    1,    3,    4,
    2,    3,    1,    1,    1,    3,    1,    3,    1,    3,
    1,    1,    1,    1,
};
static const short yydefred[] = {                         0,
    0,   14,   24,    0,    1,    0,    6,    0,    0,    0,
    0,    4,    0,   21,   22,   23,    0,    0,    0,    0,
    0,    7,    0,   12,    0,    0,    0,    0,    5,    9,
   10,   16,   18,   20,
};
static const short yydgoto[] = {                          4,
    5,    6,   10,    7,    8,   17,   18,   19,   20,    9,
};
static const short yysindex[] = {                      -255,
 -259,    0,    0,    0,    0, -255,    0, -236, -252, -247,
 -253,    0, -233,    0,    0,    0, -248, -246, -240, -237,
 -255,    0, -259,    0, -233, -233, -233, -233,    0,    0,
    0,    0,    0,    0,
};
static const short yyrindex[] = {                         0,
    0,    0,    0,    0,    0,   26,    0,   21,    0,    0,
 -224,    0,    0,    0,    0,    0,   27,    1,    8,   15,
   35,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,
};
static const short yygindex[] = {                         0,
    3,   28,   13,   -1,    0,   -9,    0,    0,    0,    0,
};
#define YYTABLESIZE 294
static const short yytable[] = {                         11,
   15,    1,    2,   24,    1,   23,    2,   17,   12,    2,
   22,    3,   25,   26,   19,   31,   32,   33,   34,   27,
   13,   11,   28,   29,   13,    2,   11,   14,   15,   16,
   14,   15,   16,    8,    3,   30,   21,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,   15,   15,   15,
    0,   15,   15,    0,   17,   17,   17,   15,   17,   17,
    0,   19,   19,   19,   17,   19,   19,   13,   13,   13,
    0,   19,   13,   11,   11,   11,    0,   13,   11,    0,
    0,    0,    0,   11,
};
static const short yycheck[] = {                          1,
    0,  257,  262,   13,  257,  259,  262,    0,    6,  262,
  258,  267,  261,  260,    0,   25,   26,   27,   28,  260,
    0,   23,  260,   21,  261,    0,    0,  264,  265,  266,
  264,  265,  266,  258,    0,   23,    9,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,  257,  258,  259,
   -1,  261,  262,   -1,  257,  258,  259,  267,  261,  262,
   -1,  257,  258,  259,  267,  261,  262,  257,  258,  259,
   -1,  267,  262,  257,  258,  259,   -1,  267,  262,   -1,
   -1,   -1,   -1,  267,
};
#define YYFINAL 4
#ifndef YYDEBUG
#define YYDEBUG 1
#endif
#define YYMAXTOKEN 267
#if YYDEBUG
static const char *yyname[] = {

"end-of-file",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"OPEN_BRACKET","CLOSE_BRACKET",
"SEMICOLON","COMMA","ARROW","OPCODE","OUTPUT","REGISTER","NUMBER","LABEL",
"TARGET",
};
static const char *yyrule[] = {
"$accept : iloc_program",
"iloc_program : instruction_list",
"instruction_list : instruction",
"instruction_list : label_def instruction",
"instruction_list : instruction instruction_list",
"instruction_list : label_def instruction instruction_list",
"instruction : operation",
"instruction : OPEN_BRACKET operation_list CLOSE_BRACKET",
"operation_list : operation",
"operation_list : operation SEMICOLON operation_list",
"operation : the_opcode operand_list ARROW operand_list",
"operation : the_opcode operand_list",
"operation : the_opcode ARROW operand_list",
"operation : the_opcode",
"the_opcode : OPCODE",
"operand_list : reg",
"operand_list : reg COMMA operand_list",
"operand_list : const",
"operand_list : const COMMA operand_list",
"operand_list : lbl",
"operand_list : lbl COMMA operand_list",
"reg : REGISTER",
"const : NUMBER",
"lbl : LABEL",
"label_def : TARGET",

};
#endif

int      yydebug;
int      yynerrs;

int      yyerrflag;
int      yychar;
YYSTYPE  yyval;
YYSTYPE  yylval;

/* define the initial stack-sizes */
#ifdef YYSTACKSIZE
#undef YYMAXDEPTH
#define YYMAXDEPTH  YYSTACKSIZE
#else
#ifdef YYMAXDEPTH
#define YYSTACKSIZE YYMAXDEPTH
#else
#define YYSTACKSIZE 10000
#define YYMAXDEPTH  500
#endif
#endif

#define YYINITSTACKSIZE 500

typedef struct {
    unsigned stacksize;
    short    *s_base;
    short    *s_mark;
    short    *s_last;
    YYSTYPE  *l_base;
    YYSTYPE  *l_mark;
} YYSTACKDATA;
/* variables for the parser stack */
static YYSTACKDATA yystack;
#line 299 "iloc.y"
 /* Support Code */

/* Create a new initialized Operands structure */
Operands* new_operands()
{
  Operands* operands_ptr = (Operands *) malloc(sizeof(Operands));
    operands_ptr->num_regs = 0;
    operands_ptr->regs = NULL;
    operands_ptr->num_consts = 0;
    operands_ptr->consts = NULL;
    operands_ptr->num_labels = 0;
    operands_ptr->labels = NULL;
    
    return(operands_ptr);
}

/* Append the second list of operands to the end of the first */
Operand* append_operands(Operand* list1, Operand* list2)
{
    Operand* start = list1;

    if (!list1)
	return list2;
    
    while(list1->next)
	list1 = list1->next;

    list1->next = list2;

    for (list1 = start; list1->next; list1 = list1->next) {
      printf ("list of appended operands:  %i\t", list1->value);
    }

    return(start);
}

/* Make sure that the operation was called with the correct number and type
   of arguments */
int verify_args(Opcode* operation,int srcs, int consts, int labels, int defs)
{
    char* error_message;

    if (operation->srcs != srcs)
    {
        error_message = malloc(MAX_ERROR_MESSAGE_LENGTH*sizeof(char));
	sprintf(error_message,"%s used with incorrect number of source registers",
		operation->string);
	yyerror(error_message);
	free(error_message);
	return 0;
    }
    
    if (operation->consts != consts)
    {
        error_message = malloc(MAX_ERROR_MESSAGE_LENGTH*sizeof(char));
	sprintf(error_message,"%s used with incorrect number of constants",
		operation->string);
	yyerror(error_message);
	free(error_message);
	return 0;
    }

    if (operation->labels != labels)
    {
        error_message = malloc(MAX_ERROR_MESSAGE_LENGTH*sizeof(char));
	sprintf(error_message,"%s used with incorrect number of labels",
		operation->string);
	yyerror(error_message);
	free(error_message);
	return 0;
    }

    if (operation->defs != defs)
    {
        error_message = malloc(MAX_ERROR_MESSAGE_LENGTH*sizeof(char));
	sprintf(error_message,"%s used with incorrect number of defined registers",
		operation->string);
	yyerror(error_message);
	free(error_message);
	return 0;
    }

    return 1;
}
    
	
void yyerror(char* s)
{
  (void) fprintf(stderr, "%s at line %d\n", s, line_counter);
  error_found = 1;
}
#line 378 "y.tab.c"

#if YYDEBUG
#include <stdio.h>		/* needed for printf */
#endif

#include <stdlib.h>	/* needed for malloc, etc */
#include <string.h>	/* needed for memset */

/* allocate initial stack or double stack size, up to YYMAXDEPTH */
static int yygrowstack(YYSTACKDATA *data)
{
    int i;
    unsigned newsize;
    short *newss;
    YYSTYPE *newvs;

    if ((newsize = data->stacksize) == 0)
        newsize = YYINITSTACKSIZE;
    else if (newsize >= YYMAXDEPTH)
        return -1;
    else if ((newsize *= 2) > YYMAXDEPTH)
        newsize = YYMAXDEPTH;

    i = (int) (data->s_mark - data->s_base);
    newss = (short *)realloc(data->s_base, newsize * sizeof(*newss));
    if (newss == 0)
        return -1;

    data->s_base = newss;
    data->s_mark = newss + i;

    newvs = (YYSTYPE *)realloc(data->l_base, newsize * sizeof(*newvs));
    if (newvs == 0)
        return -1;

    data->l_base = newvs;
    data->l_mark = newvs + i;

    data->stacksize = newsize;
    data->s_last = data->s_base + newsize - 1;
    return 0;
}

#if YYPURE || defined(YY_NO_LEAKS)
static void yyfreestack(YYSTACKDATA *data)
{
    free(data->s_base);
    free(data->l_base);
    memset(data, 0, sizeof(*data));
}
#else
#define yyfreestack(data) /* nothing */
#endif

#define YYABORT  goto yyabort
#define YYREJECT goto yyabort
#define YYACCEPT goto yyaccept
#define YYERROR  goto yyerrlab

int
YYPARSE_DECL()
{
    int yym, yyn, yystate;
#if YYDEBUG
    const char *yys;

    if ((yys = getenv("YYDEBUG")) != 0)
    {
        yyn = *yys;
        if (yyn >= '0' && yyn <= '9')
            yydebug = yyn - '0';
    }
#endif

    yynerrs = 0;
    yyerrflag = 0;
    yychar = YYEMPTY;
    yystate = 0;

#if YYPURE
    memset(&yystack, 0, sizeof(yystack));
#endif

    if (yystack.s_base == NULL && yygrowstack(&yystack)) goto yyoverflow;
    yystack.s_mark = yystack.s_base;
    yystack.l_mark = yystack.l_base;
    yystate = 0;
    *yystack.s_mark = 0;

yyloop:
    if ((yyn = yydefred[yystate]) != 0) goto yyreduce;
    if (yychar < 0)
    {
        if ((yychar = YYLEX) < 0) yychar = 0;
#if YYDEBUG
        if (yydebug)
        {
            yys = 0;
            if (yychar <= YYMAXTOKEN) yys = yyname[yychar];
            if (!yys) yys = "illegal-symbol";
            printf("%sdebug: state %d, reading %d (%s)\n",
                    YYPREFIX, yystate, yychar, yys);
        }
#endif
    }
    if ((yyn = yysindex[yystate]) && (yyn += yychar) >= 0 &&
            yyn <= YYTABLESIZE && yycheck[yyn] == yychar)
    {
#if YYDEBUG
        if (yydebug)
            printf("%sdebug: state %d, shifting to state %d\n",
                    YYPREFIX, yystate, yytable[yyn]);
#endif
        if (yystack.s_mark >= yystack.s_last && yygrowstack(&yystack))
        {
            goto yyoverflow;
        }
        yystate = yytable[yyn];
        *++yystack.s_mark = yytable[yyn];
        *++yystack.l_mark = yylval;
        yychar = YYEMPTY;
        if (yyerrflag > 0)  --yyerrflag;
        goto yyloop;
    }
    if ((yyn = yyrindex[yystate]) && (yyn += yychar) >= 0 &&
            yyn <= YYTABLESIZE && yycheck[yyn] == yychar)
    {
        yyn = yytable[yyn];
        goto yyreduce;
    }
    if (yyerrflag) goto yyinrecovery;

    yyerror("syntax error");

    goto yyerrlab;

yyerrlab:
    ++yynerrs;

yyinrecovery:
    if (yyerrflag < 3)
    {
        yyerrflag = 3;
        for (;;)
        {
            if ((yyn = yysindex[*yystack.s_mark]) && (yyn += YYERRCODE) >= 0 &&
                    yyn <= YYTABLESIZE && yycheck[yyn] == YYERRCODE)
            {
#if YYDEBUG
                if (yydebug)
                    printf("%sdebug: state %d, error recovery shifting\
 to state %d\n", YYPREFIX, *yystack.s_mark, yytable[yyn]);
#endif
                if (yystack.s_mark >= yystack.s_last && yygrowstack(&yystack))
                {
                    goto yyoverflow;
                }
                yystate = yytable[yyn];
                *++yystack.s_mark = yytable[yyn];
                *++yystack.l_mark = yylval;
                goto yyloop;
            }
            else
            {
#if YYDEBUG
                if (yydebug)
                    printf("%sdebug: error recovery discarding state %d\n",
                            YYPREFIX, *yystack.s_mark);
#endif
                if (yystack.s_mark <= yystack.s_base) goto yyabort;
                --yystack.s_mark;
                --yystack.l_mark;
            }
        }
    }
    else
    {
        if (yychar == 0) goto yyabort;
#if YYDEBUG
        if (yydebug)
        {
            yys = 0;
            if (yychar <= YYMAXTOKEN) yys = yyname[yychar];
            if (!yys) yys = "illegal-symbol";
            printf("%sdebug: state %d, error recovery discards token %d (%s)\n",
                    YYPREFIX, yystate, yychar, yys);
        }
#endif
        yychar = YYEMPTY;
        goto yyloop;
    }

yyreduce:
#if YYDEBUG
    if (yydebug)
        printf("%sdebug: state %d, reducing by rule %d (%s)\n",
                YYPREFIX, yystate, yyn, yyrule[yyn]);
#endif
    yym = yylen[yyn];
    if (yym)
        yyval = yystack.l_mark[1-yym];
    else
        memset(&yyval, 0, sizeof yyval);
    switch (yyn)
    {
case 1:
#line 109 "iloc.y"
	{
		     first_instruction = yystack.l_mark[0].inst_ptr;
		 }
break;
case 2:
#line 115 "iloc.y"
	{
		     yyval.inst_ptr = yystack.l_mark[0].inst_ptr;
		 }
break;
case 3:
#line 119 "iloc.y"
	{
		     Label* label_definition = get_label(yystack.l_mark[-1].ival);
		     label_definition->target = yystack.l_mark[0].inst_ptr;
		     yyval.inst_ptr = yystack.l_mark[0].inst_ptr;
		 }
break;
case 4:
#line 125 "iloc.y"
	{
		     yystack.l_mark[-1].inst_ptr->next = yystack.l_mark[0].inst_ptr;
		     yyval.inst_ptr = yystack.l_mark[-1].inst_ptr;
		 }
break;
case 5:
#line 130 "iloc.y"
	{
		     Label* label_definition = get_label(yystack.l_mark[-2].ival);
		     label_definition->target = yystack.l_mark[-1].inst_ptr;
		     yystack.l_mark[-1].inst_ptr->next = yystack.l_mark[0].inst_ptr;
		     yyval.inst_ptr = yystack.l_mark[-1].inst_ptr;
		 }
break;
case 6:
#line 139 "iloc.y"
	{
		     yyval.inst_ptr = malloc(sizeof(Instruction));
		     yyval.inst_ptr->operations = yystack.l_mark[0].op_ptr;
		     yyval.inst_ptr->next = NULL;
		 }
break;
case 7:
#line 145 "iloc.y"
	{
		     yyval.inst_ptr = malloc(sizeof(Instruction));
		     yyval.inst_ptr->operations = yystack.l_mark[-1].op_ptr;
		     yyval.inst_ptr->next = NULL;
		 }
break;
case 8:
#line 153 "iloc.y"
	{
		     yyval.op_ptr = yystack.l_mark[0].op_ptr;
		 }
break;
case 9:
#line 157 "iloc.y"
	{
		     yystack.l_mark[-2].op_ptr->next = yystack.l_mark[0].op_ptr;
		     yyval.op_ptr = yystack.l_mark[-2].op_ptr;
		 }
break;
case 10:
#line 164 "iloc.y"
	{
		     verify_args(yystack.l_mark[-3].opcode_ptr,yystack.l_mark[-2].operands_ptr->num_regs,yystack.l_mark[-2].operands_ptr->num_consts+yystack.l_mark[0].operands_ptr->num_consts,
				 yystack.l_mark[-2].operands_ptr->num_labels+yystack.l_mark[0].operands_ptr->num_labels,yystack.l_mark[0].operands_ptr->num_regs);
		     yyval.op_ptr = malloc(sizeof(Operation));
		     yyval.op_ptr->opcode = yystack.l_mark[-3].opcode_ptr->name;
		     yyval.op_ptr->srcs = yystack.l_mark[-2].operands_ptr->regs;
		     yyval.op_ptr->consts = append_operands(yystack.l_mark[-2].operands_ptr->consts,yystack.l_mark[0].operands_ptr->consts);
		     yyval.op_ptr->labels = append_operands(yystack.l_mark[-2].operands_ptr->labels,yystack.l_mark[0].operands_ptr->labels);
		     yyval.op_ptr->defs = yystack.l_mark[0].operands_ptr->regs;
		     yyval.op_ptr->next = NULL;
		     /* 		     free($2);
					     free($4); */
		 }
break;
case 11:
#line 178 "iloc.y"
	{
		     verify_args(yystack.l_mark[-1].opcode_ptr,yystack.l_mark[0].operands_ptr->num_regs,yystack.l_mark[0].operands_ptr->num_consts,yystack.l_mark[0].operands_ptr->num_labels,0);
		     yyval.op_ptr = malloc(sizeof(Operation));
		     yyval.op_ptr->opcode = yystack.l_mark[-1].opcode_ptr->name;
		     yyval.op_ptr->srcs = yystack.l_mark[0].operands_ptr->regs;
		     yyval.op_ptr->consts = yystack.l_mark[0].operands_ptr->consts;
		     yyval.op_ptr->labels = yystack.l_mark[0].operands_ptr->labels;
		     yyval.op_ptr->defs = NULL;
		     yyval.op_ptr->next = NULL;
		     /* 		     free($2); */
		 }
break;
case 12:
#line 190 "iloc.y"
	{
		     verify_args(yystack.l_mark[-2].opcode_ptr,0,yystack.l_mark[0].operands_ptr->num_consts,yystack.l_mark[0].operands_ptr->num_labels,yystack.l_mark[0].operands_ptr->num_regs);
		     yyval.op_ptr = malloc(sizeof(Operation));
		     yyval.op_ptr->opcode = yystack.l_mark[-2].opcode_ptr->name;
		     yyval.op_ptr->srcs = NULL;
		     yyval.op_ptr->consts = yystack.l_mark[0].operands_ptr->consts;
		     yyval.op_ptr->labels = yystack.l_mark[0].operands_ptr->labels;
		     yyval.op_ptr->defs = yystack.l_mark[0].operands_ptr->regs;
		     yyval.op_ptr->next = NULL;
		     /* 		     free($3); */
		 }
break;
case 13:
#line 202 "iloc.y"
	{
		     verify_args(yystack.l_mark[0].opcode_ptr,0,0,0,0);
		     yyval.op_ptr = malloc(sizeof(Operation));
		     yyval.op_ptr->opcode = yystack.l_mark[0].opcode_ptr->name;
		     yyval.op_ptr->srcs = NULL;
		     yyval.op_ptr->consts = NULL;
		     yyval.op_ptr->labels = NULL;
		     yyval.op_ptr->defs = NULL;
		     yyval.op_ptr->next = NULL;
		 }
break;
case 14:
#line 215 "iloc.y"
	{
		     yyval.opcode_ptr = current_opcode;
		 }
break;
case 15:
#line 221 "iloc.y"
	{
		     yyval.operands_ptr = new_operands();
		     yyval.operands_ptr->num_regs = 1;
		     yyval.operands_ptr->regs = yystack.l_mark[0].operand_ptr;
		 }
break;
case 16:
#line 227 "iloc.y"
	{
		     yyval.operands_ptr = yystack.l_mark[0].operands_ptr;
		     yyval.operands_ptr->num_regs += 1;
		     yystack.l_mark[-2].operand_ptr->next = yyval.operands_ptr->regs;
		     yyval.operands_ptr->regs = yystack.l_mark[-2].operand_ptr;
		 }
break;
case 17:
#line 234 "iloc.y"
	{
		     yyval.operands_ptr = new_operands();
		     yyval.operands_ptr->num_consts = 1;
		     yyval.operands_ptr->consts = yystack.l_mark[0].operand_ptr;
		 }
break;
case 18:
#line 240 "iloc.y"
	{
		     yyval.operands_ptr = yystack.l_mark[0].operands_ptr;
		     yyval.operands_ptr->num_consts += 1;
		     yystack.l_mark[-2].operand_ptr->next = yyval.operands_ptr->consts;
		     yyval.operands_ptr->consts = yystack.l_mark[-2].operand_ptr;
		 }
break;
case 19:
#line 247 "iloc.y"
	{
		     yyval.operands_ptr = new_operands();
		     yyval.operands_ptr->num_labels = 1;
		     yyval.operands_ptr->labels = yystack.l_mark[0].operand_ptr;
		 }
break;
case 20:
#line 253 "iloc.y"
	{
		     yyval.operands_ptr = yystack.l_mark[0].operands_ptr;
		     yyval.operands_ptr->num_labels += 1;
		     yystack.l_mark[-2].operand_ptr->next = yyval.operands_ptr->labels;
		     yyval.operands_ptr->labels = yystack.l_mark[-2].operand_ptr;
		 }
break;
case 21:
#line 262 "iloc.y"
	{
		   /* 		     $$ = malloc(sizeof(Operand));
				     $$->value = (int) strtol(&yytext[1], (char**) NULL, 10); */
		     yyval.operand_ptr->next = NULL;
		 }
break;
case 22:
#line 270 "iloc.y"
	{
		   /* 		     $$ = malloc(sizeof(Operand));
				     $$->value = (int) strtol(yytext, (char**) NULL, 10); */
		     yyval.operand_ptr->next = NULL;
		 }
break;
case 23:
#line 280 "iloc.y"
	{
		   /* 		     $$ = malloc(sizeof(Operand));
				     $$->value = insert_label(yytext); */
		     yyval.operand_ptr->value = insert_label(yystack.l_mark[0].label_ptr);
		     yyval.operand_ptr->next = NULL;
		 }
break;
case 24:
#line 289 "iloc.y"
	{
		   /* 		     int last_char = strlen(yytext) - 1;
		     yytext[last_char] = '\0';
		     $$ = insert_label(yytext); */
		     int last_char = strlen(yystack.l_mark[0].label_ptr) - 1;
		     yystack.l_mark[0].label_ptr[last_char] = '\0';
		     yyval.ival = insert_label(yystack.l_mark[0].label_ptr);
		 }
break;
#line 799 "y.tab.c"
    }
    yystack.s_mark -= yym;
    yystate = *yystack.s_mark;
    yystack.l_mark -= yym;
    yym = yylhs[yyn];
    if (yystate == 0 && yym == 0)
    {
#if YYDEBUG
        if (yydebug)
            printf("%sdebug: after reduction, shifting from state 0 to\
 state %d\n", YYPREFIX, YYFINAL);
#endif
        yystate = YYFINAL;
        *++yystack.s_mark = YYFINAL;
        *++yystack.l_mark = yyval;
        if (yychar < 0)
        {
            if ((yychar = YYLEX) < 0) yychar = 0;
#if YYDEBUG
            if (yydebug)
            {
                yys = 0;
                if (yychar <= YYMAXTOKEN) yys = yyname[yychar];
                if (!yys) yys = "illegal-symbol";
                printf("%sdebug: state %d, reading %d (%s)\n",
                        YYPREFIX, YYFINAL, yychar, yys);
            }
#endif
        }
        if (yychar == 0) goto yyaccept;
        goto yyloop;
    }
    if ((yyn = yygindex[yym]) && (yyn += yystate) >= 0 &&
            yyn <= YYTABLESIZE && yycheck[yyn] == yystate)
        yystate = yytable[yyn];
    else
        yystate = yydgoto[yym];
#if YYDEBUG
    if (yydebug)
        printf("%sdebug: after reduction, shifting from state %d \
to state %d\n", YYPREFIX, *yystack.s_mark, yystate);
#endif
    if (yystack.s_mark >= yystack.s_last && yygrowstack(&yystack))
    {
        goto yyoverflow;
    }
    *++yystack.s_mark = (short) yystate;
    *++yystack.l_mark = yyval;
    goto yyloop;

yyoverflow:
    yyerror("yacc stack overflow");

yyabort:
    yyfreestack(&yystack);
    return (1);

yyaccept:
    yyfreestack(&yystack);
    return (0);
}
