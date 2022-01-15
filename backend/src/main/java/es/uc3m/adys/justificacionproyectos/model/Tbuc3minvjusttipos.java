package es.uc3m.adys.justificacionproyectos.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tb_uc3m_inv_just_tipos", schema = "justificacionproyectos")
@Getter
@Setter
public class Tbuc3minvjusttipos {
  @Id
	@Column(name = "NUMIDTIPO")
  private Long numidtipo;

  @Column(name = "STRCODIGO")
  private String strcodigo;

  @Column(name = "STRDESCRIPCION")
  private String strdescripcion;

  @Column(name = "BLNVIGENTE")
  private Boolean blnvigente;
}