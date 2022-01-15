package es.uc3m.adys.justificacionproyectos.util;

public class JustificacionproyectosException extends RuntimeException {
  // Indica si el mensaje es un texto literal (true, por defecto) o una clave de fichero de recursos (false)
  private Boolean blnLiteral;
  private String cabecera;

  public JustificacionproyectosException() {
    super();
    this.blnLiteral = Boolean.TRUE;
  }

  public JustificacionproyectosException(Boolean blnLiteral) {
    super();
    this.blnLiteral = blnLiteral;
  }

  public JustificacionproyectosException(Exception ex) {
    super(ex);
    this.blnLiteral = Boolean.TRUE;
  }

  public JustificacionproyectosException(Exception ex, Boolean blnLiteral) {
    super(ex);
    this.blnLiteral = blnLiteral;
  }

  public JustificacionproyectosException(String message, String cabecera) {
    super(message);
    this.blnLiteral = Boolean.TRUE;
    this.cabecera = cabecera;
  }

  public JustificacionproyectosException(String message, Boolean blnLiteral) {
    super(message);
    this.blnLiteral = blnLiteral;
  }

  public JustificacionproyectosException(String message, Throwable cause) {
    super(message, cause);
    this.blnLiteral = Boolean.TRUE;
  }

  public JustificacionproyectosException(String message, Boolean blnLiteral, Throwable cause) {
    super(message, cause);
    this.blnLiteral = blnLiteral;
  }

  public Boolean getBlnLiteral() {
    return blnLiteral;
  }

  public String getCabecera(){
    return cabecera;
  }
}
