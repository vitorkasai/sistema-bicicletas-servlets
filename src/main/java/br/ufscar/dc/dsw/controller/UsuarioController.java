package br.ufscar.dc.dsw.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.ufscar.dc.dsw.domain.Cliente;
import br.ufscar.dc.dsw.domain.Usuario;
import br.ufscar.dc.dsw.domain.Locacao;
import br.ufscar.dc.dsw.util.Erro;
import br.ufscar.dc.dsw.dao.LocacaoDAO;
import br.ufscar.dc.dsw.dao.ClienteDAO;
import java.util.List;
import java.util.ArrayList;
import java.sql.Time;


@WebServlet(urlPatterns = { "/usuario/*" })
public class UsuarioController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("PASSEI POR: UsuarioController");
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");
        Erro erros = new Erro();
        java.util.Date horarioAtual = new java.util.Date();
        if (usuario == null) 
            response.sendRedirect(request.getContextPath());
        else if (usuario.getAdministrador().equals("0")) {
            Cliente cliente = new ClienteDAO().get(usuario.getId());

            List<Locacao> listaDataHorario = new LocacaoDAO().getDataHorarioCPF(cliente.getCPF());
            // Verificando se existem locacoes expiradas
            List<Locacao> locacoesExpiradas = new ArrayList<>();
            for (Locacao locacao : listaDataHorario) {
                java.sql.Date diaLocacao = locacao.getDia();
                Time horarioLocacao = locacao.getHorario();
                
                // Convertendo a data e o horário atual para o tipo java.sql.Timestamp
                java.sql.Timestamp timestampAtual = new java.sql.Timestamp(horarioAtual.getTime());

                // Criando um objeto java.sql.Timestamp para a data e horário da locação
                java.sql.Timestamp timestampLocacao = new java.sql.Timestamp(diaLocacao.getTime() + horarioLocacao.getTime());

                // Comparando os timestamps para verificar se a locação está expirada
                if (timestampAtual.after(timestampLocacao)) {
                    locacoesExpiradas.add(locacao);
                    System.out.println("HORARIOS EXPIRADOS:");
                    System.out.println(locacao.getDia() + " " + locacao.getHorario());
                }
                
            }
            
            request.setAttribute("locacoesExpiradas", locacoesExpiradas);
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/logado/usuario/index.jsp");
            dispatcher.forward(request, response);

        } 
        else {
            erros.add("Acesso não autorizado!");
            erros.add("Apenas Papel [USER] tem acesso a essa página");
            request.setAttribute("mensagens", erros);
            RequestDispatcher rd = request.getRequestDispatcher("/noAuth.jsp");
            rd.forward(request, response);
        }
    }
	
	private boolean isLocacaoExpirada(Locacao locacao) {
		List<Locacao> locacoesExpiradas = // Obtenha a lista de locações expiradas do banco de dados ou de onde você armazena essas informações
	for (Locacao locExp : locacoesExpiradas) {
		if (locExp.getDia().equals(locacao.getDia()) && locExp.getHorario().equals(locacao.getHorario())) {
			return true;
		}
	}
	return false;
}

}
