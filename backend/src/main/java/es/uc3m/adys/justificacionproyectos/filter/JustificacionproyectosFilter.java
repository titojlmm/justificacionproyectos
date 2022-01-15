package es.uc3m.adys.justificacionproyectos.filter;

//import es.uc3m.comun.acceso.datos.impl.UsuarioAccesoPersonaRolesImpl;
//import es.uc3m.comun.acceso.util.UsuarioAccesoManager;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.core.Ordered;
import org.springframework.stereotype.Component;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collections;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Component
public class JustificacionproyectosFilter extends OncePerRequestFilter {
  private static final String ROL_VALIDADOR = "VALIDADOR";

  private static final Set<String> PATH_PROTEGIDOS =
      Stream.of(
          "/justificacionproyectos/pantallavalidacion",
          "/justificacionproyectos/procesarfichero",
          "/justificacionproyectos/validarpublicaciones",
          "/justificacionproyectos/mostrarresultados"
      ).collect(Collectors.toSet());

  @Override
  protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
/*
    UsuarioAccesoPersonaRolesImpl usuarioAcceso = (UsuarioAccesoPersonaRolesImpl) UsuarioAccesoManager.getUsuarioAcceso(request.getSession());

    //Si es null, la aplicación va a redirigir a adAs para la validacion, no comprobamos nada
    if (usuarioAcceso != null && PATH_PROTEGIDOS.contains (request.getRequestURI())) {
      // El usuario tiene que tener el rol VALIDADOR
      boolean autorizado =
          !usuarioAcceso.getRoles().isEmpty()
              && usuarioAcceso.getRoles().stream().filter(s -> s.getCodigo().equals(ROL_VALIDADOR)).count()==1;

      //Si no está autorizado, redirigimos
      if (!autorizado) {
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/error/403");
        dispatcher.forward(request, response);
        return;
      }
    }
*/
    filterChain.doFilter(request, response);
  }
/*
  // Fix the CORS errors
  @Bean
  public FilterRegistrationBean simpleCorsFilter() {
    UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
    CorsConfiguration config = new CorsConfiguration();
    config.setAllowCredentials(true);
    // *** URL below needs to match the Vue client URL and port ***
    config.setAllowedOrigins(Collections.singletonList("http://localhost:3000"));
    config.setAllowedMethods(Collections.singletonList("*"));
    config.setAllowedHeaders(Collections.singletonList("*"));
    source.registerCorsConfiguration("/**", config);
    FilterRegistrationBean bean = new FilterRegistrationBean<>(new CorsFilter(source));
    bean.setOrder(Ordered.HIGHEST_PRECEDENCE);
    return bean;
  }
*/
}

