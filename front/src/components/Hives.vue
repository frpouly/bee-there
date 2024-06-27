<script setup lang="ts">
import HiveLine from './HiveLine.vue'
import axios from 'axios';
defineProps<{
  hives: Array<any>
}>()
</script>

<template>
    <div class="hives-header">
        <div class="name">Name</div>
        <div class="details">Details</div>
    </div>
    <div class="hives-body">
        <div class="hive" v-for="hive in hives" :key="hive.id">
            <HiveLine :name="hive.name" :id="hive.id" />
        </div>
    </div>
</template>

<style scoped>
.hives-header {
  text-align: left;
  background-color: #742527;
  border: 1px #000;
  justify-content: space-around;
  align-items: stretch;
  margin-left: 0;
  margin-right: 0;
  display: flex;
  color: #fff;
}
</style>
