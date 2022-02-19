package es.uc3m.adys.justificacionproyectos.servicio;

import es.uc3m.adys.justificacionproyectos.model.Tipos;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "tipos", path = "tipo")
public interface TiposServicio extends PagingAndSortingRepository<Tipos, Long> {
}
