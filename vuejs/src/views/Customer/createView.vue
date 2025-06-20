<script setup>
import { reactive } from 'vue';
import { useCustomersStore } from '../../stores/customers';
import { storeToRefs } from 'pinia';
import { onMounted } from 'vue';

const { errors, message } = storeToRefs(useCustomersStore());
const { createCustomer } = useCustomersStore();
const { clearMessages } = useCustomersStore();

const formData = reactive({
    first_name: "",
    last_name: "",
    email: "",
    id_number: "",
    date_of_birth: "",
    phone: "",
    status: "pending",
});

onMounted(() => {
  clearMessages();
});
</script>
<template>
    <main>
        <div class="container">
        <div class="row justify-content-center align-items-center mt-5">
            <div class="col-md-6 col-lg-6">
                <p v-if="message" :class="`text-${message.type}`">{{ message.text }}</p>
                <h1 class="text-center mb-4 fundi-text">Add New Customer</h1> 
                <form @submit.prevent="createCustomer('customers', formData)">
                    <div class="row mb-3">
                        <label for="first_name" class="col-sm-4 col-form-label">First name</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="first_name" name="first_name" v-model="formData.first_name" placeholder="First name" required>
                            <p v-if="errors.first_name" class="error">{{  errors.first_name[0] }}</p>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="last_name" class="col-sm-4 col-form-label">Last name</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="last_name" v-model="formData.last_name" placeholder="Last name" required>
                            <p v-if="errors.last_name" class="error">{{  errors.last_name[0] }}</p>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="email" class="col-sm-4 col-form-label">Email</label>
                        <div class="col-sm-8">
                        <input type="email" class="form-control" id="email" v-model="formData.email" placeholder="Email" required>
                        <p v-if="errors.email" class="error">{{  errors.email[0] }}</p>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="id_number" class="col-sm-4 col-form-label">ID Number</label>
                        <div class="col-sm-8">
                        <input type="text" class="form-control" id="id_number" v-model="formData.id_number" placeholder="ID Number" required>
                        <p v-if="errors.id_number" class="error">{{  errors.id_number[0] }}</p>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="date_of_birth"  class="col-sm-4 col-form-label">Date Of Birth</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="date_of_birth" v-model="formData.date_of_birth" placeholder="YYYY/MM/DD" required>
                            <p v-if="errors.date_of_birth" class="error">{{  errors.date_of_birth[0] }}</p>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="phone" class="col-sm-4 col-form-label">Phone</label>
                        <div class="col-sm-8">
                        <input type="text" class="form-control" id="phone" v-model="formData.phone" placeholder="Phone" required>
                        <p v-if="errors.phone" class="error">{{  errors.phone[0] }}</p>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label for="status" class="col-sm-4 col-form-label">Status</label>
                        <div class="col-sm-8">
                        <select class="form-select" id="status" v-model="formData.status" aria-label="Default select" required>
                            <option value="pending">Pending</option>
                            <option value="active">Active</option>
                            <option value="inactive">Inactive</option>
                        </select>
                        </div>
                    </div>
                    <input type="hidden" id="customer_id" name="customer_id">
                    <button type="submit" class="btn btn-primary">Save</button>
                </form>
            </div>
        </div>
    </div>
    </main>
</template>