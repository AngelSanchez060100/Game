package controlador;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import config.conexionBD;
import entidades.Distribuidora;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.stereotype.Controller;

/**
 *
 * @author Brandon
 */
@Controller
public class controladorDistribuidora {
         // Instancia para conexion

    conexionBD con = new conexionBD();
    JdbcTemplate jdbcTemplate = new JdbcTemplate(con.Conectar());
    ModelAndView mav = new ModelAndView();

    @RequestMapping(value = "altaDistribuidora.htm", method = RequestMethod.GET)
    public ModelAndView vistaAgregar() {
        mav.addAllObjects(obtenerTablaFK("videojuego", "2"));
        mav.addObject(new Distribuidora());
        mav.setViewName("altaDistribuidora");
        return mav;
    }

    // Metodo para agregar
    @RequestMapping(value = "altaDistribuidora.htm", method = RequestMethod.POST)
    public ModelAndView Agregar(Distribuidora d) {
        String url = "insert into distribuidora(idVideojuego, nombre, numSedes, formatoDistribuidora, horarioApertura, paginaWeb, pais )values(?,?,?,?,?,?,?)";
        this.jdbcTemplate.update(url, d.getIdVideojuego(), d.getNombre(), d.getNumSedes(), d.getFormatoDistribuidora(), d.getHoraApertura(), d.getPaginaWeb(), d.getPais() );
        return new ModelAndView("redirect:/altaDistribuidora.htm");
    }

    int codigo;
    List datos;

    @RequestMapping("listaDistribuidora.htm")
    public ModelAndView listar() {
        String sql = "select * from distribuidora";
        datos = this.jdbcTemplate.queryForList(sql);
        
        List<Map<String, Object>> stream = datos;
        List<Integer> video = new ArrayList<>();
        List<String> videoName = new ArrayList<>();
        
        stream.forEach((Map<String, Object> m) -> {
            video.add(Integer.parseInt(m.get("idVideojuego").toString()));
        });
        
        for(int i = 0; i < stream.size(); i++){
            
            List aux = this.jdbcTemplate.queryForList("select *from videojuego where idVideojuego=" + video.get(i));
            List<Map<String, Object>> stream2 = aux;
            stream2.forEach((Map<String, Object> m) -> {
                videoName.add(m.get("titulo").toString());
            });
            
        }
        
        for(int i = 0; i < stream.size(); i++){
            Map<String, Object> m = stream.get(i);
            m.replace("idVideojuego", videoName.get(i));
        }
        
        mav.addObject("lista", datos);
        mav.setViewName("listaDistribuidora");
        return mav;
    }

    @RequestMapping(value = "editarDistribuidora.htm", method = RequestMethod.GET)
    public ModelAndView vistaEditar(HttpServletRequest request) {
        // Base de dartos
        codigo = Integer.parseInt(request.getParameter("idDistribuidora"));
        String sql = "select * from distribuidora where idDistribuidora=" + codigo;
        datos = this.jdbcTemplate.queryForList(sql);
        mav.addObject("lista", datos);
        
        List<Map<String, Object>> stream = datos;
        int idFk = Integer.parseInt(stream.get(0).get("idvideojuego").toString());
        List<Map<String, Object>> stream2 = this.jdbcTemplate.queryForList("select titulo from videojuego where idvideojuego=" + idFk);
        mav.addObject("video", stream2);
        
        mav.addAllObjects(obtenerTablaFK("videojuego", "2"));
        
        mav.setViewName("editarDistribuidora");
        return mav;
    }

    @RequestMapping(value = "editarDistribuidora.htm ", method = RequestMethod.POST)
    public ModelAndView Editar(Distribuidora d) {
        String sql = "update distribuidora set idVideojuego=?, nombre=?, numSedes=?, formatoDistribuidora=?, horarioApertura=?, paginaWeb=?, pais=? where idDistribuidora=?";
        this.jdbcTemplate.update(sql, d.getIdVideojuego(), d.getNombre(), d.getNumSedes(), d.getFormatoDistribuidora(), d.getHoraApertura(), d.getPaginaWeb(), d.getPais(), codigo );
        return new ModelAndView("redirect:/listaDistribuidora.htm");
    }

    @RequestMapping(value = "eliminarDistribuidora.htm ")
    public ModelAndView Eliminar(HttpServletRequest request) {
        codigo = Integer.parseInt(request.getParameter("idDistribuidora"));
        String sql = "delete from distribuidora where idDistribuidora=" + codigo;
        this.jdbcTemplate.update(sql);
        return new ModelAndView("redirect:/listaDistribuidora.htm");
    }
    
    int idQr;
    
    @RequestMapping(value = "qrVistaDistribuidora.htm", method = RequestMethod.GET)
    public ModelAndView vistaQr(HttpServletRequest request) {
        
        idQr = Integer.parseInt(request.getParameter("idDistribuidora")); // la variable que esta entre "" es el nombre de campo de la BD
        String sql = "select *from distribuidora where idDistribuidora=" + idQr;
        List results = this.jdbcTemplate.queryForList(sql);
        mav.addObject("listaQr", results);
        
        List<Map<String, Object>> stream = results;
        int idFk = Integer.parseInt(stream.get(0).get("idVideojuego").toString());
        List<Map<String, Object>> stream2 = this.jdbcTemplate.queryForList("select titulo from videojuego where idvideojuego=" + idFk);
        mav.addObject("video", stream2);
        
        mav.setViewName("qrVistaDistribuidora");
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
