package br.ufscar.dc.dsw.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.dsw.domain.Usuario;
import br.ufscar.dc.dsw.domain.Cliente;
import br.ufscar.dc.dsw.domain.Locadora;

public class UsuarioDAO extends GenericDAO {

    public List<Usuario> getAll() {

        List<Usuario> listaUsuarios = new ArrayList<>();
        String sql = "SELECT * from usuario;";

        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();

            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {

                Long id = resultSet.getLong("id");
                String email = resultSet.getString("email");
                String senha = resultSet.getString("senha");
                String nome = resultSet.getString("nome");
                String administrador = resultSet.getString("administrador");
                String tipoUsuario = resultSet.getString("tipo_usuario");
                Usuario usuario = new Usuario(id, email, senha, nome, administrador, tipoUsuario);
                listaUsuarios.add(usuario);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaUsuarios;
    }

    public Usuario get(Long id) {
        Usuario usuario = null;   
        String sql = "SELECT * FROM usuario WHERE id = ?;";

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            
            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String email = resultSet.getString("email");
                String senha = resultSet.getString("senha");
                String nome = resultSet.getString("nome");
                String administrador = resultSet.getString("administrador");
                String tipoUsuario = resultSet.getString("tipo_usuario");
                usuario = new Usuario(id, email, senha, nome, administrador, tipoUsuario);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
     return usuario;
    }

    public Usuario get(String email) {
        Usuario usuario = null;   
        String sql = "SELECT * FROM usuario WHERE email = ?;";

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            
            statement.setString(1, email);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                Long id = resultSet.getLong("id");
                String senha = resultSet.getString("senha");
                String nome = resultSet.getString("nome");
                String administrador = resultSet.getString("administrador");
                String tipoUsuario = resultSet.getString("tipo_usuario");
                usuario = new Usuario(id, email, senha, nome, administrador, tipoUsuario);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
     return usuario;
    }


    public void insert(Usuario usuario) {

        String sql = "INSERT INTO usuario (email, senha, nome, administrador, tipo_usuario) VALUES (?, ?, ?, ?, ?);";

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, usuario.getEmail());
            statement.setString(2, usuario.getSenha());
            statement.setString(3, usuario.getNome());
            statement.setString(4, usuario.getAdministrador());
            statement.setString(5, usuario.getTipoUsuario());

            statement.executeUpdate();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void delete(Usuario usuario) {
        String sql = "DELETE FROM usuario WHERE id = ?;";

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setLong(1, usuario.getId());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void update(Usuario usuario) {
        String sql = "UPDATE usuario SET email = ?, senha = ?, nome = ?, administrador = ?, tipo_usuario = ? WHERE id = ?;";

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setString(1, usuario.getEmail());
            statement.setString(2, usuario.getSenha());
            statement.setString(3, usuario.getNome());
            statement.setString(4, usuario.getAdministrador());
            statement.setString(5, usuario.getTipoUsuario());
            statement.setLong(6, usuario.getId());
            statement.executeUpdate();
            statement.close();

            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
