package es.uc3m.adys.justificacionproyectos.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/messages")
public class MessageController {

  // TO-DO: eliminar esta clase de ejemplo y utilizar directamente una página vue
  @GetMapping("/home")
  public String hello() {
    return "Bienvenido a la aplicación de gestión de justificaciones";
  }

}
