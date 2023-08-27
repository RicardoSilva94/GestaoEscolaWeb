/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Classes.Utilizador;
import Classes.Curso;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.swing.JOptionPane;
import java.sql.SQLException;

/**
 *
 * @author Utilizador
 */
public class LoginDAO {

    PreparedStatement pst = null;
    ResultSet resultado = null;
    Connection ligar = null;

    public LoginDAO() {
    }

    public boolean autenticar(String username, String password) {

        try {
            String sql = "SELECT * FROM tb_login where nome = ? and pass = ?";
            ligar = (Connection) new LigacaoBD().ligarBD();
            pst = ligar.prepareStatement(sql);
            pst.setString(1, username);
            pst.setString(2, password);
            resultado = pst.executeQuery();
            if (resultado.next()) {

                return true;
            } else {
                JOptionPane.showMessageDialog(null, "Falha na autenticação...");
                return false;

            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Ocorreu um erro de acesso a base de dados...");
            return false;
        }
    }

    public void inserirUtilizador(Utilizador utilizador) throws ClassNotFoundException {

        String sql = "INSERT INTO login (nome, pass) VALUES (?,?)";
        
        try {
            ligar = new LigacaoBD().ligarBD();
            pst = ligar.prepareStatement(sql);
            pst.setString(1, utilizador.getNome());
            pst.setString(2, utilizador.getPass());

            pst.execute();

            pst.close();

        } catch (SQLException e) {

        }
    }

}
