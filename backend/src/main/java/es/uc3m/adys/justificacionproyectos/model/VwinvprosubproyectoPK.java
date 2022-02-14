package es.uc3m.adys.justificacionproyectos.model;

import java.io.Serializable;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
@Getter
@Setter
public class VwinvprosubproyectoPK implements Serializable {
	@Column(name = "NUMIDPROYECTO")
  private Long numidproyecto;

	@Column(name = "NUMIDSUBPROYECTO")
  private Long numidsubproyecto;
}
