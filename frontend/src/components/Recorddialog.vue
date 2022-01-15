<template>
  <div>
    <Toast/>
    <Dialog v-model:visible="visibleDialog" :style="{width: '450px'}" :modal="true" :maximizable="true">
        <template #header>
          <h5>{{ titulo }}</h5>
        </template>
        <div v-if="modo ==='CREATE' || modo === 'UPDATE'" class="confirmation-content">
            <i class="pi pi-exclamation-triangle mr-3" style="font-size: 2rem" />
            <span>Detalle del registro a crear/actualizar</span>
        </div>
        <div v-else-if="modo ==='DELETE'" class="confirmation-content">
            <i class="pi pi-exclamation-triangle mr-3" style="font-size: 2rem" />
            <span v-if="registro">¿Está seguro de que quiere eliminar el registro '<b>{{ registro.strdescripcion }}</b>'?</span>
        </div>
        <template #footer>
            <Button label="Cancelar" icon="pi pi-times" class="p-button-text" @click="hideDialog"/>
            <Button v-if="modo ==='CREATE' || modo === 'UPDATE'" label="Guardar" icon="pi pi-check" class="p-button-text" @click="saveRegistro" />
            <Button v-else-if="modo ==='DELETE'" label="Eliminar" icon="pi pi-check" class="p-button-text" @click="deleteRegistro" />
        </template>
    </Dialog>

<!--      <Tiposproyectorecord ref="tiposproyectorecord" /> -->
</div>
</template>

<script>
  import { ref } from 'vue';
  import { useToast } from 'primevue/usetoast';

  import { getIdFromURI } from '../plugins/util';

//  import Tiposproyectorecord from "@/components/Tiposproyectorecord";
  export default {
    name: "recorddialog",
    setup(props, { emit }) {
      const modo = ref();
      const titulo = ref();
//var htmlcode = "";
      const toast = useToast();
      const registro = ref({});
      const visibleDialog = ref(false);
      const submitted = ref(false);

      // Función a ejecutar en el padre ya que depende de los datos de la tabla
      const recargardatos = ref(true);
      // Se injecta el tipo concreto desde el componente padre
      const crudservicio = ref({});
//      const record = ref (Tiposproyectorecord);

      const operacion = (reg) => {
        switch (modo.value) {
          case "CREATE" :
            openNew();
            break;
          case "UPDATE" :
            editRegistro(reg);
            break;
          case "DELETE" :
            confirmDeleteRegistro(reg);
            break;
          default :
            alert('Opción inválida: '+modo.value);
        }
      };

      const openNew = () => {
        registro.value = {};
        submitted.value = false;
//tiposproyectorecord.value.hola();
//        htmlcode = tiposproyectorecord.value.initRegistro(registro);
//alert(htmlcode);
        visibleDialog.value = true;
      };

      const editRegistro = (reg) => {
        // TO-DO: Escribir
        registro.value = {...reg};
//        tiposproyectorecord.value.initRegistro(reg);
//        htmlcode = tiposproyectorecord.value.initRegistro(reg);
//alert(tiposproyectorecord.value.initRegistro(reg));
//alert(htmlcode);
        visibleDialog.value = true;
      };
      const confirmDeleteRegistro = (reg) => {
        registro.value = reg;
        visibleDialog.value = true;
      };

      const hideDialog = () => {
        visibleDialog.value = false;
        submitted.value = false;
      };

      const saveRegistro = () => {
/*
        submitted.value = true;
        if (registro.value.strdescripcion.trim()) {
//          registro.value.blnvigente = togglevigente.value;
          if (registro.value._links && registro.value._links.self.href) {
            crudservicio.value.update(getIdFromURI(registro.value._links.self.href), registro.value);
            toast.add({severity:'success', summary: 'Éxito', detail: 'Registro actualizado', life: 3000});
          } else {
            if (registro.value.strcodigo) {
              registro.value.numidtipo = registro.value.strcodigo;
              crudservicio.value.create(registro.value);
              toast.add({severity:'success', summary: 'Éxito', detail: 'Registro creado', life: 3000});
            } else {
              toast.add({severity:'error', summary: 'Error', detail: 'No se ha podido crear el registro', life: 3000});
            }
          }
          registroDialog.value = false;
          registro.value = {};
          emit('recargardatos', true);
        }
*/
      };

      const deleteRegistro = () => {
        crudservicio.value.delete(getIdFromURI(registro.value._links.self.href));
        visibleDialog.value = false;
        registro.value = {};
        toast.add({severity:'success', summary: 'Éxito', detail: 'Registro eliminado', life: 3000, });
        emit('recargardatos', true);
      };

      return {
        crudservicio, registro, visibleDialog, confirmDeleteRegistro, deleteRegistro, recargardatos, titulo, operacion,
        openNew, editRegistro, submitted, modo, hideDialog, saveRegistro
//        , record, tiposproyectorecord
      }
    },
/*
    components: {
      Tiposproyectorecord
    }
*/
  }
</script>

<style lang="scss" scoped>
  .confirmation-content {
      display: flex;
      align-items: center;
      justify-content: center;
  }
</style>
