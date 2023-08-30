/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package config;

import org.springframework.jdbc.datasource.DriverManagerDataSource;

/**
 *
 * @author Alejandro
 */
public class conexionBD {
    public DriverManagerDataSource Conectar() {
        DriverManagerDataSource fuente = new DriverManagerDataSource();
        fuente.setDriverClassName("com.mysql.jdbc.Driver");
        fuente.setUrl("jdbc:mysql://localhost:3306/videojuegoSpring");
        fuente.setUsername("root");
        return fuente;
    }
}
