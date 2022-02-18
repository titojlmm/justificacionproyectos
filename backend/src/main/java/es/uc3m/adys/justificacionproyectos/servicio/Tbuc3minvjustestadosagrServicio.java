package es.uc3m.adys.justificacionproyectos.servicio;

import es.uc3m.adys.justificacionproyectos.model.Tbuc3minvjustestadosagr;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "estadosagr", path = "estadoagr")
public interface Tbuc3minvjustestadosagrServicio extends PagingAndSortingRepository<Tbuc3minvjustestadosagr, Long> {
}
