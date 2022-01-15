<template>
  <div>
    <Menubar :model="items">
      <template #start>
        <img alt="logo" src="logouc3m.ico" height="40" class="p-mr-2">
      </template>
    </Menubar>
  </div>
</template>

<script>
import { ref } from 'vue';

export default {
  setup() {
    const items = ref([
        {label:'Inicio', icon:'pi pi-fw pi-home', to: { name: 'home'}},
        {label:'Ficheros de justificaciones', icon:'pi pi-fw pi-file-excel', items:[
            {label:'Listado de lanzamientos', icon:'pi pi-fw pi-list'},
            {label:'Nuevo lanzamiento', icon:'pi pi-fw pi-play'}
        ]},
        {label:'Mantenimiento', icon:'pi pi-fw pi-pencil', items:[
            {label:'Tipos de proyecto', icon:'pi pi-fw pi-circle-off', to: { name: 'tiposproyecto'}},
            {label:'Conceptos particulares', icon:'pi pi-fw pi-circle-off'},
            {label:'Asociación concepto coste - particular', icon:'pi pi-fw pi-circle-off'},
            {separator:true},
            {label:'Usuarios', icon:'pi pi-fw pi-user', items:[
                {label:'Nuevo', icon:'pi pi-fw pi-user-plus'},
                {label:'Eliminar', icon:'pi pi-fw pi-user-minus'},
                {label:'Roles', icon:'pi pi-fw pi-key'}
            ]},
        ]},
        {label:'Salir', icon:'pi pi-fw pi-power-off'}
    ]);

    return { items }
  }
}
</script>
