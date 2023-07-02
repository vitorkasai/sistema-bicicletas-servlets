package br.ufscar.dc.dsw.controller;

import br.ufscar.dc.dsw.dao.UsuarioDAO;
import br.ufscar.dc.dsw.dao.ClienteDAO;
import br.ufscar.dc.dsw.domain.Usuario;
import br.ufscar.dc.dsw.domain.Cliente;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/registrar-cliente/*" })
public class CadastroClienteController extends HttpServlet {

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
        System.out.println("PASSEI POR: CadastroClienteController");
        String action = request.getPathInfo();
        System.out.println("ACTION -> " + request.getPathInfo());
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

                default:
                    apresentaFormCadastro(request, response);
                    break;
            }
        } catch (RuntimeException | IOException | ServletException e) {
            throw new ServletException(e);
        }
    }

    private void apresentaFormCadastro(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/cadastroUsuario/cliente/formulario.jsp");
        dispatcher.forward(request, response);
    }

    private void insere(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        try {
            String email = request.getParameter("email");
            // Verificar se o email já existe
            if (daoUsuario.get(email) != null) {
                String mensagemErro = "O email já está em uso.";
                request.setAttribute("mensagemErro", mensagemErro);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/cadastroUsuario/cliente/formulario.jsp");
                dispatcher.forward(request, response);
                return;
            }

            String CPF = request.getParameter("CPF");
            // Verificar se o CPF já existe
            if (daoCliente.get(CPF) != null) {
                String mensagemErro = "O CPF já está em uso.";
                request.setAttribute("mensagemErro", mensagemErro);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/cadastroUsuario/cliente/formulario.jsp");
                dispatcher.forward(request, response);
                return;
            }

            String nome = request.getParameter("nome");
            String senha = request.getParameter("senha");

            String administrador = request.getParameter("administrador");
            if (administrador == null) {
                administrador = "0";
            }
            Usuario usuario = new Usuario(email, senha, nome, administrador, "C");
            daoUsuario.insert(usuario);

            String telefone = request.getParameter("telefone");
            String sexo = request.getParameter("sexo");
            SimpleDateFormat reFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date data_sem_formatar = reFormat.parse(request.getParameter("dataNascimento"));
            java.sql.Date dataNascimento = new java.sql.Date(data_sem_formatar.getTime());
            usuario = daoUsuario.get(email);

            Cliente cliente = new Cliente(usuario.getId(), email, senha, nome, administrador, "C", CPF, telefone, sexo,
                    dataNascimento);
            daoCliente.insert(cliente);
            response.sendRedirect(request.getContextPath() + "/index.jsp");

        } catch (ParseException | RuntimeException | IOException e) {
            throw new ServletException(e);
        }
    }
}
