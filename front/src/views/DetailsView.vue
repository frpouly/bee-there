<script setup lang="ts">
import Header from '../components/Header.vue'
import Details from '../components/Details.vue'
import { useRoute } from 'vue-router'

const route = useRoute()
</script>

<template>
  <main>
    <header>
      <Header/>
    </header>

    <body>
      <Details :id="parseInt(Array.isArray(route.params.id) ? route.params.id[0] : route.params.id)"/>
    </body>
  </main>
</template>
