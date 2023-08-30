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
public class Empresa {

    Date tiempo = new java.util.Date();

    SimpleDateFormat simpleDateFormatFecha = new java.text.SimpleDateFormat("dd/MM/yyyy");

    private int IdEmpresa;
    private String nombre;
    private String locacion;
    private String correo;
    private int numEmpleados;
    private String sitioWeb;
    private String fundacion = simpleDateFormatFecha.format(tiempo);
    private int juegosPublicados;
    private String ceo;

    public Empresa() {
    }

    public Empresa(int IdEmpresa, String nombre, String locacion, String correo, int numEmpleados, String sitioWeb, int juegosPublicados, String ceo) {
        this.IdEmpresa = IdEmpresa;
        this.nombre = nombre;
        this.locacion = locacion;
        this.correo = correo;
        this.numEmpleados = numEmpleados;
        this.sitioWeb = sitioWeb;
        this.juegosPublicados = juegosPublicados;
        this.ceo = ceo;
    }

    public int getIdEmpresa() {
        return IdEmpresa;
    }

    public void setIdEmpresa(int IdEmpresa) {
        this.IdEmpresa = IdEmpresa;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getLocacion() {
        return locacion;
    }

    public void setLocacion(String locacion) {
        this.locacion = locacion;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public int getNumEmpleados() {
        return numEmpleados;
    }

    public void setNumEmpleados(int numEmpleados) {
        this.numEmpleados = numEmpleados;
    }

    public String getSitioWeb() {
        return sitioWeb;
    }

    public void setSitioWeb(String sitioWeb) {
        this.sitioWeb = sitioWeb;
    }

    public String getFundacion() {
        return fundacion;
    }

    public void setFundacion(String fundacion) {
        this.fundacion = fundacion;
    }

    public int getJuegosPublicados() {
        return juegosPublicados;
    }

    public void setJuegosPublicados(int juegosPublicados) {
        this.juegosPublicados = juegosPublicados;
    }

    public String getCeo() {
        return ceo;
    }

    public void setCeo(String ceo) {
        this.ceo = ceo;
    }

}
