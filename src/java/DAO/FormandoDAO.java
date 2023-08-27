/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Classes.Curso;
import Classes.Formando;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Utilizador
 */
public class FormandoDAO {
    
    Connection ligar = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
    
    public FormandoDAO(){
       // this.lb = new LigarBD();
           
    }


    public void inserirFormando(Formando formando) throws ClassNotFoundException {
        
        String sql = "INSERT INTO formandos (cc_formando, nome_formando, apelido_formando, endereco_formando, telefone_formando, id_curso) VALUES (?,?,?,?,?.?)";
        ligar = new LigacaoBD().ligarBD();
        try {
            
            pst = ligar.prepareStatement(sql);
            pst.setInt(1, formando.getCc_formando());
            pst.setString(2, formando.getNome_formando());
            pst.setString(3, formando.getApelido_formando());
            pst.setString(4, formando.getEndereco_formando());
            pst.setInt(5, formando.getTelefone_formando());
            pst.setInt(6, formando.getId_curso().getId_curso());
            pst.execute();

           // pst.close();

        } catch (SQLException e) {
                
            }
        }

    

    //Pesquisar um curso
    public Curso devolveCurso(int id) throws ClassNotFoundException{
        
        String sql = "SELECT * FROM cursos where id_curso=?";
      //  PreparedStatement pst = null;
        ligar = new LigacaoBD().ligarBD();
        try{
           pst = ligar.prepareStatement(sql);
           pst.setInt(1, id);
           rs = pst.executeQuery();
           Curso curso = new Curso();
          // rs.first();
          if(rs.next ()){
           curso.setId_curso(id);   
           curso.setNome_curso(rs.getString("nome_curso"));
           curso.setDuracao_curso(rs.getInt("duracao_curso"));
           return curso;
          }
          else
              return null;
          
           
        }catch(Exception e){
            System.out.println("Erro ao pesquisar o formando: "+e.getMessage());
            return null;
            
        }
        
        
    }

    public void atualizar(Formando formando) throws ClassNotFoundException{
        String sql = "UPDATE formandos SET cc_formando=?, nome_formando=?, apelido_formando=?, endereco_formando=?, telefone_formando=? WHERE id_curso=?";
        ligar = new LigacaoBD().ligarBD();
        try{
             pst = ligar.prepareStatement(sql);
             pst.setInt(1, formando.getCc_formando());
             pst.setString(2, formando.getNome_formando());
             pst.setString(3, formando.getApelido_formando());
             pst.setString(4, formando.getEndereco_formando());
             pst.setInt(5, formando.getTelefone_formando());
             pst.setInt(6, formando.getId_curso().getId_curso());
             pst.execute();
             pst.close();
            
        }catch(Exception e){
            
                    
        }
        
        
        
    }

    public void eliminar(Curso curso) throws ClassNotFoundException {

        String sql = "DELETE FROM cursos WHERE id_curso=?";
        ligar = new LigacaoBD().ligarBD();
        try {
            
            pst = ligar.prepareStatement(sql);
            pst.setInt(1, curso.getId_curso());
            pst.execute();

        } catch (Exception e) {
            System.out.println("Erro ao eliminar o curso" + e.getMessage());
        }

    }

    public ArrayList<Formando> listarFormandos() throws ClassNotFoundException {
        String sql = "SELECT formandos.id_formando, formandos.nome_formando, formandos.apelido_formando, formandos.endereco_formando,"
                + "cursos.nome_curso FROM formandos inner join cursos on formandos.id_curso = cursos.id_curso";
        try {
            ligar = new LigacaoBD().ligarBD();
            pst = ligar.prepareStatement(sql);
            rs = pst.executeQuery(sql);
            ArrayList<Formando> listaformandos = new ArrayList<>();
            while (rs.next()) {
                Formando formando = new Formando();
                formando.setId_formando(rs.getInt("id_formando"));
                
                formando.setNome_formando(rs.getString("nome_formando"));
                formando.setApelido_formando(rs.getString("apelido_formando"));
                formando.setEndereco_formando(rs.getString("endereco_formando"));
                
                
                Curso curso = new Curso();
                curso.setNome_curso(rs.getString("nome_curso"));
                
                formando.setId_curso(curso);
                
                listaformandos.add(formando);
            }
            return listaformandos;
        } catch (Exception e) {
            System.out.println("Erro ao listar os formandos"+e.getMessage());
            return null;
        }
        }
    
    
}
