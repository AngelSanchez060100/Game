/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import config.conexionBD;
import entidades.Videojuego;
import java.util.ArrayList;
import java.util.HashMap;
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
public class controladorVideojuego {
    //Instancia para la conexion

    conexionBD con = new conexionBD();
    JdbcTemplate jdbcTemplate = new JdbcTemplate(con.Conectar());
    ModelAndView mav = new ModelAndView(); //importar la de servlet

    //Metodo para obtener la vista de agregar
    @RequestMapping(value = "altaVideojuego.htm", method = RequestMethod.GET)
    public ModelAndView vistaAgregar() {
        mav.addAllObjects(obtenerTablaFK("empresa", "2"));
        mav.addObject(new Videojuego());
        mav.setViewName("altaVideojuego");
        return mav;
    }

    //Metodo para agregar
    @RequestMapping(value = "altaVideojuego.htm", method = RequestMethod.POST)
    public ModelAndView agregar(Videojuego p) {
        String sql = "Insert into videojuego (idEmpresa,titulo,clasificacion,numeroJugadores,fechaLanzamiento,codigoBarras,formato,precio,almacenamiento,idioma,plataforma) values(?,?,?,?,?,?,?,?,?,?,?)";
        System.out.println(p.getIdioma());
        this.jdbcTemplate.update(sql, p.getIdEmpresa(), p.getTitulo(), p.getClasificacion(), p.getNumeroJugadores(), p.getFechaLanzamiento(), p.getCodigoBarras(), p.getFormato(), p.getPrecio(), p.getAlmacenamiento(), p.getIdioma(), p.getPlataforma());
        return new ModelAndView("redirect:/altaVideojuego.htm");
    }

    /////////////1 ESTO ES LO NUEVO CLASE 2//////////////
    int idVideojuego;
    List datos;

    @RequestMapping("listaVideojuego.htm")

    public ModelAndView Listar() {

        String sql = "Select * from videojuego";
        datos = this.jdbcTemplate.queryForList(sql);
        
        List<Map<String, Object>> stream = datos;
        List<Integer> empresa = new ArrayList<>();
        List<String> empresaName = new ArrayList<>();
        
        stream.forEach((Map<String, Object> m) -> {
            empresa.add(Integer.parseInt(m.get("idEmpresa").toString()));
        });
        
        for(int i = 0; i < stream.size(); i++){
            
            List aux = this.jdbcTemplate.queryForList("select *from empresa where idEmpresa=" + empresa.get(i));
            List<Map<String, Object>> stream2 = aux;
            stream2.forEach((Map<String, Object> m) -> {
                empresaName.add(m.get("nombre").toString());
            });
            
        }
        
        for(int i = 0; i < stream.size(); i++){
            Map<String, Object> m = stream.get(i);
            m.replace("idEmpresa", empresaName.get(i));
        }
        
        mav.addObject("Lista", datos);
        mav.setViewName("listaVideojuego");
        return mav;
    }

    /////////////1 ESTO ES LO NUEVO CLASE 3//////////////
    @RequestMapping(value = "editarVideojuego.htm", method = RequestMethod.GET)
    public ModelAndView vistaEditar(HttpServletRequest request) {
        //Primer codigo es la variable declarada y el segundo es el atributo de la base
        idVideojuego = Integer.parseInt(request.getParameter("idVideojuego"));
        String sql = "select * from videojuego Where idVideojuego = " + idVideojuego;
        datos = this.jdbcTemplate.queryForList(sql);
        mav.addObject("Lista", datos);
        
        List<Map<String, Object>> stream = datos;
        int idFk = Integer.parseInt(stream.get(0).get("idEmpresa").toString());
        List<Map<String, Object>> stream2 = this.jdbcTemplate.queryForList("select nombre from empresa where idempresa=" + idFk);
        mav.addObject("empre", stream2);
        
        mav.addAllObjects(obtenerTablaFK("empresa", "2"));
        
        mav.setViewName("editarVideojuego");
        return mav;

    }

    //////MEDTODO PARA EDITAR/////
    @RequestMapping(value = "editarVideojuego.htm", method = RequestMethod.POST)
    public ModelAndView editar(Videojuego p) {
        String sql = "update videojuego set idEmpresa = ?, titulo = ?, clasificacion = ?, numeroJugadores = ?, fechaLanzamiento = ?, codigoBarras = ?, formato = ?, precio = ?, almacenamiento = ?, idioma = ?, plataforma = ? where idVideojuego = ?";
        this.jdbcTemplate.update(sql, p.getIdEmpresa(), p.getTitulo(), p.getClasificacion(), p.getNumeroJugadores(), p.getFechaLanzamiento(), p.getCodigoBarras(), p.getFormato(), p.getPrecio(), p.getAlmacenamiento(), p.getIdioma(), p.getPlataforma(), idVideojuego);
        return new ModelAndView("redirect:/listaVideojuego.htm");

    }

    /////METODO PARA ELIMINAR ////////
    @RequestMapping(value = "eliminarVideojuego.htm")
    public ModelAndView eliminar(HttpServletRequest request) {
        idVideojuego = Integer.parseInt(request.getParameter("idVideojuego"));
        String sql = "delete from videojuego Where idVideojuego = " + idVideojuego;
        this.jdbcTemplate.update(sql);
        return new ModelAndView("redirect:/listaVideojuego.htm");
    }
    
    int idQr;
    
    @RequestMapping(value = "qrVistaVideojuego.htm", method = RequestMethod.GET)
    public ModelAndView vistaQr(HttpServletRequest request) {
        
        idQr = Integer.parseInt(request.getParameter("idVideojuego")); // la variable que esta entre "" es el nombre de campo de la BD
        String sql = "select *from videojuego where idVideojuego=" + idQr;
        List results = this.jdbcTemplate.queryForList(sql);
        mav.addObject("listaQr", results);
        
        List<Map<String, Object>> stream = results;
        int idFk = Integer.parseInt(stream.get(0).get("idEmpresa").toString());
        List<Map<String, Object>> stream2 = this.jdbcTemplate.queryForList("select nombre from empresa where idempresa=" + idFk);
        mav.addObject("empre", stream2);
        
        mav.setViewName("qrVistaVideojuego");
        return mav;
        
    }
    
    //FUNCION PARA LISTAR TABLAS FK
    public Map<String, Object> obtenerTablaFK(String nombreTabla, String numeroLista){
        String sql = "select *from " + nombreTabla;
        List results = this.jdbcTemplate.queryForList(sql);
        Map<String, Object> m = new HashMap<>();
        m.put("lista"+numeroLista, results);
        return m;
    }

}
