package br.ufscar.dc.dsw.controller;

import java.io.IOException;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import br.ufscar.dc.dsw.domain.Usuario;
import br.ufscar.dc.dsw.domain.Locadora;

@WebServlet(urlPatterns = { "/SendEmail" })
public class SendEmailController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("PASSEI POR: SendEmailController.java");

        // Configurações do servidor de email
        String host = "smtp.gmail.com";
        String porta = "587";
        final String username = "webt2853@gmail.com";
        final String senha = "hveihbqvvdiuvpsd";

        // Propriedades do servidor de email
        Properties propriedades = new Properties();
        propriedades.put("mail.smtp.host", host);
        propriedades.put("mail.smtp.port", porta);
        propriedades.put("mail.smtp.auth", "true");
        propriedades.put("mail.smtp.starttls.enable", "true");

        // Autenticação do usuário
        Authenticator autenticador = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, senha);
            }
        };

        // Criação de uma nova sessão de email
        Session sessao = Session.getInstance(propriedades, autenticador);
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");
        Locadora locadora = (Locadora) request.getAttribute("locadoraParaEmail");

        // Criação da mensagem de email
        final Message mensagem = new MimeMessage(sessao);
        try {
            mensagem.setFrom(new InternetAddress(username));
            mensagem.setRecipients(Message.RecipientType.TO, InternetAddress.parse(username));
            mensagem.setSubject("Nova locação realizada!");
            mensagem.setText("Nome do cliente: " + usuario.getNome() + "\nEmail do cliente: " + usuario.getEmail()
                    + "\n\nNome da locadora: " + locadora.getNome() + "\nEmail da locadora: " + locadora.getEmail()
                    + "\n\n");
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        // Criação de uma thread para envio assíncrono do email
        Thread threadEnvioEmail = new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    // Envio do email
                    Transport.send(mensagem);
                    System.out.println("Email enviado com sucesso!");
                } catch (MessagingException e) {
                    e.printStackTrace();
                }
            }
        });

        // Inicia a thread para envio assíncrono do email
        threadEnvioEmail.start();
        RequestDispatcher dispatcher = request.getRequestDispatcher("/locacoes");
        dispatcher.forward(request, response);
        // response.sendRedirect("locacoes/lista");
    }
}