package es.uc3m.adys.justificacionproyectos.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tb_uc3m_inv_just_centros", schema = "justificacionproyectos")
@Getter
@Setter
public class Tbuc3minvjustcentros {
  @Id @GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name = "NUMIDCENTRO")
  private Long numidcentro;

  @Column(name = "STRREFEXTPROYECTO")
  private String strrefextproyecto;

  @Column(name = "STRCODIGOCENTRO")
  private String strcodigocentro;
}
