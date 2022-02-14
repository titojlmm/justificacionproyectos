package es.uc3m.adys.justificacionproyectos.model;

import java.io.Serializable;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="vwinvproconceptocoste", schema = "justificacionproyectos")
@Getter
@Setter
public class Vwinvproconceptocoste implements Serializable {
  @Id
	@Column(name = "NUMIDCONCEPTOCOSTE")
  private Long numidconceptocoste;

  @Column(name = "STRCODIGO")
  private String strcodigo;

  @Column(name = "STRDESCRIPCION1")
  private String strdescripcion1;

  @Column(name = "BLNGASTOEFECTIVO")
  private Boolean blngastoefectivo;

	@Column(name = "NUMIDCONCEPTOCOSTE_N1")
  private Long numidconceptocoste_n1;

	@Column(name = "NUMIDCONCEPTOCOSTE_N2")
  private Long numidconceptocoste_n2;

  @Column(name = "ISCNT")
  private String iscnt;

  @Column(name = "BLNGASTOPERSONALMICCIN")
  private Boolean blngastopersonalmiccin;

  @Column(name = "STRCLASECONCEPTO")
  private String strclaseconcepto;

  @Column(name = "STRCODTIPOPAGA")
  private String strcodtipopaga;
}
