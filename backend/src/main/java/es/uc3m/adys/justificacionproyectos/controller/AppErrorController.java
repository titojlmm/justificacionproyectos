package es.uc3m.adys.justificacionproyectos.controller;

import es.uc3m.adys.justificacionproyectos.util.JustificacionproyectosException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

/**
 * Global Controller which is called for unhandled errors
 */
@ControllerAdvice
@Controller
@Slf4j
public class AppErrorController {

  /**
   * Manejando los errores controlados que lanza la aplicación
   */
  @ExceptionHandler({ JustificacionproyectosException.class })
  public ModelAndView errorAtenea(RuntimeException ex, WebRequest request) {
    ModelAndView model = new ModelAndView("error/errorTest");
    model.addObject("excepcion", ex);
    return model;
  }

  /**
   * Capturando los errores no controlados: JPA, Nullpointer, etc
   */
  @ExceptionHandler({ Exception.class })
  public ModelAndView errorDefault(RuntimeException ex, WebRequest request) {
    ModelAndView model = new ModelAndView("error/error");
    log.error("Traza de la excepción producida", ex);
    return model;
  }

  /**
   * Acceso a la pantalla de errores.
   * @return Página de error
   */
  @RequestMapping(path = "/error/{id}")
  protected String mostrarError(@PathVariable("id") String iderror) {
    return "error/"+iderror;
  }

}
