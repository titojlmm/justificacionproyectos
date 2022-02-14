package es.uc3m.adys.justificacionproyectos.servicio;

import es.uc3m.adys.justificacionproyectos.model.Vwinvproconceptocoste;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "conceptoscoste", path = "conceptocoste")
public interface VwinvproconceptocosteServicio extends PagingAndSortingRepository<Vwinvproconceptocoste, Long> {
}
