import "primeflex/primeflex.css";
import 'primevue/resources/themes/saga-blue/theme.css';       //theme
import 'primevue/resources/primevue.min.css';                 //core css
import 'primeicons/primeicons.css';                           //icons
import "./index.css";

import { createApp } from "vue";
import Jusproy from "@/Jusproy.vue";
import util from './plugins/util'

import router from "@/router";
import axios from 'axios';
import PrimeVue from 'primevue/config';
import VueAxios from 'vue-axios';
import ToastService from 'primevue/toastservice';

import Tooltip from 'primevue/tooltip';

import Button from 'primevue/button';
import Checkbox from 'primevue/checkbox';
import Column from 'primevue/column';
import DataTable from 'primevue/datatable';
import Dialog from 'primevue/dialog';
import InputText from 'primevue/inputtext';
import Menubar from 'primevue/menubar';
import Row from 'primevue/row';
import Toast from 'primevue/toast';
import ToggleButton from 'primevue/togglebutton';

const app = createApp(Jusproy);

app.use(util)

app.use(router);
app.use(PrimeVue);
app.use(VueAxios, axios);
app.use(ToastService);

app.directive('tooltip', Tooltip);

app.component('Button', Button);
app.component('Checkbox', Checkbox);
app.component('Column', Column);
app.component('DataTable', DataTable);
app.component('Dialog', Dialog);
app.component('InputText', InputText);
app.component('Menubar', Menubar);
app.component('Row', Row);
app.component('Toast', Toast);
app.component('ToggleButton', ToggleButton );

app.mount('#jusproy');
