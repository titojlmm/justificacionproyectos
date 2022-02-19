package es.uc3m.adys.justificacionproyectos.servicio;

import es.uc3m.adys.justificacionproyectos.model.Bloquestecnica;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "bloquestecnica", path = "bloquetecnica")
public interface BloquestecnicaServicio extends PagingAndSortingRepository<Bloquestecnica, Long> {
}
