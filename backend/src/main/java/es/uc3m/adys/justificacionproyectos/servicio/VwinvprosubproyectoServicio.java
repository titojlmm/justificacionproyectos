package es.uc3m.adys.justificacionproyectos.servicio;

import es.uc3m.adys.justificacionproyectos.model.Vwinvprosubproyecto;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "proyectosuxxi", path = "proyectouxxi")
public interface VwinvprosubproyectoServicio extends PagingAndSortingRepository<Vwinvprosubproyecto, Long> {
}
