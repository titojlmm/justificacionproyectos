<template>
  <div>
    <div class="card">
      <DataTable
          :value="listEstadosagr" ref="estadoagr" dataKey="_links.self.href" showGridlines stripedRows :rowHover="true"
          :resizableColumns="true" columnResizeMode="fit"
          :lazy="true" :totalRecords="totalRecords" :loading="loading"
          @page="onPage($event)" @sort="onSort($event)" @filter="onFilter($event)"
          sortField="strcodigo" :sortOrder="1"
          :paginator="true" :rows="10" :rowsPerPageOptions="[10,20,50]"
          paginatorTemplate="FirstPageLink PrevPageLink PageLinks NextPageLink LastPageLink CurrentPageReport RowsPerPageDropdown"
          currentPageReportTemplate="Mostrando {first} a {last} de {totalRecords} registros"
          v-model:filters="filters" filterDisplay="menu" :globalFilterFields="['strcodigo','strdescripcion']"
          responsiveLayout="stack">
        <template #header>
          <div class="flex justify-content-between mb-2">
            <h5 class="mt-0" v-tooltip.right="'Estados de la agrupación'">ESTADOS DE LA AGRUPACIÓN</h5>
          </div>
          <div class="flex justify-content-between">
            <div>
              <Button type="button" icon="pi pi-filter-slash" label="Limpiar filtros" class="button-outlined" @click="clearFilter()"/>
              <span class="p-input-icon-left ml-2">
                <i class="pi pi-search" />
                <InputText v-model="filters['global'].value" placeholder="Buscar por..." />
              </span>
            </div>
            <div>
              <Button icon="pi pi-external-link" label="Exportar datos (CSV)" @click="exportCSV($event)" />
            </div>
          </div>
        </template>
        <template #empty>
          No se han encontrado datos.
        </template>
        <template #loading>
          Cargando datos. Por favor, espere.
        </template>
        <Column field="strcodigo" header="Código" style="width:20%" :sortable="true">
          <template #body="{data}">
            {{data.strcodigo}}
          </template>
          <template #filter="{filterModel}">
            <InputText type="text" v-model="filterModel.value" class="p-column-filter" placeholder="Buscar por texto"/>
          </template>
          <template #filterclear="{filterCallback}">
            <Button type="button" icon="pi pi-times" @click="filterCallback()" class="p-button-secondary"></Button>
          </template>
          <template #filterapply="{filterCallback}">
            <Button type="button" icon="pi pi-check" @click="filterCallback()" class="p-button-success"></Button>
          </template>
        </Column>
        <Column field="strdescripcion1" header="Descripción" style="width:20%" :sortable="true">
          <template #body="{data}">
            {{data.strdescripcion}}
          </template>
          <template #filter="{filterModel}">
            <InputText type="text" v-model="filterModel.value" class="p-column-filter" placeholder="Buscar por texto"/>
          </template>
          <template #filterclear="{filterCallback}">
            <Button type="button" icon="pi pi-times" @click="filterCallback()" class="p-button-secondary"></Button>
          </template>
          <template #filterapply="{filterCallback}">
            <Button type="button" icon="pi pi-check" @click="filterCallback()" class="p-button-success"></Button>
          </template>
        </Column>
        <Column :exportable="false" header="Operaciones" style="width: 10%; min-width:8rem" bodyStyle="text-align:center">
          <template #body="slotProps">
            <Button icon="pi pi-search" class="p-button-rounded p-button-info mr-2" @click="openRegistro(slotProps.data, 'DETAIL')" />
          </template>
        </Column>
      </DataTable>
    </div>

    <Estadosagrrecord ref="estadosagrrecord" />
  </div>
</template>

<script>
  import { ref, onMounted } from 'vue';
  import {FilterMatchMode} from 'primevue/api';
//  import {FilterMatchMode, FilterOperator} from 'primevue/api';

  import EstadosagrService from '../service/EstadosagrService';

  import Estadosagrrecord from "@/components/Estadosagrrecord";

  export default {
    name: "estadosagr",
    setup() {
      onMounted(() => {
        loading.value = true;

        // Parámetros iniciales para la tabla de datos
        lazyParams.value = {
            first: 0,
            rows: estadoagr.value.rows,
            sortField: 'strcodigo',
            sortOrder: 1,
            filters: filters.value
        };

        // Se carga la tabla de datos
        loadLazyData();
      })

      // Servicio para las operaciones CRUD de la tabla
      const estadosagrService = new EstadosagrService();

      const listEstadosagr = ref(null);
      const estadoagr = ref();
      const loading = ref(true);
      const columns = ref([
          {field: 'strcodigo', header: 'Código'},
          {field: 'strdescripcion', header: 'Descripción'}
      ]);
      const totalRecords = ref(0);
      const lazyParams = ref({});

      const filters = ref({
          'global': {value: null, matchMode: FilterMatchMode.CONTAINS},
      });

      const clearFilter = () => {
          initFilters();
      };
      const initFilters = () => {
          filters.value = {
            'global': {value: null, matchMode: FilterMatchMode.CONTAINS},
          }
      };

      const onPage = (event) => {
        lazyParams.value = event;
        loadLazyData();
      };
      const onSort = (event) => {
        lazyParams.value = event;
        loadLazyData();
      };
      const onFilter = () => {
        lazyParams.value.filters = filters.value ;
        loadLazyData();
      }

      const loadLazyData = () => {
          loading.value = true;
          setTimeout(() => {
            estadosagrService.getParams( lazyParams.value )
              .then(json => {
                listEstadosagr.value = json.data._embedded.estadosagr;
                totalRecords.value  = json.data.page.totalElements;
                loading.value = false;
              });
          }, Math.random() * 1000 + 250);
      };

      // Referencia al componente hijo
      const estadosagrrecord = ref (Estadosagrrecord);
      const openRegistro = (reg, modo) => {
        estadosagrrecord.value.openRegistro(reg, modo);
      }

      return {
        listEstadosagr, estadoagr, columns, loading, totalRecords, lazyParams, filters,
        clearFilter, initFilters, onPage, onSort, onFilter, loadLazyData,
        estadosagrrecord, openRegistro
      }
    },
    methods: {
      exportCSV() {
        this.$refs.estadoagr.exportCSV();
      }
    },
    components: {
      Estadosagrrecord
    }
  }
</script>

<style lang="scss" scoped>
  ::v-deep(.p-paginator) {
    .p-paginator-current {
      margin-left: auto;
    }
  }
</style>
