package es.uc3m.adys.justificacionproyectos.model;

import java.io.Serializable;
import java.time.LocalDate;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="Vwinvprosubproyecto", schema = "justificacionproyectos")
@Getter
@Setter
public class Vwinvprosubproyecto implements Serializable {
  @EmbeddedId
  protected VwinvprosubproyectoPK vwinvprosubproyectoPK;

  @Column(name = "STRCODIGOSUBPROYECTO")
  private String strcodigosubproyecto;

  @Column(name = "STRTITULO")
  private String strtitulo;

  @Column(name = "STRREFERENCIAEXTERNA")
  private String strreferenciaexterna;

  @Column(name = "STRREFERENCIAINTERNA")
  private String strreferenciainterna;

  @Column(name = "STRDESTIPOSBP")
  private String strdestiposbp;

  @Column(name = "STRDESSUBTIPOSBP")
  private String strdessubtiposbp;

  @Column(name = "DATFECHAINICIO")
  private LocalDate datfechainicio;

  @Column(name = "DATFECHAFINREAL")
  private LocalDate datfechafinreal;

  @Column(name = "DATRESOLUCIONCONVOCATORIA")
  private LocalDate datresolucionconvocatoria;

  @Column(name = "DATFIRMA")
  private LocalDate datfirma;

  @Column(name = "STRNOMBREENTFIN")
  private String strnombreentfin;

  @Column(name = "STRDESCV1")
  private String strdescv1;
}
