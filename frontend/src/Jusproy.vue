<template>
  <div>
    <Juspromenu />
  </div>

  <router-view />
</template>

<script>
import Juspromenu from "@/components/Juspromenu.vue";

export default {
  name: 'jusproy',

  components: {
    Juspromenu
  }}
</script>

<style>
body {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #001d85;
  margin-top: 0.5rem;
}
</style>
