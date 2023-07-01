package br.ufscar.dc.dsw.controller;

import br.ufscar.dc.dsw.dao.LocadoraDAO;
import br.ufscar.dc.dsw.dao.ClienteDAO;
import br.ufscar.dc.dsw.dao.UsuarioDAO;

import br.ufscar.dc.dsw.domain.Cliente;
import br.ufscar.dc.dsw.domain.Usuario;

import java.io.IOException;
import java.util.List;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/clientes/*" })
public class ClienteController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ClienteDAO daoCliente;
    private UsuarioDAO daoUsuario;

    @Override
    public void init() {
        daoCliente = new ClienteDAO();
        daoUsuario = new UsuarioDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("PASSEI POR: ClienteController");
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");
        if (usuario == null || !usuario.getAdministrador().equals("1")) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin");
            dispatcher.forward(request, response);
            return;
        }
        String action = request.getPathInfo();
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "/cadastro":
                    apresentaFormCadastro(request, response);
                    break;
                case "/insercao":
                    insere(request, response);
                    break;
                case "/remocao":
                    remove(request, response);
                    break;
                case "/edicao":
                    apresentaFormEdicao(request, response);
                    break;
                case "/atualizacao":
                    atualize(request, response);
                    break;
                default:
                    lista(request, response);
                    break;
            }
        } catch (RuntimeException | IOException | ServletException e) {
            throw new ServletException(e);
        }
    }

    private void lista(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Cliente> listaClientes = daoCliente.getAll();
        request.setAttribute("listaClientes", listaClientes);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/cliente/lista.jsp");
        dispatcher.forward(request, response);
    }


    private void apresentaFormCadastro(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getSession().setAttribute("listaLocadoras", new LocadoraDAO().getAll());
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/cliente/formulario.jsp");
        dispatcher.forward(request, response);
    }

    private void apresentaFormEdicao(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Cliente cliente = daoCliente.get(id);
        request.setAttribute("cliente", cliente);
        request.getSession().setAttribute("listaLocadoras", new LocadoraDAO().getAll());
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/cliente/formulario.jsp");
        dispatcher.forward(request, response);
    }

    private void insere(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        try {
            String email = request.getParameter("email");
            String nome = request.getParameter("nome");
            String senha = request.getParameter("senha");

            String administrador = request.getParameter("administrador");
            if (administrador == null) {
                administrador = "0";
            }

            Usuario usuario = new Usuario(email, senha, nome, administrador, "C");
            daoUsuario.insert(usuario);

            String CPF = request.getParameter("CPF");
            String telefone = request.getParameter("telefone");
            String sexo = request.getParameter("sexo");
            SimpleDateFormat reFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date data_sem_formatar = reFormat.parse(request.getParameter("dataNascimento"));
            java.sql.Date dataNascimento = new java.sql.Date(data_sem_formatar.getTime());
            usuario = daoUsuario.get(email);

            Cliente cliente = new Cliente(usuario.getId(), email, senha, nome, administrador, "C", CPF, telefone, sexo,
                    dataNascimento);

            daoCliente.insert(cliente);
            response.sendRedirect("lista");

        } catch (ParseException | RuntimeException | IOException e) {
            throw new ServletException(e);
        }
    }

    private void atualize(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        try {
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");
            String nome = request.getParameter("nome");

            String administrador = request.getParameter("administrador");
            if (administrador == null) {
                administrador = "0";
            }

            Usuario usuario = daoUsuario.get(Long.parseLong(request.getParameter("id")));

            usuario.setEmail(email);
            usuario.setSenha(senha);
            usuario.setNome(nome);
            usuario.setAdministrador(administrador);
            daoUsuario.update(usuario);

            String cpf = request.getParameter("CPF");
            String telefone = request.getParameter("telefone");
            String sexo = request.getParameter("sexo");

            SimpleDateFormat reFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date data_sem_formatar = reFormat.parse(request.getParameter("dataNascimento"));
            java.sql.Date dataNascimento = new java.sql.Date(data_sem_formatar.getTime());

            Cliente cliente = daoCliente.get(usuario.getId());

            cliente.setCPF(cpf);
            cliente.setTelefone(telefone);
            cliente.setSexo(sexo);
            cliente.setDataNascimento(dataNascimento);

            daoCliente.update(cliente);
            response.sendRedirect("lista");
        } catch (ParseException | RuntimeException | IOException e) {
            throw new ServletException(e);
        }
    }

    private void remove(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Usuario usuario = daoUsuario.get(Long.parseLong(request.getParameter("id")));
            daoUsuario.delete(usuario);
            response.sendRedirect("lista");
        } catch (RuntimeException | IOException e) {
            throw new ServletException(e);
        }

    }
}
