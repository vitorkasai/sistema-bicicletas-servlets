package br.ufscar.dc.dsw.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.ufscar.dc.dsw.dao.UsuarioDAO;
import br.ufscar.dc.dsw.domain.Usuario;
import br.ufscar.dc.dsw.util.Erro;
import br.ufscar.dc.dsw.domain.Locadora;
import br.ufscar.dc.dsw.domain.Locacao;
import br.ufscar.dc.dsw.dao.LocadoraDAO;
import br.ufscar.dc.dsw.dao.LocacaoDAO;
import java.util.List;



@WebServlet(name = "Index", urlPatterns = { "/index.jsp", "/logout.jsp" })
public class IndexController extends HttpServlet {

	private static final long serialVersionUID = 1L;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("PASSEI POR: IndexController"); 
		Erro erros = new Erro();
		if (request.getParameter("bOK") != null) {
			String login = request.getParameter("login");
			String senha = request.getParameter("senha");
			UsuarioDAO dao = new UsuarioDAO();
			Usuario usuario = dao.get(login);
			if (usuario != null) {
				if (usuario.getSenha().equals(senha)) {
					request.getSession().setAttribute("usuarioLogado", usuario);
					if (usuario.getAdministrador().equals("1")) {
						response.sendRedirect("admin/");
					} else {
						response.sendRedirect("usuario/");
					}
					return;
				} else {
					erros.add("senha_invalida");
				}
			} else {
				erros.add("usuario_nao_encontrado");
			}
		}
		request.getSession().invalidate();

		List<Locadora> listaLocadoras = new LocadoraDAO().getAll();
    	request.getSession().setAttribute("listaLocadoras", listaLocadoras);

		List<Locacao> listaLocacoes = new LocacaoDAO().getAll();
        request.getSession().setAttribute("listaLocacoes", listaLocacoes);


		request.setAttribute("mensagens", erros);
		String URL = "/login.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(URL);
		rd.forward(request, response);
	}
}
