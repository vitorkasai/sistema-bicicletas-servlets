package br.ufscar.dc.dsw.controller;

import br.ufscar.dc.dsw.dao.LocadoraDAO;
import br.ufscar.dc.dsw.dao.ClienteDAO;
import br.ufscar.dc.dsw.dao.UsuarioDAO;
import br.ufscar.dc.dsw.dao.LocacaoDAO;

import br.ufscar.dc.dsw.domain.Locadora;
import br.ufscar.dc.dsw.domain.Cliente;
import br.ufscar.dc.dsw.domain.Usuario;
import br.ufscar.dc.dsw.domain.Locacao;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/locacoes/*" })
public class LocacaoController extends HttpServlet {
    

    private static final long serialVersionUID = 1L;
    private ClienteDAO daoCliente;
    private UsuarioDAO daoUsuario;
    private LocacaoDAO daoLocacao;

    @Override
    public void init() {
        daoCliente = new ClienteDAO();
        daoUsuario = new UsuarioDAO();
        daoLocacao = new LocacaoDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("PASSEI POR: LocacaoController");
        System.out.println("ACTION -> " + request.getPathInfo());
        String action = request.getPathInfo();
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "/cadastro":
                    apresentaFormCadastro(request, response);
                    break;
                /*
                 * case "/insercao":
                 * insere(request, response);
                 * break;
                 */
                default:
                    lista(request, response);
                    break;
            }
        } catch (RuntimeException | IOException | ServletException e) {
            throw new ServletException(e);
        }
    }

    private void lista(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Locacao> listaLocacoes = daoLocacao.getAll();
        request.setAttribute("listaLocacoes", listaLocacoes);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/usuario/index.jsp");
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
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/locacao/formulario.jsp");
        dispatcher.forward(request, response);
    }

    /*
     * private void insere(HttpServletRequest request, HttpServletResponse response)
     * throws ServletException, IOException {
     * request.setCharacterEncoding("UTF-8");
     * 
     * try {
     * String email = request.getParameter("email");
     * String nome = request.getParameter("nome");
     * String senha = request.getParameter("senha");
     * 
     * String administrador = request.getParameter("administrador");
     * if (administrador == null) {
     * administrador = "0";
     * }
     * 
     * Usuario usuario = new Usuario(email, senha, nome, administrador, "C");
     * daoUsuario.insert(usuario);
     * 
     * String CPF = request.getParameter("CPF");
     * String telefone = request.getParameter("telefone");
     * String sexo = request.getParameter("sexo");
     * SimpleDateFormat reFormat = new SimpleDateFormat("yyyy-MM-dd");
     * java.util.Date data_sem_formatar =
     * reFormat.parse(request.getParameter("dataNascimento"));
     * java.sql.Date dataNascimento = new
     * java.sql.Date(data_sem_formatar.getTime());
     * usuario = daoUsuario.get(email);
     * 
     * Cliente cliente = new Cliente(usuario.getId(), email, senha, nome,
     * administrador, "C", CPF, telefone, sexo,
     * dataNascimento);
     * 
     * daoCliente.insert(cliente);
     * response.sendRedirect("lista");
     * 
     * } catch (ParseException | RuntimeException | IOException e) {
     * throw new ServletException(e);
     * }
     * }
     */
}
