/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import Classes.*;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author Utilizador
 */
public class CursoDAO {
    Connection ligar = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
    
    public CursoDAO(){
       // this.lb = new LigarBD();
           
    }


    public void inserirCurso(Curso curso) throws ClassNotFoundException {
        
        String sql = "INSERT INTO cursos (nome_curso, duracao_curso) VALUES (?,?)";
        ligar = new LigacaoBD().ligarBD();
        try {
            
            pst = ligar.prepareStatement(sql);
            pst.setString(1, curso.getNome_curso());
            pst.setInt(2, curso.getDuracao_curso());
           
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

    public void atualizar(Curso curso) throws ClassNotFoundException{
        String sql = "UPDATE cursos SET nome_curso=?, duracao_curso=? WHERE id_curso=?";
        ligar = new LigacaoBD().ligarBD();
        try{
             pst = ligar.prepareStatement(sql);
             pst.setString(1, curso.getNome_curso());
             pst.setInt(2, curso.getDuracao_curso());
             pst.setInt(3, curso.getId_curso());
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

    public ArrayList<Curso> listarCursos() throws ClassNotFoundException {
        String sql = "SELECT * FROM cursos";
        try {
            ligar = new LigacaoBD().ligarBD();
            pst = ligar.prepareStatement(sql);
            rs = pst.executeQuery(sql);
            ArrayList<Curso> listaCursos = new ArrayList<>();
            while (rs.next()) {
                Curso curso = new Curso();
                curso.setId_curso(rs.getInt("id_curso"));
                curso.setNome_curso(rs.getString("nome_curso"));
                curso.setDuracao_curso(rs.getInt("duracao_curso"));
                listaCursos.add(curso);
            }
            return listaCursos;
        } catch (Exception e) {
            System.out.println("Erro ao listar os cursos"+e.getMessage());
            return null;
        }
        }
    
}
