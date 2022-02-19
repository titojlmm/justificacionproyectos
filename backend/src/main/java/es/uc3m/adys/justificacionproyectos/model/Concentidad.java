package es.uc3m.adys.justificacionproyectos.model;

import java.io.Serializable;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="tb_uc3m_inv_just_conc_entidad", schema = "justificacionproyectos")
@Getter
@Setter
public class Concentidad implements Serializable {
  @Id @GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name = "NUMIDCONCEPTOENTIDAD")
  private Long numidconceptoentidad;

  @Column(name = "STRCTPCON")
  private String strctpcon;

  @Column(name = "STRCTPSCO")
  private String strctpsco;

  @OneToOne
  @JoinColumn(name = "NUMIDTIPO")
  private Tipos tipo;

  @Column(name = "STRTIPOGASTOMIN")
  private String strtipogastomin;

  @OneToOne
  @JoinColumn(name = "NUMIDTECNICA")
  private Bloquestecnica bloquetecnica;
}
