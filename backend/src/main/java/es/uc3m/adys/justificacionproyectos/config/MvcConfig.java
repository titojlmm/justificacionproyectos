package es.uc3m.adys.justificacionproyectos.config;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.core.Ordered;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.datetime.standard.DateTimeFormatterRegistrar;
import org.springframework.validation.Validator;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import java.util.Locale;

@Configuration
public class MvcConfig implements WebMvcConfigurer {

  @Override
  public void addViewControllers( ViewControllerRegistry registry ) {
    registry.addViewController( "/" ).setViewName( "forward:/inicio" );
    registry.setOrder(Ordered.HIGHEST_PRECEDENCE);
  }
    
  @Bean
  public LocaleResolver localeResolver() {
    SessionLocaleResolver slr = new SessionLocaleResolver();
    slr.setDefaultLocale(new Locale("es"));
    return slr;
  }

  @Bean
  public LocaleChangeInterceptor localeChangeInterceptor() {
    LocaleChangeInterceptor lci = new LocaleChangeInterceptor();
    lci.setParamName("lang");
    return lci;
  }

  @Bean
  public FilterRegistrationBean<CharacterEncodingFilter> filtroEncoding() {
    FilterRegistrationBean<CharacterEncodingFilter> registrationBean = new FilterRegistrationBean<>();
    CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
    registrationBean.setFilter(characterEncodingFilter);
    characterEncodingFilter.setEncoding("UTF-8");
    characterEncodingFilter.setForceEncoding(true);
    registrationBean.setOrder(Integer.MIN_VALUE);
    registrationBean.addUrlPatterns("/*");
    return registrationBean;
  }

  @Override
  public void addInterceptors(InterceptorRegistry registry) {
    registry.addInterceptor(localeChangeInterceptor());
  }

  @Bean(name="multipartResolver")
  public StandardServletMultipartResolver multipartResolver(){
    return new StandardServletMultipartResolver();
  }

  @Bean
  public MessageSource messageSource() {
    ReloadableResourceBundleMessageSource bean = new ReloadableResourceBundleMessageSource();
    bean.setBasenames("classpath:i18n/messages","classpath:ValidationMessages");
    bean.setDefaultEncoding("UTF-8");
    return bean;
  }

  @Bean
  public LocalValidatorFactoryBean validator() {
    LocalValidatorFactoryBean bean = new LocalValidatorFactoryBean();
    bean.setValidationMessageSource(messageSource());
    return bean;
  }

  @Override
  public Validator getValidator() {
    return validator();
  }

  /**
   * Configure the converters to use the ISO format for dates by default.
   */
  @Override
  public void addFormatters(FormatterRegistry registry) {
    DateTimeFormatterRegistrar registrar = new DateTimeFormatterRegistrar();
    registrar.setUseIsoFormat(true);
    registrar.registerFormatters(registry);
  }
}
