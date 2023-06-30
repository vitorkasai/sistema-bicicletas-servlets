package br.ufscar.dc.dsw.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;

import br.ufscar.dc.dsw.domain.Cliente;

public class ClienteDAO extends GenericDAO {

    public List<Cliente> getAll() {

        List<Cliente> listaClientes = new ArrayList<>();
        // Retorna todas as colunas de cliente e também aqueles dados vindos da classe
        // pai Usuario
        String sql = "SELECT u.id, u.nome, u.senha, u.email, c.CPF, c.telefone, c.sexo, c.data_nascimento,  u.administrador, u.tipo_usuario FROM cliente c JOIN usuario u ON c.id_usuario = u.id;";

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
                String CPF = resultSet.getString("CPF");
                String telefone = resultSet.getString("telefone");
                String sexo = resultSet.getString("sexo");
                Date data_nascimento = resultSet.getDate("data_nascimento");
                Cliente cliente = new Cliente(id, email, senha, nome, administrador, tipoUsuario, CPF, telefone, sexo,
                        data_nascimento);
                listaClientes.add(cliente);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaClientes;
    }

    public Cliente get(Long id) {
        Cliente cliente = null;
        String sql = "SELECT u.id, u.nome, u.senha, u.email, c.CPF, c.telefone, c.sexo, c.data_nascimento,  u.administrador, u.tipo_usuario FROM cliente c JOIN usuario u ON c.id_usuario = u.id WHERE u.id = ?;";

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
                String CPF = resultSet.getString("CPF");
                String telefone = resultSet.getString("telefone");
                String sexo = resultSet.getString("sexo");
                Date data_nascimento = resultSet.getDate("data_nascimento");
                cliente = new Cliente(id, email, senha, nome, administrador, tipoUsuario, CPF, telefone, sexo,
                        data_nascimento);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return cliente;
    }

    public Cliente get(String CPF) {
        Cliente cliente = null;
        String sql = "SELECT u.id, u.nome, u.senha, u.email, c.CPF, c.telefone, c.sexo, c.data_nascimento,  u.administrador, u.tipo_usuario FROM cliente c JOIN usuario u ON c.id_usuario = u.id WHERE c.CPF = ?;";

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setString(1, CPF);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                Long id = resultSet.getLong("id");
                String email = resultSet.getString("email");
                String senha = resultSet.getString("senha");
                String nome = resultSet.getString("nome");
                String administrador = resultSet.getString("administrador");
                String tipoUsuario = resultSet.getString("tipo_usuario");
                String telefone = resultSet.getString("telefone");
                String sexo = resultSet.getString("sexo");
                Date data_nascimento = resultSet.getDate("data_nascimento");
                cliente = new Cliente(id, email, senha, nome, administrador, tipoUsuario, CPF, telefone, sexo,
                        data_nascimento);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return cliente;
    }

    public void insert(Cliente cliente) {

        try {
            Connection conn = this.getConnection();
          
            String sql = "INSERT INTO cliente (id_usuario, CPF, telefone, sexo, data_nascimento) VALUES (?, ?, ?, ?, ?);";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(1, cliente.getId());
            statement.setString(2, cliente.getCPF());
            statement.setString(3, cliente.getTelefone());
            statement.setString(4, cliente.getSexo());
            statement.setDate(5, cliente.getDataNascimento());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void delete(Cliente cliente) {
        // Por causa do 'ON DELETE CASCADE' se excluirmos um usuário, a locadora também
        // será excluída
        String sql = "DELETE FROM usuario WHERE id = ?";

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setLong(1, cliente.getId());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void update(Cliente cliente) {

        try {
            Connection conn = this.getConnection();

            String sql = "UPDATE cliente SET CPF = ?, telefone = ?, sexo = ?, data_nascimento = ? WHERE id_usuario = ?;";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, cliente.getCPF());
            statement.setString(2, cliente.getTelefone());
            statement.setString(3, cliente.getSexo());
            statement.setDate(4, cliente.getDataNascimento());
            statement.setLong(5, cliente.getId());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}