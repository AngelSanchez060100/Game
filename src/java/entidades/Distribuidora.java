/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Brandon
 */
public class Distribuidora {

    Date dt = new java.util.Date();
    SimpleDateFormat sdh = new java.text.SimpleDateFormat("HH:mm:ss");

    private int idDistribuidora;
    private int idVideojuego;
    private String nombre;
    private int numSedes;
    private String formatoDistribuidora;
    private String horaApertura = sdh.format(dt);
    private String paginaWeb;
    private String pais;

    public Distribuidora() {
    }

    public Distribuidora(int idDistribuidora, int idVideojuego, String nombre, int numSedes, String formatoDistribuidora, String paginaWeb, String pais) {
        this.idDistribuidora = idDistribuidora;
        this.idVideojuego = idVideojuego;
        this.nombre = nombre;
        this.numSedes = numSedes;
        this.formatoDistribuidora = formatoDistribuidora;
        this.paginaWeb = paginaWeb;
        this.pais = pais;
    }

    public int getIdDistribuidora() {
        return idDistribuidora;
    }

    public void setIdDistribuidora(int idDistribuidora) {
        this.idDistribuidora = idDistribuidora;
    }

    public int getIdVideojuego() {
        return idVideojuego;
    }

    public void setIdVideojuego(int idVideojuego) {
        this.idVideojuego = idVideojuego;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getNumSedes() {
        return numSedes;
    }

    public void setNumSedes(int numSedes) {
        this.numSedes = numSedes;
    }

    public String getFormatoDistribuidora() {
        return formatoDistribuidora;
    }

    public void setFormatoDistribuidora(String formatoDistribuidora) {
        this.formatoDistribuidora = formatoDistribuidora;
    }

    public String getHoraApertura() {
        return horaApertura;
    }

    public void setHoraApertura(String horaApertura) {
        this.horaApertura = horaApertura;
    }

    public String getPaginaWeb() {
        return paginaWeb;
    }

    public void setPaginaWeb(String paginaWeb) {
        this.paginaWeb = paginaWeb;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }
}
