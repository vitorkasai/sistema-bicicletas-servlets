package br.ufscar.dc.dsw.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.dsw.domain.Locadora;
import br.ufscar.dc.dsw.domain.Usuario;

public class LocadoraDAO extends GenericDAO {

    public List<Locadora> getAll() {

        List<Locadora> listaLocadoras = new ArrayList<>();
        // Retorna todas as colunas de locadora e também aqueles dados vindos da classe pai Usuario
        String sql = "SELECT u.id, u.nome, u.senha, u.email, l.CNPJ, l.cidade,  u.administrador, u.tipo_usuario FROM locadora l JOIN usuario u ON l.id_usuario = u.id;";

        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();

            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Long id = resultSet.getLong("id");
                String email = resultSet.getString("email");
                String senha = resultSet.getString("senha");
                String nome = resultSet.getString("nome");
                boolean administrador = resultSet.getBoolean("administrador");
                String tipoUsuario = resultSet.getString("tipo_usuario");
                String CNPJ = resultSet.getString("CNPJ");
                String cidade = resultSet.getString("cidade");
                Locadora locadora = new Locadora(id, email, senha, nome, administrador, tipoUsuario, CNPJ, cidade);
                listaLocadoras.add(locadora);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaLocadoras;
    }

    public Locadora get(Long id) {
        Locadora locadora = null;   
        String sql = "SELECT u.id, u.nome, u.senha, u.email, l.CNPJ, l.cidade,  u.administrador, u.tipo_usuario FROM locadora l JOIN usuario u ON l.id_usuario = u.id WHERE u.id = ?;";

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            
            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String email = resultSet.getString("email");
                String senha = resultSet.getString("senha");
                String nome = resultSet.getString("nome");
                boolean administrador = resultSet.getBoolean("administrador");
                String tipoUsuario = resultSet.getString("tipo_usuario");
                String CNPJ = resultSet.getString("CNPJ");
                String cidade = resultSet.getString("cidade");
                locadora = new Locadora(id, email, senha, nome, administrador, tipoUsuario, CNPJ, cidade);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
     return locadora;
    }

    public Locadora get(String CNPJ) {
        Locadora locadora = null;   
        String sql = "SELECT u.id, u.nome, u.senha, u.email, l.CNPJ, l.cidade,  u.administrador, u.tipo_usuario FROM locadora l JOIN usuario u ON l.id_usuario = u.id WHERE l.CNPJ = ?;";

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            
            statement.setString(1, CNPJ);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                Long id = resultSet.getLong("id");
                String email = resultSet.getString("email");
                String senha = resultSet.getString("senha");
                String nome = resultSet.getString("nome");
                boolean administrador = resultSet.getBoolean("administrador");
                String tipoUsuario = resultSet.getString("tipo_usuario");
                String cidade = resultSet.getString("cidade");
                locadora = new Locadora(id, email, senha, nome, administrador, tipoUsuario, CNPJ, cidade);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
     return locadora;
    }

    public void insert(Locadora locadora) {

        String sql = "INSERT INTO usuario (email, senha, nome, administrador, tipo_usuario) VALUES (?, ?, ?, ?, ?);";
        Usuario usuario =  new UsuarioDAO().get(locadora.getId());

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, usuario.getEmail());
            statement.setString(2, usuario.getSenha());
            statement.setString(3, usuario.getNome());
            statement.setBoolean(4, usuario.isAdministrador());
            statement.setString(5, usuario.getTipoUsuario());
            statement.executeUpdate();

            sql = "INSERT INTO locadora (id_usuario, CNPJ, cidade) VALUES (?, ?, ?);";
            statement = conn.prepareStatement(sql);
            statement.setLong(1, locadora.getId());
            statement.setString(2, locadora.getCNPJ());
            statement.setString(3, locadora.getCidade());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void delete(Locadora locadora) {
        // Por causa do 'ON DELETE CASCADE' se excluirmos um usuário, a locadora também será excluída
        String sql = "DELETE FROM usuario WHERE id = ?";

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setLong(1, locadora.getId());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void update(Locadora locadora) {

        String sql = "UPDATE usuario SET email = ?, senha = ?, nome = ?, administrador = ?, tipo_usuario = ? WHERE id = ?;";
        Usuario usuario =  new UsuarioDAO().get(locadora.getId());

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setString(1, usuario.getEmail());
            statement.setString(2, usuario.getSenha());
            statement.setString(3, usuario.getNome());
            statement.setBoolean(4, usuario.isAdministrador());
            statement.setString(5, usuario.getTipoUsuario());
            statement.executeUpdate();
            
            sql = "UPDATE locadora SET CNPJ = ?, cidade = ?;";
            statement = conn.prepareStatement(sql);
            statement.setString(1, locadora.getCNPJ());
            statement.setString(2, locadora.getCidade());
            statement.executeUpdate();
            
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}