package BancoDeDadosConexao; // situa em qual package ou "pacote" está a classe 

import java.sql.Connection; // faz as importações de classes necessárias para o funcionamento do programa 
import java.sql.DriverManager; // conexão SQL para Java 
import java.sql.SQLException; // driver de conexão SQL para Java 
public class ConnectionFactory { // classe para tratamento de exceções 
     public Connection getConnection() {
		 try {                                    //"jdbc:mysql://localhost/nome_banco","root","senha_root"
			return DriverManager.getConnection("jdbc:mysql://localhost/bibliotecaa3","root","Fr4nc1sc0@");
		 }         
		 catch(SQLException excecao) {
			throw new RuntimeException(excecao);
		 }
     }
}

