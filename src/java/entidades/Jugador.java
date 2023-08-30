/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.util.Date;
import java.text.SimpleDateFormat;

/**
 *
 * @author Brandon
 */
public class Jugador {

    Date dt = new java.util.Date();
    SimpleDateFormat simpleDate = new java.text.SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat simpleHour = new java.text.SimpleDateFormat("HH:mm");

    private int idJugador;
    private int idVideojuego;
    private String alias;
    private String pais;
    private String clan;
    private int nivel;
    private int victorias;
    private String horasJugadas = simpleHour.format(dt);
    private Long telefono;
    private String fechaNacimiento = simpleDate.format(dt);
    private String sexo;

    public Jugador(int idJugador, int idVideojuego, String alias, String pais, String clan, int nivel, int victorias, Long telefono, String sexo) {
        this.idJugador = idJugador;
        this.idVideojuego = idVideojuego;
        this.alias = alias;
        this.pais = pais;
        this.clan = clan;
        this.nivel = nivel;
        this.victorias = victorias;
        this.telefono = telefono;
        this.sexo = sexo;
    }

    public Jugador() {
    }

    public int getIdJugador() {
        return idJugador;
    }

    public void setIdJugador(int idJugador) {
        this.idJugador = idJugador;
    }

    public int getIdVideojuego() {
        return idVideojuego;
    }

    public void setIdVideojuego(int idVideojuego) {
        this.idVideojuego = idVideojuego;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public String getClan() {
        return clan;
    }

    public void setClan(String clan) {
        this.clan = clan;
    }

    public int getNivel() {
        return nivel;
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }

    public int getVictorias() {
        return victorias;
    }

    public void setVictorias(int victorias) {
        this.victorias = victorias;
    }

    public String getHorasJugadas() {
        return horasJugadas;
    }

    public void setHorasJugadas(String horasJugadas) {
        this.horasJugadas = horasJugadas;
    }

    public Long getTelefono() {
        return telefono;
    }

    public void setTelefono(Long telefono) {
        this.telefono = telefono;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

}
