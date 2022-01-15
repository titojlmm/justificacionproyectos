<template>
  <div><h3>Pantalla para la edición de tipos de proyecto de la justificación</h3></div>
</template>

<script>
  export default {
    name: "tiposproyectorecord",
    setup() {
      const initRegistro = (registro) => {
        // Código html para pintar la página de edición
        registro.strcodigo + ' - ' + registro.strdescripcion + ' - ' + registro.blnvigente;
      }
      return {
        initRegistro
      }
    }
  }
</script>
