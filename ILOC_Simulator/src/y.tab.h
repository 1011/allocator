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
extern YYSTYPE yylval;
