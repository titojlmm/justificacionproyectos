package es.uc3m.adys.justificacionproyectos.servicio;

import es.uc3m.adys.justificacionproyectos.model.Tbuc3minvjustcentros;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "centros", path = "centro")
public interface Tbuc3minvjustcentrosServicio extends PagingAndSortingRepository<Tbuc3minvjustcentros, Long> {
}
