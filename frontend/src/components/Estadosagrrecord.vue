<template>
  <div>
    <Toast/>
    <Dialog v-model:visible="visibleDialog" :style="{width: '450px'}" :modal="true" :maximizable="true">
        <template #header>
          <h5>{{ titulo }}</h5>
        </template>

        <div>
          <h5>Código</h5>
          <InputText type="text" v-model="registro.strcodigo" disabled />

          <h5>Descripción</h5>
          <InputText type="text" v-model="registro.strdescripcion" disabled />
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
    name: "estadosagrrecord",
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
