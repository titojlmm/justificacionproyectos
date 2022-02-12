<template>
  <div>
    <div class="card">
      <DataTable
          :value="listBloquestecnica" ref="bloquetecnica" dataKey="_links.self.href" showGridlines stripedRows :rowHover="true"
          :resizableColumns="true" columnResizeMode="fit"
          :lazy="true" :totalRecords="totalRecords" :loading="loading"
          @page="onPage($event)" @sort="onSort($event)" @filter="onFilter($event)"
          sortField="strcodigo" :sortOrder="1"
          :paginator="true" :rows="10" :rowsPerPageOptions="[10,20,50]"
          paginatorTemplate="FirstPageLink PrevPageLink PageLinks NextPageLink LastPageLink CurrentPageReport RowsPerPageDropdown"
          currentPageReportTemplate="Mostrando {first} a {last} de {totalRecords} registros"
          v-model:filters="filters" filterDisplay="menu" :globalFilterFields="['strtecnica','strcodigo']"
          responsiveLayout="stack">
        <template #header>
          <div class="flex justify-content-between mb-2">
            <h5 class="mt-0" v-tooltip.right="'Bloques para la justificación técnica'">BLOQUES PARA LA JUSTIFICACIÓN TÉCNICA</h5>
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
        <Column field="strtecnica" header="Bloque de la justificación técnica" style="width:20%" :sortable="true">
          <template #body="{data}">
            {{data.strtecnica}}
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
        <Column :exportable="false" header="Operaciones" style="width: 10%; min-width:8rem" bodyStyle="text-align:center">
          <template #body="slotProps">
            <Button icon="pi pi-pencil" class="p-button-rounded p-button-success mr-2" @click="openRegistro(slotProps.data, 'UPDATE')" />
            <Button icon="pi pi-trash" class="p-button-rounded p-button-warning" @click="openRegistro(slotProps.data, 'DELETE')" />
          </template>
        </Column>
      </DataTable>
    </div>

    <Bloquestecnicarecord ref="bloquestecnicarecord" @recargardatos="loadLazyData" />
  </div>
</template>

<script>
  import { ref, onMounted } from 'vue';
  import {FilterMatchMode} from 'primevue/api';
//  import {FilterMatchMode, FilterOperator} from 'primevue/api';

  import BloquestecnicaService from '../service/BloquestecnicaService';

  import Bloquestecnicarecord from "@/components/Bloquestecnicarecord";

  export default {
    name: "bloquestecnica",
    setup() {
      onMounted(() => {
        loading.value = true;

        // Parámetros iniciales para la tabla de datos
        lazyParams.value = {
            first: 0,
            rows: bloquetecnica.value.rows,
            sortField: 'strcodigo',
            sortOrder: 1,
            filters: filters.value
        };

        // Se carga la tabla de datos
        loadLazyData();
      })

      // Servicio para las operaciones CRUD de la tabla
      const bloquestecnicaService = new BloquestecnicaService();

      const listBloquestecnica = ref(null);
      const bloquetecnica = ref();
      const loading = ref(true);
      const columns = ref([
          {field: 'strtecnica', header: 'Bloque de la justificación técnica'},
          {field: 'strcodigo', header: 'Código'}
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
            bloquestecnicaService.getParams( lazyParams.value )
              .then(json => {
                listBloquestecnica.value = json.data._embedded.bloquestecnica;
                totalRecords.value  = json.data.page.totalElements;
                loading.value = false;
              });
          }, Math.random() * 1000 + 250);
      };

      // Referencia al componente hijo
      const bloquestecnicarecord = ref (Bloquestecnicarecord);
      const openRegistro = (reg, modo) => {
        bloquestecnicarecord.value.openRegistro(reg, modo);
      }

      return {
        listBloquestecnica, bloquetecnica, columns, loading, totalRecords, lazyParams, filters,
        clearFilter, initFilters, onPage, onSort, onFilter, loadLazyData,
        bloquestecnicarecord, openRegistro
      }
    },
    methods: {
      exportCSV() {
        this.$refs.bloquestecnica.exportCSV();
      }
    },
    components: {
      Bloquestecnicarecord
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
