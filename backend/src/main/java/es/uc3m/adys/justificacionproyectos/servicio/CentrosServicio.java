package es.uc3m.adys.justificacionproyectos.servicio;

import es.uc3m.adys.justificacionproyectos.model.Centros;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "centros", path = "centro")
public interface CentrosServicio extends PagingAndSortingRepository<Centros, Long> {
}
