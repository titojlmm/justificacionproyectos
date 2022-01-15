package es.uc3m.adys.justificacionproyectos.controller;

import es.uc3m.adys.justificacionproyectos.model.Tbuc3minvjusttipos;
import es.uc3m.adys.justificacionproyectos.servicio.Tbuc3minvjusttiposServicio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/justtipos")
public class JusttiposController {
  @Autowired
  private Tbuc3minvjusttiposServicio justtiposSvc;

  @GetMapping("/list")
  public Iterable<Tbuc3minvjusttipos> list() {
    return justtiposSvc.findAll();
  }

  @GetMapping("/get")
  public Tbuc3minvjusttipos get(Long id) {
    return justtiposSvc.findById(id).orElse(new Tbuc3minvjusttipos());
  }

  @GetMapping("/save")
  public Tbuc3minvjusttipos insert(Long numtipo, String strnombretipo) {
    Tbuc3minvjusttipos tipo = new Tbuc3minvjusttipos();
    tipo.setNumidtipo(numtipo);
    tipo.setStrcodigo(""+numtipo);
    tipo.setStrdescripcion(strnombretipo);
    return justtiposSvc.save(tipo);
  }

}
