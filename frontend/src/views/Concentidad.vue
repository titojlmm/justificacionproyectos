<template>
  <div>
    <div class="card">
      <DataTable
          :value="listConcentidad" ref="concentidad" dataKey="_links.self.href" showGridlines stripedRows :rowHover="true"
          :resizableColumns="true" columnResizeMode="fit"
          :lazy="true" :totalRecords="totalRecords" :loading="loading"
          @page="onPage($event)" @sort="onSort($event)" @filter="onFilter($event)"
          sortField="strtipogastomin" :sortOrder="1"
          :paginator="true" :rows="10" :rowsPerPageOptions="[10,20,50]"
          paginatorTemplate="FirstPageLink PrevPageLink PageLinks NextPageLink LastPageLink CurrentPageReport RowsPerPageDropdown"
          currentPageReportTemplate="Mostrando {first} a {last} de {totalRecords} registros"
          v-model:filters="filters" filterDisplay="menu" :globalFilterFields="['strtipogastomin','strctpcon','strctpsco']"
          responsiveLayout="stack">
        <template #header>
          <div class="flex justify-content-between mb-2">
            <h5 class="mt-0" v-tooltip.right="'Conceptos de la entidad financiadora'">CONCEPTOS DE LA ENTIDAD FINANCIADORA</h5>
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
        <template #footer>
          <Button label="Añadir" icon="pi pi-plus" @click="openRegistro(null, 'CREATE')" />
        </template>
        <Column field="strctpcon" header="Código principal" style="width:20%" :sortable="true">
          <template #body="{data}">
            {{data.strctpcon}}
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
        <Column field="strctpsco" header="Código secundario" style="width:20%" :sortable="true">
          <template #body="{data}">
            {{data.strctpsco}}
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
        <Column field="strtipogastomin" header="Descripción del tipo" style="width:20%" :sortable="true">
          <template #body="{data}">
            {{data.strtipogastomin}}
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
            <Button icon="pi pi-pencil" class="p-button-rounded p-button-success mr-2" @click="openRegistro(slotProps.data, 'UPDATE')" />
            <Button icon="pi pi-trash" class="p-button-rounded p-button-warning" @click="openRegistro(slotProps.data, 'DELETE')" />
          </template>
        </Column>
      </DataTable>
    </div>

    <Concentidadrecord ref="concentidadrecord" @recargardatos="loadLazyData" />
  </div>
</template>

<script>
  import { ref, onMounted } from 'vue';
  import {FilterMatchMode} from 'primevue/api';
//  import {FilterMatchMode, FilterOperator} from 'primevue/api';

  import ConcentidadService from '../service/ConcentidadService';

  import Concentidadrecord from "@/components/Concentidadrecord";

  export default {
    name: "concentidad",
    setup() {
      onMounted(() => {
        loading.value = true;

        // Parámetros iniciales para la tabla de datos
        lazyParams.value = {
            first: 0,
            rows: concentidad.value.rows,
            sortField: 'strtipogastomin',
            sortOrder: 1,
            filters: filters.value
        };

        // Se carga la tabla de datos
        loadLazyData();
      })

      // Servicio para las operaciones CRUD de la tabla
      const concentidadService = new ConcentidadService();

      const listConcentidad = ref(null);
      const concentidad = ref();
      const loading = ref(true);
      const columns = ref([
          {field: 'strctpcon', header: 'Código principal'},
          {field: 'strctpsco', header: 'Código secundario'},
          {field: 'strtipogastomin', header: 'Tipo de gasto (concepto) de la entidad'},
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
            concentidadService.getParams( lazyParams.value )
              .then(json => {
                listConcentidad.value = json.data._embedded.concentidad;
                totalRecords.value  = json.data.page.totalElements;
                loading.value = false;
              });
          }, Math.random() * 1000 + 250);
      };

      // Referencia al componente hijo
      const concentidadrecord = ref (Concentidadrecord);
      const openRegistro = (reg, modo) => {
        concentidadrecord.value.openRegistro(reg, modo);
      }

      return {
        listConcentidad, concentidad, columns, loading, totalRecords, lazyParams, filters,
        clearFilter, initFilters, onPage, onSort, onFilter, loadLazyData,
        concentidadrecord, openRegistro
      }
    },
    methods: {
      exportCSV() {
        this.$refs.concentidad.exportCSV();
      }
    },
    components: {
      Concentidadrecord
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
