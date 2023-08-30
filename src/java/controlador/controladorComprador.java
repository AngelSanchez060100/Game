/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import config.conexionBD;
import entidades.Comprador;
import java.net.UnknownHostException;
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
 * @author Alejandro
 */
@Controller
public class controladorComprador {
    
    conexionBD conexion = new conexionBD();
    JdbcTemplate jdbcTemplate = new JdbcTemplate(conexion.Conectar());
    ModelAndView mav = new ModelAndView(); //Importa la de servlet
    
    int id;
    List datos, datos2, datos3, datos4;
    
    @RequestMapping(value = "altaComprador.htm", method = RequestMethod.GET)
    public ModelAndView vistaAgregar() {
        mav.addAllObjects(obtenerTablaFK("distribuidora", "2"));
        mav.addAllObjects(obtenerTablaFK("videojuego", "3"));
        mav.addObject(new Comprador());
        mav.setViewName("altaComprador");
        return mav;
    }
    
    @RequestMapping(value = "altaComprador.htm", method = RequestMethod.POST)
    public ModelAndView Agregar(Comprador c){
        String sql = "insert into comprador(idDistribuidora, idVideojuego, nombre, aPaterno, aMaterno, email, direccion, telefono, fechaNacimiento, sexo) "
                + "values(?,?,?,?,?,?,?,?,?,?)";
        this.jdbcTemplate.update(sql, c.getIdDistribuidora(), c.getIdVideojuego(), c.getNombre(), c.getaPaterno(),
                c.getaMaterno(), c.getEmail(), c.getDireccion(), c.getTelefono(), c.getFechaNacimiento(), c.getSexo());
        return new ModelAndView("redirect:/altaComprador.htm");
    }
    
    @RequestMapping("listaComprador.htm")
    public ModelAndView Listar() throws UnknownHostException {
    
        String sql = "select *from comprador";
        datos = this.jdbcTemplate.queryForList(sql);
        List<Map<String, Object>> stream = datos;
        List<Integer> dist = new ArrayList<>();
        List<String> distName = new ArrayList<>();
        List<Integer> video = new ArrayList<>();
        List<String> videoName = new ArrayList<>();
        
        stream.forEach((Map<String, Object> m) -> {
            dist.add(Integer.parseInt(m.get("idDistribuidora").toString()));
            video.add(Integer.parseInt(m.get("idVideojuego").toString()));
        });
        
        for(int i = 0; i < stream.size(); i++){
            List aux = this.jdbcTemplate.queryForList("select *from distribuidora where idDistribuidora=" + dist.get(i));
            List<Map<String, Object>> stream2 = aux;
            stream2.forEach((Map<String, Object> m) -> {
                distName.add(m.get("nombre").toString());
            });
            
            aux = this.jdbcTemplate.queryForList("select *from videojuego where idVideojuego=" + video.get(i));
            stream2 = aux;
            stream2.forEach((Map<String, Object> m) -> {
                videoName.add(m.get("titulo").toString());
            });
        }
        
        for(int i = 0; i < stream.size(); i++){
            Map<String, Object> m = stream.get(i);
            m.replace("idDistribuidora", distName.get(i));
            m.replace("idVideojuego", videoName.get(i));
        }
        
        mav.addObject("lista", datos);
        mav.setViewName("listaComprador");
        return mav;
    }
    
    @RequestMapping(value = "editarComprador.htm", method = RequestMethod.GET)
    public ModelAndView vistaEditar(HttpServletRequest request) {
        id = Integer.parseInt(request.getParameter("idComprador")); // la variable que esta entre "" es el nombre de campo de la BD
        String sql = "select *from comprador where idComprador=" + id;
        datos = this.jdbcTemplate.queryForList(sql);
        mav.addObject("lista", datos);
        
        List<Map<String, Object>> stream = datos;
        int idFk = Integer.parseInt(stream.get(0).get("idDistribuidora").toString());
        List stream2 = this.jdbcTemplate.queryForList("select nombre from distribuidora where idDistribuidora=" + idFk);
        mav.addObject("distri", stream2);
        
        idFk = Integer.parseInt(stream.get(0).get("idvideojuego").toString());
        stream2 = this.jdbcTemplate.queryForList("select titulo from videojuego where idvideojuego=" + idFk);
        mav.addObject("video", stream2);
        
        mav.addAllObjects(obtenerTablaFK("distribuidora", "2"));
        mav.addAllObjects(obtenerTablaFK("videojuego", "3"));
        
        mav.setViewName("editarComprador");
        return mav;
    }
    
    @RequestMapping(value = "editarComprador.htm", method = RequestMethod.POST)
    public ModelAndView Editar(Comprador c) {
        String sql = "update comprador set idDistribuidora = ?, idVideojuego = ?, nombre = ?, aPaterno = ?, "
                + "aMaterno = ?, email = ?, direccion = ?, telefono = ?, fechaNacimiento = ?, sexo = ? where idComprador = ?";
        this.jdbcTemplate.update(sql, c.getIdDistribuidora(), c.getIdVideojuego(), c.getNombre(), c.getaPaterno(),
                c.getaMaterno(), c.getEmail(), c.getDireccion(), c.getTelefono(), c.getFechaNacimiento(), c.getSexo(), id);
        return new ModelAndView("redirect:/listaComprador.htm");
    }
    
    String buscar;
    
    /*
    // BUSCAR
    @RequestMapping( value = "listaBuscar.htm")
    public ModelAndView Buscar(HttpServletRequest request) {
        if(!request.getParameter("buscar").isEmpty()){
            buscar = request.getParameter("buscar");
            String sql = "select *from comprador where nombre like " + "'" + "%" + buscar + "%" +"'";
            System.out.println(this.jdbcTemplate.queryForList(sql));
            List result = this.jdbcTemplate.queryForList(sql);
            mav.addObject("resultados", result);
            mav.setViewName("listaBuscar");
            return mav;
        }else {
            mav.setViewName("redirect:/listaComprador.htm");
            return mav;
        }
    }
    */

    @RequestMapping( value = "eliminarComprador.htm")
    public ModelAndView Eliminar(HttpServletRequest request) {
        id = Integer.parseInt(request.getParameter("idComprador")); // la variable que esta entre "" es el nombre de campo de la BD
        String sql = "delete from comprador where idComprador=" + id;
        this.jdbcTemplate.update(sql);
        return new ModelAndView("redirect:/listaComprador.htm");
    }
    
    int idQr;
    
    @RequestMapping(value = "qrVista.htm", method = RequestMethod.GET)
    public ModelAndView vistaQr(HttpServletRequest request) {
        
        idQr = Integer.parseInt(request.getParameter("idComprador")); // la variable que esta entre "" es el nombre de campo de la BD
        String sql = "select *from comprador where idComprador=" + idQr;
        List results = this.jdbcTemplate.queryForList(sql);
        mav.addObject("listaQr", results);
        
        List<Map<String, Object>> stream = results;
        int idFk = Integer.parseInt(stream.get(0).get("idDistribuidora").toString());
        List stream2 = this.jdbcTemplate.queryForList("select nombre from distribuidora where idDistribuidora=" + idFk);
        mav.addObject("distri", stream2);
        
        idFk = Integer.parseInt(stream.get(0).get("idvideojuego").toString());
        stream2 = this.jdbcTemplate.queryForList("select titulo from videojuego where idvideojuego=" + idFk);
        mav.addObject("video", stream2);
        
        mav.setViewName("qrVista");
        return mav;
        
    }
    
    public Map<String, Object> obtenerTablaFK(String nombreTabla, String numeroLista){
        String sql = "select *from " + nombreTabla;
        List results = this.jdbcTemplate.queryForList(sql);
        Map<String, Object> m = new HashMap<>();
        m.put("lista"+numeroLista, results);
        return m;
    }
}
