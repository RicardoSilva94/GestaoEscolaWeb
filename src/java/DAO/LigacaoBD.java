/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Utilizador
 */
public class LigacaoBD {
    Connection ligar;
    
    public Connection ligarBD() throws ClassNotFoundException{
    
    
    
        String bd = "jdbc:mysql://localhost:3306/bd_escola";
        String user = "root";
        String password = "";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            ligar = DriverManager.getConnection(bd, user, password);
            System.out.println("Connected");
            
           
        }catch(SQLException e){
            System.out.println("Not Connected");
            System.out.println("Erro ao ligar a BD: "+e.getMessage());
            
        }
        return ligar;
               
                
        }
    
}
