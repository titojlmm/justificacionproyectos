package es.uc3m.adys.justificacionproyectos.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;

@Configuration
//@ImportResource("classpath*:personas-ws-context.xml")
public class UC3MConfig {
/*
  //Inicializando servicio GestorPersonas
  @Bean
  public GestorPersonas getGestorPersonas() {
    return GestoresDatosUc3mLocator.getGestorPersonas();
  }

  //Filtros necesarios para ADAS Password y SSO
  @Bean
  public FilterRegistrationBean<AccesoUc3mSsoFilter> getFiltroSSO() {
    FilterRegistrationBean<AccesoUc3mSsoFilter> frb = new FilterRegistrationBean<>(new AccesoUc3mSsoFilter());
    frb.setName("Filtro SSO ADAS");
    frb.setUrlPatterns(Arrays.asList("/sso/*"));
    frb.setOrder(2);
    return frb;
  }

  @Bean
  public FilterRegistrationBean<ProtegerPorAccesoUc3mSsoFilter> getFiltroProteccionURL() {
    FilterRegistrationBean<ProtegerPorAccesoUc3mSsoFilter> frb = new FilterRegistrationBean<>(new ProtegerPorAccesoUc3mSsoFilter());
    frb.setName("Filtro protección URL - SSO ADAS");
    frb.setUrlPatterns(Arrays.asList("/*"));
    frb.setOrder(3);
    return frb;
  }
*/
}
