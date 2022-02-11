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
import {PrimeIcons} from 'primevue/api';

export default {
  setup() {
    const items = ref([
        {label:'Inicio', icon:PrimeIcons.HOME, to: { name: 'home'}},
        {label:'Ficheros de justificaciones', icon:PrimeIcons.FILE_EXCEL, items:[
            {label:'Listado de lanzamientos', icon:PrimeIcons.LIST},
            {label:'Nuevo lanzamiento', icon:PrimeIcons.PLAY}
        ]},
        {label:'Informes', icon:PrimeIcons.PRINT, items:[
            {label:'Contratos con importe superior al límite', icon:PrimeIcons.CHEVRON_CIRCLE_RIGHT},
            {label:'Facturas con importe superior al límite', icon:PrimeIcons.CHEVRON_CIRCLE_RIGHT},
            {separator:true},
            {label:'Gastos justificación plan nacional', icon:PrimeIcons.CHEVRON_CIRCLE_RIGHT},
            {label:'Justificación técnica', icon:PrimeIcons.CHEVRON_CIRCLE_RIGHT}
        ]},
        {label:'Mantenimiento', icon:PrimeIcons.PENCIL, items:[
            {label:'Centros de coordinación', icon:PrimeIcons.CHEVRON_CIRCLE_RIGHT, to: { name: 'centros'}},
            {label:'Tipos de proyecto', icon:PrimeIcons.CHEVRON_CIRCLE_RIGHT, to: { name: 'tiposproyecto'}},
            {label:'Conceptos particulares', icon:PrimeIcons.CHEVRON_CIRCLE_RIGHT},
            {label:'Asociación concepto coste - particular', icon:PrimeIcons.CHEVRON_CIRCLE_RIGHT},
            {separator:true},
            {label:'Bloques justificación técnica', icon:PrimeIcons.CHEVRON_CIRCLE_RIGHT},
            {label:'Relación conceptos particulares - bloque técnica', icon:PrimeIcons.CHEVRON_CIRCLE_RIGHT},
            {separator:true},
            {label:'Usuarios', icon:PrimeIcons.USER, items:[
                {label:'Nuevo', icon:PrimeIcons.USER_PLUS},
                {label:'Eliminar', icon:PrimeIcons.USER_MINUS},
                {label:'Roles', icon:PrimeIcons.KEY}
            ]}
        ]},
        {label:'Salir', icon:PrimeIcons.SIGN_OUT}
    ]);

    return { items }
  }
}
</script>
