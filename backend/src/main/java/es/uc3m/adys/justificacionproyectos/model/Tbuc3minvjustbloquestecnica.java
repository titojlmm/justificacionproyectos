package es.uc3m.adys.justificacionproyectos.model;

import java.io.Serializable;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tb_uc3m_inv_just_tecnica", schema = "justificacionproyectos")
@Getter
@Setter
public class Tbuc3minvjustbloquestecnica implements Serializable {
  @Id @GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name = "NUMIDTECNICA")
  private Long numidtecnica;

  @Column(name = "STRTECNICA")
  private String strtecnica;

  @Column(name = "STRCODIGO")
  private String strcodigo;
}
