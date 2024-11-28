package model.dao;

import model.Pet;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;
import util.ConectaDB;

public class PetDAO {
    // Atributos
    // Sem atributos
    
    // Métodos
    
    public boolean incPet(Pet p_pet) throws ClassNotFoundException {
        // Conectar
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar(); // Abre a conexão
            Statement stmt = conexao.createStatement();
            
            String sql = "INSERT INTO pet(nome, raca, nomeDono, telefone) VALUES ('" + p_pet.getNome() +
                    "', '" + p_pet.getRaca() +
                    "', '" + p_pet.getNomeDono() +
                    "', '" + p_pet.getTelefone() + "')";
            
            stmt.executeUpdate(sql); // Executa o SQL: Insert / Delete ou Update
            
            conexao.close();
            return true;
        } catch (SQLException ex) {
            System.out.println(" Exception: " + ex.toString());
            return false;
        }
    }
    
    public Pet consPetReg(Pet pet) throws ClassNotFoundException {
        // Conectar
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar(); // Abre a conexão
            Statement stmt = conexao.createStatement();
            
            String sql = "SELECT * from pet where nome = '" + pet.getNome() + "'";
            ResultSet rs = stmt.executeQuery(sql); // Executar Select
            
            int n_reg = 0;
            while (rs.next()) {
                pet.setId(rs.getInt("id"));
                pet.setNome(rs.getString("nome"));
                pet.setRaca(rs.getString("raca"));
                pet.setNomeDono(rs.getString("nomeDono"));
                pet.setTelefone(rs.getString("telefone"));
                n_reg++;
            }
            conexao.close();
            
            if (n_reg == 0) {
                return null;
            } else {
                return pet;
            }
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex);
            return null;
        }
    }
    
    public Pet consPetRegTel(Pet pet) throws ClassNotFoundException {
        // Conectar
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar(); // Abre a conexão
            Statement stmt = conexao.createStatement();
            
            String sql = "SELECT * from pet where telefone = '" + pet.getTelefone() + "'";
            ResultSet rs = stmt.executeQuery(sql); // Executar Select
            
            int n_reg = 0;
            while (rs.next()) {
                pet.setId(Integer.parseInt(rs.getString("id")));
                pet.setNome(rs.getString("nome"));
                pet.setRaca(rs.getString("raca"));
                pet.setNomeDono(rs.getString("nomedono"));
                pet.setTelefone(rs.getString("telefone"));
                n_reg++;
            }
            conexao.close();
            
            if (n_reg == 0) {
                return null;
            } else {
                return pet;
            }
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex);
            return null;
        }
    }

    public Pet consPetRegId(Pet pet) throws ClassNotFoundException {
        // Conectar
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar(); // Abre a conexão
            Statement stmt = conexao.createStatement();
            
            String sql = "SELECT * from pet where id = '" + pet.getId() + "'";
            ResultSet rs = stmt.executeQuery(sql); // Executar Select
            
            int n_reg = 0;
            while (rs.next()) {
                pet.setId(Integer.parseInt(rs.getString("id")));
                pet.setNome(rs.getString("nome"));
                pet.setRaca(rs.getString("raca"));
                pet.setNomeDono(rs.getString("nomeDono"));
                pet.setTelefone(rs.getString("telefone"));
                n_reg++;
            }
            conexao.close();
            
            if (n_reg == 0) {
                return null;
            } else {
                return pet;
            }
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex);
            return null;
        }
    }
    
    public List consPetLista() throws ClassNotFoundException {
        // Conectar
        List lista = new ArrayList(); // Minha Lista
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar(); // Abre a conexão
            Statement stmt = conexao.createStatement();
            
            String sql = "SELECT * from pet";
            ResultSet rs = stmt.executeQuery(sql); // Executar Select
            
            int n_reg = 0;
            while (rs.next()) {
                Pet pet = new Pet();
                pet.setId(Integer.parseInt(rs.getString("id")));
                pet.setNome(rs.getString("nome"));
                pet.setRaca(rs.getString("raca"));
                pet.setNomeDono(rs.getString("nomeDono"));
                pet.setTelefone(rs.getString("telefone"));
                lista.add(pet);
                n_reg++;
            }
            conexao.close();
            
            if (n_reg == 0) {
                return null;
            } else {
                return lista;
            }
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex);
            return null;
        }
    }
    
    public boolean exclPetId(Pet pet) throws ClassNotFoundException {
        // Conectar
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar(); // Abre a conexão
            
            // Verificar se o pet existe antes de excluir
            String checkSql = "SELECT COUNT(*) FROM pet WHERE id = ?";
            try (PreparedStatement checkStmt = conexao.prepareStatement(checkSql)) {
                checkStmt.setInt(1, pet.getId());
                ResultSet rs = checkStmt.executeQuery();
                
                if (rs.next() && rs.getInt(1) == 0) {
                    // Se não houver registros, o pet não existe
                    return false;  // Pet não encontrado
                }
            }
            
            // Excluir pet
            String sql = "DELETE FROM pet WHERE id = ?";
            try (PreparedStatement stmt = conexao.prepareStatement(sql)) {
                stmt.setInt(1, pet.getId());
                int rowsAffected = stmt.executeUpdate();
                return rowsAffected > 0;  // Se uma linha for afetada, a exclusão foi bem-sucedida
            }

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex);
            return false;  // Erro ao tentar excluir
        } finally {
            if (conexao != null) {
                try {
                    conexao.close();
                } catch (SQLException ex) {
                    System.out.println("Erro ao fechar conexão: " + ex);
                }
            }
        }
    }

    public boolean altPet(Pet p_pet) throws ClassNotFoundException {
        // Conectar
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar(); // Abre a conexão
            Statement stmt = conexao.createStatement();
            
            String sql = "UPDATE pet SET nome='" + p_pet.getNome() + "'" +
                    ", raca='" + p_pet.getRaca() + "'" +
                    ", nomeDono='" + p_pet.getNomeDono() + "'" +
                    ", telefone='" + p_pet.getTelefone() + "'" + " WHERE id = " + p_pet.getId();
            
            stmt.executeUpdate(sql); // Executa o SQL: Insert / Delete ou Update
            
            conexao.close();
            return true;
        } catch (SQLException ex) {
            System.out.println(" Exception: " + ex.toString());
            return false;
        }
    }
}
