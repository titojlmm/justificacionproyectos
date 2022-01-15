package es.uc3m.adys.justificacionproyectos.filter;

//import es.uc3m.comun.acceso.datos.impl.UsuarioAccesoPersonaRolesImpl;
//import es.uc3m.comun.acceso.util.UsuarioAccesoManager;
import org.slf4j.MDC;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class MdcLogEnhancerFilter extends OncePerRequestFilter {
    private static final String USER_KEY = "USER";
    private static final String IP_KEY = "IP";
    private static final String SESSION_ID_KEY = "SESSION_ID";
    private static final String PATH = "PATH";
    private static final String METHOD = "METHOD";

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        try {
            // Rellenar el MDC
            //Ip Remota
            MDC.put(IP_KEY, (request.getHeader("X-FORWARDED-FOR") == null ? request.getRemoteAddr() : request.getHeader("X-FORWARDED-FOR")));
            //Usuario
//            UsuarioAccesoPersonaRolesImpl usuarioAcceso = (UsuarioAccesoPersonaRolesImpl) UsuarioAccesoManager.getUsuarioAcceso(request);
//            MDC.put(USER_KEY, (usuarioAcceso != null)?usuarioAcceso.getLoginAcceso():"anonymous");
            //SessionId
            MDC.put(SESSION_ID_KEY, request.getSession().getId());
            //Method
            MDC.put(METHOD, request.getMethod());
            //Path
            String path = (request.getQueryString() != null ? request.getRequestURI().concat("?").concat(request.getQueryString()) : request.getRequestURI());
            MDC.put(PATH, path);
            filterChain.doFilter(request, response);
        } finally {
            // ( Importante! Limpiamos el hilo actual )
            MDC.clear();
        }
    }

}
