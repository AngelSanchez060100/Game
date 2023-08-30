/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import config.conexionBD;
import entidades.Empresa;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Brandon
 */
@Controller
public class controladorEmpresa {

    //Instancia para la conexion
    conexionBD con = new conexionBD();
    JdbcTemplate jdbcTemplate = new JdbcTemplate(con.Conectar());
    ModelAndView mav = new ModelAndView(); //importar la de servlet

    //Metodo para obtener la vista de agregar
    @RequestMapping(value = "altaEmpresa.htm", method = RequestMethod.GET)
    public ModelAndView vistaAgregar() {
        mav.addObject(new Empresa());
        mav.setViewName("altaEmpresa");
        return mav;

    }

    //Metodo para agregar
    @RequestMapping(value = "altaEmpresa.htm", method = RequestMethod.POST)
    public ModelAndView agregar(Empresa p) {
        String sql = "Insert into empresa (nombre,locacion,correo,numEmpleados,sitioWeb,fundacion,juegosPublicados,ceo) values(?,?,?,?,?,?,?,?)";
        this.jdbcTemplate.update(sql, p.getNombre(), p.getLocacion(), p.getCorreo(), p.getNumEmpleados(), p.getSitioWeb(), p.getFundacion(), p.getJuegosPublicados(), p.getCeo());
        return new ModelAndView("redirect:/altaEmpresa.htm");
    }

    /////////////1 ESTO ES LO NUEVO CLASE 2//////////////
    int idEmpresa;
    List datos;

    @RequestMapping("listaEmpresa.htm")

    public ModelAndView Listar() {

        String sql = "Select * from empresa";
        datos = this.jdbcTemplate.queryForList(sql);
        //la lista la mandamos a llamar del jsp
        mav.addObject("Lista", datos);
        mav.setViewName("listaEmpresa");
        return mav;
    }

    /////////////1 ESTO ES LO NUEVO CLASE 3//////////////
    @RequestMapping(value = "editarEmpresa.htm", method = RequestMethod.GET)
    public ModelAndView vistaEditar(HttpServletRequest request) {
        //Primer codigo es la variable declarada y el segundo es el atributo de la base
        idEmpresa = Integer.parseInt(request.getParameter("idEmpresa"));
        String sql = "select * from empresa Where idEmpresa = " + idEmpresa;
        datos = this.jdbcTemplate.queryForList(sql);
        mav.addObject("Lista", datos);
        mav.setViewName("editarEmpresa");
        return mav;

    }

    //////MEDTODO PARA EDITAR/////
    @RequestMapping(value = "editarEmpresa.htm", method = RequestMethod.POST)
    public ModelAndView editar(Empresa p) {
        String sql = "update empresa set nombre = ?, locacion = ?, correo = ?, numEmpleados = ?, sitioWeb = ?, fundacion = ?, juegosPublicados = ?, ceo = ? where idEmpresa = ?";
        this.jdbcTemplate.update(sql, p.getNombre(), p.getLocacion(), p.getCorreo(), p.getNumEmpleados(), p.getSitioWeb(), p.getFundacion(), p.getJuegosPublicados(), p.getCeo(), idEmpresa);
        return new ModelAndView("redirect:/listaEmpresa.htm");

    }

    /////METODO PARA ELIMINAR ////////
    @RequestMapping(value = "eliminarEmpresa.htm")
    public ModelAndView eliminar(HttpServletRequest request) {
        idEmpresa = Integer.parseInt(request.getParameter("idEmpresa"));
        String sql = "delete from empresa Where idEmpresa = " + idEmpresa;
        this.jdbcTemplate.update(sql);
        return new ModelAndView("redirect:/listaEmpresa.htm");
    }
    
    /////METODO PARA VISTA QR ////////
    int idQr;
    @RequestMapping(value = "qrVistaEmpresa.htm", method = RequestMethod.GET)
    public ModelAndView vistaQr(HttpServletRequest request) {
        
        idQr = Integer.parseInt(request.getParameter("idEmpresa")); 
        String sql = "select *from empresa where idEmpresa=" + idQr;
        List results = this.jdbcTemplate.queryForList(sql);
        mav.addObject("listaQr", results);
        mav.setViewName("qrVistaEmpresa");
        return mav;
        
    }
    
}
