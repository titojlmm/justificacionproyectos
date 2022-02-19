package es.uc3m.adys.justificacionproyectos.servicio;

import es.uc3m.adys.justificacionproyectos.model.Estadosagr;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "estadosagr", path = "estadoagr")
public interface EstadosagrServicio extends PagingAndSortingRepository<Estadosagr, Long> {
}
