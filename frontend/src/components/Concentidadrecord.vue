<template>
  <div>
    <Toast/>
    <Dialog v-model:visible="visibleDialog" :style="{width: '450px'}" :modal="true" :maximizable="true">
        <template #header>
          <h5>{{ titulo }}</h5>
        </template>

        <div>
          <h5>Código del tipo principal de la entidad financiadora (CTPCON)</h5>
          <InputText type="number" v-model="registro.strctpcon" :disabled="disabled" />

          <h5>Código del tipo secundario de la entidad financiadora (CTPSCO)</h5>
          <InputText type="number" v-model="registro.strctpsco" :disabled="disabled" />

          <h5>Tipo de gasto (concepto) de la entidad financiadora</h5>
          <InputText type="text" v-model="registro.strtipogastomin" :disabled="disabled" />
        </div>

        <template #footer>
            <Button label="Cancelar" icon="pi pi-times" class="p-button-text" @click="hideDialog"/>
            <Button v-if="operacion ==='CREATE' || operacion === 'UPDATE'" label="Guardar" icon="pi pi-check" class="p-button-text" @click="saveRegistro" />
            <Button v-else-if="operacion ==='DELETE'" label="Eliminar" icon="pi pi-check" class="p-button-text" @click="deleteRegistro" />
        </template>
    </Dialog>
  </div>
</template>

<script>
  import { ref } from 'vue';

  import { useToast } from 'primevue/usetoast';

  import { getIdFromURI } from '../plugins/util';

  import ConcentidadService from '../service/ConcentidadService';

  export default {
    name: "concentidadrecord",
    setup(props, { emit }) {
      // Servicio para las operaciones CRUD de la tabla
      const crudservicio = new ConcentidadService();

      const registro = ref({});
      const operacion = ref();
      const titulo = ref();
      const toast = useToast();

      const visibleDialog = ref(false);
      const disabled = ref(false);
      const submitted = ref(false);

      // Función a ejecutar en el padre ya que depende de los datos de la tabla
      const recargardatos = ref(true);

      const titulos = {
        creacion : 'Creación de nuevo registro',
        actualizacion : 'Actualización del registro',
        eliminacion : 'Confirmación de eliminación de registro'
      };

      const openRegistro = (reg, modo) => {
        registro.value=reg;
        operacion.value=modo;
        switch (modo) {
          case "CREATE" :
            titulo.value = titulos.creacion;
            openNew();
            break;
          case "UPDATE" :
            titulo.value = titulos.actualizacion;
            editRegistro(reg);
            break;
          case "DELETE" :
            titulo.value = titulos.eliminacion;
            confirmDeleteRegistro(reg);
            break;
          default :
            alert('Opción inválida');
            return;
        }
      }

      const openNew = () => {
        registro.value = {};
        submitted.value = false;
        visibleDialog.value = true;
      };

      const editRegistro = (reg) => {
        registro.value = {...reg};
        visibleDialog.value = true;
      };
      const confirmDeleteRegistro = (reg) => {
        registro.value = reg;
        disabled.value = true;
        visibleDialog.value = true;
      };

      const hideDialog = () => {
        visibleDialog.value = false;
        submitted.value = false;
      };

      const saveRegistro = () => {
        submitted.value = true;

        if (operacion.value === 'CREATE') {
          crudservicio.create(registro.value);
          toast.add({severity:'success', summary: 'Éxito', detail: 'Registro creado', life: 3000});
        } else if (operacion.value === 'UPDATE') {
          crudservicio.update(getIdFromURI(registro.value._links.self.href), registro.value);
          toast.add({severity:'success', summary: 'Éxito', detail: 'Registro actualizado', life: 3000});
        }
        visibleDialog.value = false;
        registro.value = {};
        emit('recargardatos', true);
      };

      const deleteRegistro = () => {
        crudservicio.delete(getIdFromURI(registro.value._links.self.href));
        visibleDialog.value = false;
        registro.value = {};
        toast.add({severity:'success', summary: 'Éxito', detail: 'Registro eliminado', life: 3000, });
        emit('recargardatos', true);
      };

      return {
        registro, operacion, titulo, visibleDialog, disabled, submitted, recargardatos, titulos,
        openRegistro, openNew, editRegistro, confirmDeleteRegistro, hideDialog, saveRegistro, deleteRegistro
      }
    }
  }
</script>
