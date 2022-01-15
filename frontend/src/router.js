import { createRouter, createWebHistory } from "vue-router"

import Home from "./views/Home.vue";
import Users from "./views/Users.vue";
import NotFound from "./views/NotFound.vue";
import Tiposproyecto from "./views/Tiposproyecto.vue";

const routes = [
  {
    path: "/",
    name: "home",
    component: Home
  },
  {
    path: "/users",
    name: "users",
    component: Users
  },
  {
    path: "/tiposproyecto",
    name: "tiposproyecto",
    component: Tiposproyecto
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
