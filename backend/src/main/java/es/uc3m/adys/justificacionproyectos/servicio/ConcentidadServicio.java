package es.uc3m.adys.justificacionproyectos.servicio;

import es.uc3m.adys.justificacionproyectos.model.Concentidad;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "concentidad", path = "concentidad")
public interface ConcentidadServicio extends PagingAndSortingRepository<Concentidad, Long> {
}
