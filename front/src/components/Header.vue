<script setup lang="ts">
</script>

<template>
    <RouterLink to="/">
        <div class="header">
            <img src="@/assets/hive.png" loading="lazy" width="Auto">
            <h1 class="heading">Bee There</h1>
        </div>
    </RouterLink>
</template>

<style scoped>
.header {
  grid-column-gap: 80px;
  grid-row-gap: 80px;
  aspect-ratio: auto;
  text-align: center;
  justify-content: center;
  height: 100px;
  max-height: 100px;
  display: flex;
}
</style>