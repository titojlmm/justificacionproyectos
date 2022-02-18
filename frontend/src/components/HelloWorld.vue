<template>
  <h1>{{ msg }}</h1>
</template>

<script>
export default {
  name: 'HelloWorld',
  data() {
    return {
      msg: ''
    }
  },
  mounted() {
    const API_CALL = '/api/messages/home';
    fetch(API_CALL)
      .then((response) => response.text())
      .then((data) => {
          this.msg = data;
      });
  }
}
</script>

<style>
</style>
