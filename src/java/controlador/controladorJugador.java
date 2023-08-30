/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;


import config.conexionBD;
import entidades.Jugador;
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

public class controladorJugador {
    conexionBD con = new conexionBD();
    JdbcTemplate jdbcTemplate = new JdbcTemplate(con.Conectar());
    ModelAndView mav = new ModelAndView();
    
    //Metodo para la vista
    @RequestMapping(value = "altaJugador.htm", method = RequestMethod.GET)
    public ModelAndView VistaAgregar(){
        mav.addAllObjects(obtenerTablaFK("videojuego", "2"));
        mav.addObject(new Jugador());
        mav.setViewName("altaJugador");
        return mav;
    }
    @RequestMapping(value = "altaJugador.htm", method = RequestMethod.POST)
    public ModelAndView Agregar(Jugador j){
        String sql = "insert into jugador(idVideojuego,alias,pais,clan,nivel,victorias,horasJugadas,telefono,fechaNacimiento,sexo) values(?,?,?,?,?,?,?,?,?,?)";
        this.jdbcTemplate.update(sql, j.getIdVideojuego(), j.getAlias(), j.getPais(), j.getClan(), j.getNivel(), j.getVictorias(), 
                                      j.getHorasJugadas(), j.getTelefono(), j.getFechaNacimiento(), j.getSexo());
        return new ModelAndView("redirect:/altaJugador.htm");
    }
    
    int codigo;
    List datos;
    List datosVideojuego;
    @RequestMapping("listaJugador.htm")
    public ModelAndView Listar(){
        String sql = "select * from jugador";
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
        
        mav.addObject("lista",datos);
        mav.setViewName("listaJugador");
        return mav;
    }
    
    @RequestMapping(value = "editarJugador.htm", method = RequestMethod.GET)
    public ModelAndView vistaEditar(HttpServletRequest request){
        codigo = Integer.parseInt(request.getParameter("idJugador")); //El codigo entre comillas es el de la BD (PK) y el otro es una variable
        String sql = "select * from jugador where idJugador = " + codigo;
        datos = this.jdbcTemplate.queryForList(sql);
        mav.addObject("lista",datos);
        
        List<Map<String, Object>> stream = datos;
        int idFk = Integer.parseInt(stream.get(0).get("idvideojuego").toString());
        List<Map<String, Object>> stream2 = this.jdbcTemplate.queryForList("select titulo from videojuego where idvideojuego=" + idFk);
        mav.addObject("video", stream2);
        
        mav.addAllObjects(obtenerTablaFK("videojuego", "2"));
        
        mav.setViewName("editarJugador");
        return mav;
    }
    
    @RequestMapping(value = "editarJugador.htm", method = RequestMethod.POST)
    public ModelAndView Editar(Jugador j){
        String sql = "update jugador set idVideojuego =?,alias=?,pais=?,clan=?,nivel=?,victorias=?,horasJugadas=?,telefono=?,fechaNacimiento=?,sexo=?  where idJugador = ?";
        this.jdbcTemplate.update(sql, j.getIdVideojuego(), j.getAlias(), j.getPais(), j.getClan(), j.getNivel(), j.getVictorias(), 
                                      j.getHorasJugadas(), j.getTelefono(), j.getFechaNacimiento(), j.getSexo(), codigo);
        return new ModelAndView("redirect:/listaJugador.htm");
    }
    
    
    @RequestMapping(value = "eliminarJugador.htm")
     public ModelAndView Eliminar(HttpServletRequest request){
        codigo = Integer.parseInt(request.getParameter("idJugador")); 
        String sql = "delete from jugador where idJugador = " + codigo;
        this.jdbcTemplate.update(sql);
        return new ModelAndView("redirect:/listaJugador.htm");
    }
     
    int idQr;
    
    @RequestMapping(value = "qrVistaJugador.htm", method = RequestMethod.GET)
    public ModelAndView vistaQr(HttpServletRequest request) {
        
        idQr = Integer.parseInt(request.getParameter("idJugador")); // la variable que esta entre "" es el nombre de campo de la BD
        String sql = "select *from jugador where idJugador=" + idQr;
        List results = this.jdbcTemplate.queryForList(sql);
        mav.addObject("listaQr", results);
        
        List<Map<String, Object>> stream = results;
        int idFk = Integer.parseInt(stream.get(0).get("idVideojuego").toString());
        List<Map<String, Object>> stream2 = this.jdbcTemplate.queryForList("select titulo from videojuego where idvideojuego=" + idFk);
        mav.addObject("video", stream2);
        
        mav.setViewName("qrVistaJugador");
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
