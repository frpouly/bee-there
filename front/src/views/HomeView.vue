<script setup lang="ts">
import Header from '../components/Header.vue'
import Hives from '../components/Hives.vue'
import axios from 'axios';

</script>

<template>
  <main>
    <header>
      <Header/>
    </header>

    <body>
      <form v-on:submit.prevent="submit">
        <h2>Add a new hive</h2>
        <p>Hive name: <input type="text" required v-model="name"></p>
        <p>Weight: <input type="number" min="1" required v-model="weight"></p>
        <button type="submit">Add hive</button>
      </form>
      <Hives :hives="hives"/>
    </body>
  </main>
</template>

<script lang="ts">
export default {
  methods: {
    submit() {
        let hive = {
          name: this.name,
          weight: this.weight
        }
        axios.post(import.meta.env.VITE_API_URL + "/hives", hive)
        .then((result) => {
          this.hives.push(result.data)
        })
        .catch((error) => {
          alert("Error pushing data: " + JSON.stringify(error.response.data));
        })
    },
  },
  data() {
    return {
      hives: []
    };
  },
  mounted() {
    axios
      .get(import.meta.env.VITE_API_URL + "/hives")
      .then(response => {
        this.hives = response.data;
      })
      .catch(error => {
        console.error('Error fetching data:', error);
      });
  }
}
</script>
