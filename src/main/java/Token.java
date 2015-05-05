/**
 *
 * @author Manuel
 */
public class Token {
 private Integer linea;
    private String token;
    private String lexema;

    public Token() {
        this.linea = linea;
        this.token = token;
        this.lexema = lexema;
        
        String formato = formato();
        System.out.println(formato);
    }

    public char siguiente(){
        if(linea<lexema.length()) 
            return lexema.charAt(linea++);
        else return 'f';
    }
    
    public void atras(){
        linea--;
    }
   
    public Integer getLinea() {
        return linea;
    }

    
    public void setLinea(Integer linea) {
        this.linea = linea;
    }

    
    public String getToken() {
        return token;
    }

    
    public void setToken(String token) {
        this.token = token;
    }

    
    public String getLexema() {
        return lexema;
    }

    
    public void setLexema(String lexema) {
        this.lexema = lexema;
    }
    
    
    public String formato(){     
        return String.format("%s | %s | %s", 
                this.token, this.lexema, this.linea);
        
                
    }
    public void imprimir(){
        String formato = formato();
        System.out.println(formato);
    }

    Token nextToken() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
