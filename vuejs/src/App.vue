<script setup>
import { RouterLink, RouterView } from 'vue-router'
import { useAuthStore } from './stores/auth';
import { onMounted } from 'vue';

const authStore = useAuthStore()

onMounted(() => {
  authStore.getUser();
});
</script>

<template>
  <header>
    <nav class="navbar bg-dark border-bottom border-body" data-bs-theme="dark">
      <div class="container-fluid">
        <RouterLink :to="{ name: 'home' }" class="navbar-brand">Customers</RouterLink>


        <div v-if="authStore.user" style="display: flex; align-items: center; gap: 1rem;">
          <RouterLink :to="{ name: 'create' }" class="navbar-brand">Add</RouterLink>
          <span v-if="authStore.user" class="navbar-brand mb-0 h1">{{ authStore.user.name }}</span>
          <form @submit.prevent="authStore.logout" class="d-flex" role="search">
            <button type="submit" class="btn btn-outline-danger"> Logout </button>
          </form>
        </div>

        <div v-else>
          <span class="navbar-text">
            <RouterLink :to="{ name: 'register' }" class="navbar-brand">Register</RouterLink>
            <RouterLink :to="{ name: 'login' }" class="navbar-brand">Login</RouterLink>
          </span>
        </div>

      </div>
    </nav>
  </header>

  <RouterView />
</template>