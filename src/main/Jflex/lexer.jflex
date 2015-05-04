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
[a-z A-Z 0-9 ! º ª @ · # $ % & = ' ´ + ? < > "-" ¿ ‚ ¡ ` * + ¨ Ç : , ;]+["("][a-z A-Z 0-9 ! º ª @ · # $ % & = ' \" ´ "[" "]" + ? < > "-" ¿ ‚ ¡ ` * + ¨ Ç : , ;]+[")"] {tokens.add("Predicado"); System.out.println("Predicado");}
"("            {tokens.add("("); System.out.println("Par_Izq");}
")"            {tokens.add(")"); System.out.println("Par_Der");}
"."            {tokens.add("."); System.out.println("Punto");}
","            {tokens.add(","); System.out.println("Coma");}
";"            {tokens.add(";"); System.out.println("Punto y Coma");}
["_"|[A-Z]][[a-z][_][0-9]]*     {tokens.add("Variable"); System.out.println("Variable");}
":""-"         {tokens.add(":-"); System.out.println("Implica");}
\"[ -~]*\"     {tokens.add("Cadena"); System.out.println("Cadena");}
"+"?"-"?[0-9]* {tokens.add("Entero"); System.out.println("Entero");}
"+"?"-"?[0-9]*"."[0-9]*        {tokens.add("Pto_Fijo"); System.out.println("Pto_Fijo");}
[[0-9]*"."[0-9]*]["e"|"E"]"-"?[0-9]*       {tokens.add("Pto_Flot"); System.out.println("Pto_Flot");}
[a-z][[A-Za-z][0-9][_]]+  {tokens.add("Atomo"); System.out.println("Atomo");}
"'"[ -~]*"'"   {tokens.add("Atomo"); System.out.println("Atomo");}
[!ºª@·#$%&=´+?<>"-"¿‚¡`*+¨Ç:]+    {tokens.add("Atomo"); System.out.println("Atomo");}
["["][a-zA-Z0-9!ºª@·#$%&='´+?\"<>"-"¿‚¡()`*+¨Ç:,;]+?["]"] {tokens.add("lista"); System.out.println("lista");}