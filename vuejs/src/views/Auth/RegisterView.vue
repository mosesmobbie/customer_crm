<script setup>
import { reactive } from 'vue';
import { useAuthStore } from '../../stores/auth';
import { storeToRefs } from 'pinia';
import { onMounted } from 'vue';

// const authStore = useAuthStore();
const { errors } = storeToRefs(useAuthStore());
const { authenticate } = useAuthStore();

const formData = reactive({
    name: "",
    email: "",
    password: "",
    password_confirmation: "",
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
                        <h1 class="text-center mb-4 fundi-text">Register</h1> 
                         <form @submit.prevent="authenticate('register', formData)">
                            <div class="mb-3">
                                <input type="text" class="form-control" placeholder="Name" v-model="formData.name" required/>
                                <p v-if="errors.name" class="error">{{  errors.name[0] }}</p>
                            </div>
                            <div class="mb-3">
                                <input type="text" class="form-control" placeholder="Email" v-model="formData.email" required/>
                                <p v-if="errors.email" class="error">{{  errors.email[0] }}</p>
                            </div>
                            <div class="mb-3">
                                <input type="password" class="form-control" placeholder="Password" v-model="formData.password" required/>
                                <p v-if="errors.password" class="error">{{  errors.password[0] }}</p>
                            </div>
                            <div class="mb-3">
                                <input type="password" class="form-control" placeholder="Confirm Password" v-model="formData.password_confirmation" required/>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Register</button>
                        </form>
                        <p class="text-center mt-3 mb-0">
                            Already have an account? <a href="#">Login</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
  </main>
</template>
