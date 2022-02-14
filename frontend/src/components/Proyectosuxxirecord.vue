<template>
  <div>
    <Toast/>
    <Dialog v-model:visible="visibleDialog" :style="{width: '450px'}" :modal="true" :maximizable="true">
        <template #header>
          <h5>{{ titulo }}</h5>
        </template>

        <div>
          <h5>Código del proyecto</h5>
          <InputText type="text" v-model="registro.strcodigosubproyecto" disabled />

          <h5>Título del proyecto</h5>
          <InputText type="text" v-model="registro.strtitulo" disabled />

          <h5>Referencia externa del proyecto</h5>
          <InputText type="text" v-model="registro.strreferenciaexterna" disabled />
        </div>

        <template #footer>
            <Button label="Aceptar" icon="pi pi-check" class="p-button-text" @click="hideDialog" />
        </template>
    </Dialog>
  </div>
</template>

<script>
  import { ref } from 'vue';

  export default {
    name: "proyectosuxxirecord",
    setup() {

      const registro = ref({});
      const operacion = ref();
      const titulo = ref();

      const visibleDialog = ref(false);

      const titulos = {
        detalle : 'Detalle del registro',
      };

      const openRegistro = (reg, modo) => {
        registro.value=reg;
        operacion.value=modo;
        switch (modo) {
          case "DETAIL" :
            titulo.value = titulos.detalle;
            editRegistro(reg);
            break;
          default :
            alert('Opción inválida');
            return;
        }
      }

      const editRegistro = (reg) => {
        registro.value = {...reg};
        visibleDialog.value = true;
      };

      const hideDialog = () => {
        visibleDialog.value = false;
      };

      return {
        registro, operacion, titulo, visibleDialog, titulos,
        openRegistro, editRegistro, hideDialog
      }
    }
  }
</script>
