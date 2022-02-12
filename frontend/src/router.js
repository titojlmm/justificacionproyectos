import { createRouter, createWebHistory } from "vue-router"

import Home from "./views/Home.vue";
import Users from "./views/Users.vue";
import NotFound from "./views/NotFound.vue";
import Tiposproyecto from "./views/Tiposproyecto.vue";
import Centros from "./views/Centros.vue";
import Bloquestecnica from "./views/Bloquestecnica.vue";

const routes = [
  {
    path: "/",
    name: "home",
    component: Home
  },
  {
    path: "/centros",
    name: "centros",
    component: Centros
  },
  {
    path: "/tiposproyecto",
    name: "tiposproyecto",
    component: Tiposproyecto
  },
  {
    path: "/bloquestecnica",
    name: "bloquestecnica",
    component: Bloquestecnica
  },
  {
    path: "/users",
    name: "users",
    component: Users
  },
  {
    path: "/:catchAll(.*)",
    component: NotFound
  }
];

const router = createRouter({
  history: createWebHistory(),
  routes: routes
});

export default router;
