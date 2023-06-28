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
            
            if (usuario.getTipoUsuario().equals("C")) {
                Cliente cliente = new ClienteDAO().get(usuario.getId());

                sql = "INSERT INTO cliente (id_usuario, CPF, telefone, sexo, data_nascimento) VALUES (?, ?, ?, ?, ?);";
                PreparedStatement cliente_statement = conn.prepareStatement(sql);
                cliente_statement.setLong(1, usuario.getId());
                cliente_statement.setString(2, cliente.getCPF());
                cliente_statement.setString(3, cliente.getTelefone());
                cliente_statement.setString(4, cliente.getSexo());
                cliente_statement.setDate(5, cliente.getDataNascimento());
                cliente_statement.executeUpdate();
                cliente_statement.close();
            }
            else if (usuario.getTipoUsuario().equals("L")) {
                Locadora locadora = new LocadoraDAO().get(usuario.getId());
                sql = "INSERT INTO locadora (id_usuario, CNPJ, cidade) VALUES (?, ?, ?);";
                PreparedStatement locadora_statement = conn.prepareStatement(sql);
                locadora_statement.setLong(1, usuario.getId());
                locadora_statement.setString(2, locadora.getCNPJ());
                locadora_statement.setString(3, locadora.getCidade());

                locadora_statement.executeUpdate();
                locadora_statement.close();
            }

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

    // PRECISA ATUALIZAR ATRIBUTOS DE CLIENTE/LOCADORA ??
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

            if (usuario.getTipoUsuario().equals("C")) {
                Cliente cliente = new ClienteDAO().get(usuario.getId());

                sql = "UPDATE cliente SET CPF = ?, telefone = ?, sexo = ?, data_nascimento = ? WHERE id_usuario = ?;";
                PreparedStatement cliente_statement = conn.prepareStatement(sql);
                cliente_statement.setString(1, cliente.getCPF());
                cliente_statement.setString(2, cliente.getTelefone());
                cliente_statement.setString(3, cliente.getSexo());
                cliente_statement.setDate(4, cliente.getDataNascimento());
                cliente_statement.setLong(5, usuario.getId());
                cliente_statement.executeUpdate();
                cliente_statement.close();
            }
            else if (usuario.getTipoUsuario() == "L") {
                Locadora locadora = new LocadoraDAO().get(usuario.getId());
                sql = "UPDATE locadora SET CNPJ = ?, cidade = ? WHERE id_usuario = ?;";
                PreparedStatement locadora_statement = conn.prepareStatement(sql);
                locadora_statement.setString(1, locadora.getCNPJ());
                locadora_statement.setString(2, locadora.getCidade());
                locadora_statement.setLong(3, usuario.getId());

                locadora_statement.executeUpdate();
                locadora_statement.close();
            }

            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
