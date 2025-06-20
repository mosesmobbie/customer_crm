<script setup>
import { reactive } from 'vue';
import { useAuthStore } from '../../stores/auth';
import { storeToRefs } from 'pinia';
import { onMounted } from 'vue';

// const authStore = useAuthStore();
const { errors } = storeToRefs(useAuthStore());
const { authenticate } = useAuthStore();

const formData = reactive({
    email: "",
    password: "",
});

onMounted (()=> errors.value ={})
</script>

<template>
  <main>
    <div class="container">
        <div class="row justify-content-center align-items-center min-vh-100">
            <div class="col-md-6 col-lg-4">
                <div class="card shadow-sm">
                    <div class="card-body p-4">
                        <h1 class="text-center mb-4 fundi-text">Login</h1> 
                         <form @submit.prevent="authenticate('login', formData)">
                            <div class="mb-3">
                                <input type="text" class="form-control" placeholder="Email" v-model="formData.email" required/>
                                <p v-if="errors.email" class="error">{{  errors.email[0] }}</p>
                            </div>
                            <div class="mb-3">
                                <input type="password" class="form-control" placeholder="Password" v-model="formData.password" required/>
                                <p v-if="errors.password" class="error">{{  errors.password[0] }}</p>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Login</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
  </main>
</template>
