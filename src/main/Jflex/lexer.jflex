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
"("            {tokens.add("("); System.out.println("Par_Izq");}
")"            {tokens.add(")"); System.out.println("Par_Der");}
"."            {tokens.add("."); System.out.println("Punto");}
","            {tokens.add(","); System.out.println("Coma");}
";"            {tokens.add(";"); System.out.println("Punto y Coma");}
"_"?[A-Z]?[[a-z][_][0-9]]*     {tokens.add("Variable"); System.out.println("Variable");}
":""-"            {tokens.add(":-"); System.out.println("Implica");}
"'"[ -~]*"'"            {tokens.add("Cadena"); System.out.println("Cadena");}