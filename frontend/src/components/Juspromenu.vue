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
            {label:'Listado de agrupaciones', icon:PrimeIcons.LIST},
            {label:'Nueva agrupación', icon:PrimeIcons.PLAY}
        ]},
        {label:'Informes', icon:PrimeIcons.PRINT, items:[
            {label:'Contratos con importe superior al límite'},
            {label:'Facturas con importe superior al límite'},
            {separator:true},
            {label:'Gastos justificación plan nacional'},
            {label:'Justificación técnica'}
        ]},
        {label:'Mantenimiento', icon:PrimeIcons.PENCIL, items:[
            {label:'Centros de coordinación', icon:PrimeIcons.CHEVRON_CIRCLE_RIGHT, to: { name: 'centros'}},
            {label:'Tipos de proyecto', icon:PrimeIcons.CHEVRON_CIRCLE_RIGHT, to: { name: 'tiposproyecto'}},
            {label:'Conceptos de la entidad', icon:PrimeIcons.CHEVRON_CIRCLE_RIGHT, to: { name: 'concentidad'}},
            {label:'Asociación concepto coste - particular'},
            {separator:true},
            {label:'Bloques justificación técnica', icon:PrimeIcons.CHEVRON_CIRCLE_RIGHT, to: { name: 'bloquestecnica'}},
            {label:'Relación conceptos particulares - bloque técnica'},
            {separator:true},
            {label:'Estados de las agrupaciones', icon:PrimeIcons.CHEVRON_CIRCLE_RIGHT, to: { name: 'estadosagr'}},
            {separator:true},
            {label:'Conceptos de coste (UXXI-INV)', icon:PrimeIcons.CHEVRON_CIRCLE_RIGHT, to: { name: 'conceptoscoste'}},
            {label:'Proyectos (UXXI-INV)', icon:PrimeIcons.CHEVRON_CIRCLE_RIGHT, to: { name: 'proyectosuxxi'}},
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
