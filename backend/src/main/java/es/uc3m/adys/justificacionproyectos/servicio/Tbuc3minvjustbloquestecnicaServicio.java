package es.uc3m.adys.justificacionproyectos.servicio;

import es.uc3m.adys.justificacionproyectos.model.Tbuc3minvjustbloquestecnica;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "bloquestecnica", path = "bloquetecnica")
public interface Tbuc3minvjustbloquestecnicaServicio extends PagingAndSortingRepository<Tbuc3minvjustbloquestecnica, Long> {
}
