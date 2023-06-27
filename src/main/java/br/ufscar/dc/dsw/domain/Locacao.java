package br.ufscar.dc.dsw.domain;

import java.sql.Date;
import java.sql.Time;

public class Locacao {

    private Cliente cliente;
    private Locadora locadora;
    private Date dia;
    private Time horario;

    public Locacao(Cliente cliente, Locadora locadora, Date dia, Time horario) {
        this.setCliente(cliente);
        this.setLocadora(locadora);
        this.setDia(dia);
        this.setHorario(horario);
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Locadora getLocadora() {
        return locadora;
    }

    public void setLocadora(Locadora locadora) {
        this.locadora = locadora;
    }

    public Date getDia() {
        return dia;
    }

    public void setDia(Date dia) {
        this.dia = dia;
    }

    public Time getHorario() {
        return horario;
    }

    public void setHorario(Time horario) {
        this.horario = horario;
    }
}