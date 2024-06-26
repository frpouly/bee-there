<script setup lang="ts">
defineProps<{
  name: string,
  id: number
}>()
</script>

<template>
    <div class="tab-line">
       <div class="hive-name">{{ name }}</div>
       <div class="details">
            <RouterLink :to="'/hives/' + id">
                <img src="@/assets/arrow.svg" loading="lazy" width=100>
            </RouterLink>
        </div>
    </div>
</template>

<style scoped>
.tab-line {
  flex-flow: row;
  justify-content: flex-start;
  align-items: stretch;
  width: 100%;
  height: 100%;
  display: flex;
}

.hive-name {
  text-align: center;
  object-fit: fill;
  border: 1px solid #000;
  flex: 0 auto;
  width: 100%;
  display: block;
  position: static;
}

.details {
  color: #fff;
  text-align: center;
  border: 1px solid #000;
  border-radius: 0;
  width: 100%;
  height: 100%;
}
</style>
