package es.uc3m.adys.justificacionproyectos.servicio;

import es.uc3m.adys.justificacionproyectos.model.Tbuc3minvjusttipos;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "tipos", path = "tipo")
public interface Tbuc3minvjusttiposServicio extends PagingAndSortingRepository<Tbuc3minvjusttipos, Long> {
}
