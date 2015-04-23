import java.util.ArrayList;
import java.util.List;
import java.io.FileReader;
%%
%public
%class Lexer
%standalone
        
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
":"     {tokens.add(":"); System.out.println("Dos Puntos");}
";"     {tokens.add(";"); System.out.println("Punto y Coma");}
"<"     {tokens.add("<"); System.out.println("Menor que");}
">"     {tokens.add(">"); System.out.println("Mayor que");}
"=="    {tokens.add("=="); System.out.println("Igual");}
"%%"    {tokens.add("%%"); System.out.println("Porciento");}
[0-9]   {tokens.add("Num"); System.out.println("Numero");}
"_"    {tokens.add("ID"); System.out.println("Identificador");}
[A-Za-z] {tokens.add("ID"); System.out.println("Identificador");}
[A-Za-z]+[0-9] {tokens.add("ID"); System.out.println("Identificador");}
[A-Za-z]+[A-Za-z] {tokens.add("ID"); System.out.println("Identificador");}
"_"+[A-Za-z]+[0-9] {tokens.add("ID"); System.out.println("Identificador");}
"_"+[A-Za-z]+[A-Za-z] {tokens.add("ID"); System.out.println("Identificador");}
