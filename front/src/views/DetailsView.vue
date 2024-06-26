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
      <Details :id="route.params.id"/>
    </body>
  </main>
</template>
