package es.uc3m.adys.justificacionproyectos.model;

import java.io.Serializable;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tb_uc3m_inv_just_estados_agr", schema = "justificacionproyectos")
@Getter
@Setter
public class Estadosagr implements Serializable {
  @Id
	@Column(name = "NUMIDESTADO")
  private Long numidestado;

  @Column(name = "STRCODIGO")
  private String strcodigo;

  @Column(name = "STRDESCRIPCION")
  private String strdescripcion;
}
