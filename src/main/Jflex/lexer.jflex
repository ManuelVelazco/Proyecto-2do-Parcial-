/*
Analizador Lexico 1.0

Jose Manuel Gonzalez Velazco 271415
Yazmin Sarahi Ramirez Fuentes 276390
Luis Alberto Hernandez Dominguez 271507
*/
import java.util.ArrayList;
import java.util.List;
import java.io.FileReader;
%%
%public
%class Lexer
%standalone
%line
        
%{
            private List<String> tokens = new ArrayList<>();
%}
        

%{
/*
Se inicializa el Token
*/
Token token = new Token();


            public List<String> analizar(String archivo){
    FileReader in = null;
    try{
    in = new FileReader(archivo);
    Lexer lexer = new Lexer(in);
    while(!lexer.zzAtEOF){
    lexer.yylex();
                        }
    }catch(Exception ex){
        System.out.println("Error al analizar el archivo.");
        }finally{
                try{
                       in.close();
                   }catch(Exception ex){
                    System.out.println("Error al cerrar el archivo");
                }
           }
                return tokens;
       }
%}

        
%%
/*
Tiene la estructura atomo (Argumento), donde Argumento es 1 0 mas argumentos separados por comas
*/

[a-z A-Z 0-9 ! º ª @ · # $ % & = ' ´ + ? < > "-" ¿ ‚ ¡ ` * + ¨ Ç : ;]+["("][a-z A-Z 0-9 ! º ª @ · # $ % & = ' \" ´ "[" "]" + ? < > "-" ¿ ‚ ¡ ` * + ¨ Ç : , ;]+[")"] {tokens.add("Predicado"); token.setLinea(yyline+1); token.setToken("Predicado"); token.setLexema(yytext()); token.imprimir();}
"("            {tokens.add("("); token.setLinea(yyline+1); token.setToken("Par_Izq"); token.setLexema(yytext()); token.imprimir();}

")"            {tokens.add(")"); token.setLinea(yyline+1); token.setToken("Par_Der"); token.setLexema(yytext()); token.imprimir();}

"."            {tokens.add("."); token.setLinea(yyline+1); token.setToken("Punto"); token.setLexema(yytext()); token.imprimir();}

","            {tokens.add(","); token.setLinea(yyline+1); token.setToken("Coma"); token.setLexema(yytext()); token.imprimir();}

";"            {tokens.add(";"); token.setLinea(yyline+1); token.setToken("Punto y Coma"); token.setLexema(yytext()); token.imprimir();}


/*
Secuencia de uno o mas  simbolos tomados del conjunto Letra, digito, _ que inicia con letra mayuscula o _
*/
["_"|[A-Z]][[a-z][_][0-9]]*     {tokens.add("Variable"); token.setLinea(yyline+1); token.setLexema(yytext()); token.setToken("Variable"); token.imprimir();}


/*
Es la secuencia :-
*/
":""-"         {tokens.add(":-"); token.setLinea(yyline+1); token.setToken("Implica"); token.setLexema(yytext()); token.imprimir();}


/*
Cualquier secuencia de caraceteres entre comillas
*/
\"[ -~]*\"     {tokens.add("Cadena"); token.setLinea(yyline+1); token.setToken("Cadena"); token.setLexema(yytext()); token.imprimir();}


/*
Se asigna un numero entero
*/
"+"?"-"?[0-9]* {tokens.add("Entero"); token.setLinea(yyline+1); token.setToken("Entero"); token.setLexema(yytext()); token.imprimir();}


/*
Es un numero real signado en  notacion de punto fijo
*/
"+"?"-"?[0-9]*"."[0-9]*        {tokens.add("Pto_Fijo"); token.setLinea(yyline+1); token.setToken("Pto_Fijo"); token.setLexema(yytext()); token.imprimir();}


/*
Es un numero real signado en notacion del punto flotante con el siguiente formato:
 	 MONTO(entero de pto_fijo) BASE(E o e) EXPONENTE(entero)
*/
[[0-9]*"."[0-9]*]["e"|"E"]"-"?[0-9]*       {tokens.add("Pto_Flot"); token.setLinea(yyline+1); token.setToken("Pto_Float"); token.setLexema(yytext()); token.imprimir();}


/*
Secuencia de uno o mas simbolos tomados del conjunto letras, digitos y _ y debe iniciar con letra minuscula.
*/
[a-z][[A-Za-z][0-9][_]]+  {tokens.add("Atomo"); token.setLinea(yyline+1); token.setToken("Atomo"); token.setLexema(yytext()); token.imprimir();}
/*
Secuencia de uno o mas simbolos entre apostrofes
*/
"'"[ -~]*"'"   {tokens.add("Atomo"); token.setLinea(yyline+1); token.setToken("Atomo"); token.setLexema(yytext()); token.imprimir();}
/*
Secuencia de uno o mas sibolos especiales
*/
[!ºª@·#$%&=´+?<>"-"¿‚¡`*+¨Ç:]+    {tokens.add("Atomo"); token.setLinea(yyline+1); token.setToken("Atomo"); token.setLexema(yytext()); token.imprimir();}


/*
Es una secuencia de cero o mas(si es mas de uno se separan por comas), simbolos entre parentesis rectangulares
      Cada simbolo puede ser:variable, atomo, predicado, numero o cadena
*/
["["][a-zA-Z0-9!ºª@·#$%&='´+?\"<>"-"¿‚¡()`*+¨Ç:,;]+?["]"] {tokens.add("lista"); token.setLinea(yyline+1); token.setToken("Lista"); token.setLexema(yytext()); token.imprimir();}