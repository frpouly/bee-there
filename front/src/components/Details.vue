<script setup lang="ts">
import axios from 'axios';
defineProps<{
  id: number
}>()
</script>

<template>
    <div class="hive-details">
        <div class="card">
        <img src="@/assets/hive_image.webp" alt="Hive" style="width:100%">
        <div class="container">
            <h4><b>{{ hive.name }}</b></h4> 
            <p>{{ hive.weight }}kg</p> 
        </div>
        </div>
    </div>
</template>

<script lang="ts">
export default {
  data() {
    return {
      hive: {}
    };
  },
  mounted() {
    axios
      .get(import.meta.env.VITE_API_URL + "/hives/" + this.id)
      .then(response => {
        this.hive = response.data;
      })
      .catch(error => {
        console.error('Error fetching data:', error);
      });
  }
};
</script>

<style scoped>
.card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  width: 100%;
  text-align: center;
}

.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

.container {
  padding: 2px 16px;
}
</style>

