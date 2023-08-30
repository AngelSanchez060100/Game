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
public class Videojuego {

    private int IdVideojuego;
    private int IdEmpresa;
    private String titulo;
    private String clasificacion;
    private int numeroJugadores;
    private String fechaLanzamiento = new SimpleDateFormat("dd/MM/yy").format(new Date());
    private long codigoBarras;
    private String formato;
    private double precio;
    private int almacenamiento;
    private String idioma;
    private String plataforma;

    public Videojuego() {
    }

    public Videojuego(int IdVideojuego, int IdEmpresa, String titulo, String clasificacion, int numeroJugadores, String fechaLanzamiento, long codigoBarras, String formato, double precio, int almacenamiento, String idioma, String plataforma) {
        this.IdVideojuego = IdVideojuego;
        this.IdEmpresa = IdEmpresa;
        this.titulo = titulo;
        this.clasificacion = clasificacion;
        this.numeroJugadores = numeroJugadores;
        this.fechaLanzamiento = fechaLanzamiento;
        this.codigoBarras = codigoBarras;
        this.formato = formato;
        this.precio = precio;
        this.almacenamiento = almacenamiento;
        this.idioma = idioma;
        this.plataforma = plataforma;
    }
    
    

    public int getIdVideojuego() {
        return IdVideojuego;
    }

    public void setIdVideojuego(int IdVideojuego) {
        this.IdVideojuego = IdVideojuego;
    }

    public int getIdEmpresa() {
        return IdEmpresa;
    }

    public void setIdEmpresa(int IdEmpresa) {
        this.IdEmpresa = IdEmpresa;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getClasificacion() {
        return clasificacion;
    }

    public void setClasificacion(String clasificacion) {
        this.clasificacion = clasificacion;
    }

    public int getNumeroJugadores() {
        return numeroJugadores;
    }

    public void setNumeroJugadores(int numeroJugadores) {
        this.numeroJugadores = numeroJugadores;
    }

    public String getFechaLanzamiento() {
        return fechaLanzamiento;
    }

    public void setFechaLanzamiento(String fechaLanzamiento) {
        this.fechaLanzamiento = fechaLanzamiento;
    }

    public long getCodigoBarras() {
        return codigoBarras;
    }

    public void setCodigoBarras(long codigoBarras) {
        this.codigoBarras = codigoBarras;
    }

    public String getFormato() {
        return formato;
    }

    public void setFormato(String formato) {
        this.formato = formato;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getAlmacenamiento() {
        return almacenamiento;
    }

    public void setAlmacenamiento(int almacenamiento) {
        this.almacenamiento = almacenamiento;
    }

    public String getIdioma() {
        return idioma;
    }

    public void setIdioma(String idioma) {
        this.idioma = idioma;
    }

    public String getPlataforma() {
        return plataforma;
    }

    public void setPlataforma(String plataforma) {
        this.plataforma = plataforma;
    }

    

}
