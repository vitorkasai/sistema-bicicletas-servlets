package br.ufscar.dc.dsw.controller;

import br.ufscar.dc.dsw.dao.LocadoraDAO;
import br.ufscar.dc.dsw.dao.ClienteDAO;
import br.ufscar.dc.dsw.dao.UsuarioDAO;

import br.ufscar.dc.dsw.domain.Locadora;
import br.ufscar.dc.dsw.domain.Cliente;
import br.ufscar.dc.dsw.domain.Usuario;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.Date;
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
        System.out.println("ACTION -> " + action);
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
        RequestDispatcher dispatcher = request.getRequestDispatcher("/cliente/lista.jsp");
        dispatcher.forward(request, response);
    }

    private Map<Long, String> getLocadoras() {
        Map<Long, String> locadoras = new HashMap<>();
        for (Locadora locadora : new LocadoraDAO().getAll()) {
            locadoras.put(locadora.getId(), locadora.getNome());
        }
        return locadoras;
    }

    private void apresentaFormCadastro(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("locadoras", getLocadoras());
        RequestDispatcher dispatcher = request.getRequestDispatcher("/cliente/formulario.jsp");
        dispatcher.forward(request, response);
    }

    private void apresentaFormEdicao(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Cliente cliente = daoCliente.get(id);
        request.setAttribute("cliente", cliente);
        request.setAttribute("locadoras", getLocadoras());
        RequestDispatcher dispatcher = request.getRequestDispatcher("/cliente/formulario.jsp");
        dispatcher.forward(request, response);
    }

    private void insere(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String nome = request.getParameter("nome");
        String senha = request.getParameter("senha");
        Usuario usuario = new Usuario(email, senha, nome, "1", "C");
        daoUsuario.insert(usuario);

        String CPF = request.getParameter("CPF");
        String telefone = request.getParameter("telefone");
        String sexo = request.getParameter("sexo");
        Date dataNascimento = Date.valueOf(request.getParameter("data_nascimento"));
        Cliente cliente = new Cliente(usuario.getId(), email, senha, nome, "1", "C", CPF, telefone, sexo,
                dataNascimento);
        daoCliente.insert(cliente);
        response.sendRedirect("lista");
    }

    private void atualize(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String nome = request.getParameter("nome");
        String senha = request.getParameter("senha");
        Usuario usuario = new Usuario(email, senha, nome, "1", "C");
        daoUsuario.insert(usuario);

        String CPF = request.getParameter("CPF");
        String telefone = request.getParameter("telefone");
        String sexo = request.getParameter("sexo");
        Date dataNascimento = Date.valueOf(request.getParameter("data_nascimento"));
        Cliente cliente = new Cliente(usuario.getId(), email, senha, nome, "1", "C", CPF, telefone, sexo,
                dataNascimento);
        daoCliente.update(cliente);
        response.sendRedirect("lista");
    }

    private void remove(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("id recuperado em ClienteController: " + request.getParameter("id"));
        Usuario usuario = daoUsuario.get(Long.parseLong(request.getParameter("id")));
        daoUsuario.delete(usuario);
        response.sendRedirect("lista");
    }
}
