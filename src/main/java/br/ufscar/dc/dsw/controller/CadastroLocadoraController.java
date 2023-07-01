package br.ufscar.dc.dsw.controller;

import br.ufscar.dc.dsw.dao.LocadoraDAO;
import br.ufscar.dc.dsw.dao.ClienteDAO;
import br.ufscar.dc.dsw.dao.LocacaoDAO;
import br.ufscar.dc.dsw.domain.Locadora;
import br.ufscar.dc.dsw.domain.Usuario;
import br.ufscar.dc.dsw.domain.Locacao;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = { "/registrar-locadora/*" })
public class CadastroLocadoraController extends HttpServlet {
    /*
    private static final long serialVersionUID = 1L;
    private ClienteDAO daoCliente;
    private LocadoraDAO daoLocadora;

    @Override
    public void init() {
        daoCliente = new ClienteDAO();
        daoLocadora = new LocadoraDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("PASSEI POR: CadastroLocadoraController");

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
        request.setAttribute("locadoras", getLocadoras());
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/locacao/formulario.jsp");
        dispatcher.forward(request, response);
    }

    private void insere(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        try {

            SimpleDateFormat reFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date data_sem_formatar = reFormat.parse(request.getParameter("dataLocacao"));
            java.sql.Date dataLocacao = new java.sql.Date(data_sem_formatar.getTime());

            String horarioString = request.getParameter("horario");
            SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
            java.util.Date horario_sem_formatar = timeFormat.parse(horarioString);
            java.sql.Time horario = new java.sql.Time(horario_sem_formatar.getTime());
            
            Locadora locadora = daoLocadora.get(Long.parseLong(request.getParameter("locadoraId")));
            Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");
            Locacao locacao = new Locacao(daoCliente.get(usuario.getId()), locadora,
                    dataLocacao, horario);
            
            if (!daoLocacao.existeLocacao(locadora.getCidade(), dataLocacao, horario)) {
                daoLocacao.insert(locacao);
                request.setAttribute("erroLocacao", "");
                request.setAttribute("locadoraParaEmail", locadora);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/SendEmail");
                dispatcher.forward(request, response);
                // response.sendRedirect("lista");
            }
            else {
                request.setAttribute("erroLocacao", "Horário indisponível");
                //apresentaFormCadastro(request, response);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/locacao/formulario.jsp");
                dispatcher.forward(request, response);
            }
            
        } catch (ParseException | RuntimeException | IOException e) {
            throw new ServletException(e);
        }
    }
    */
}
