<script setup>
import { onMounted, ref } from 'vue';
import { useCustomersStore } from '../stores/customers';
import { storeToRefs } from 'pinia';

const { getAllCustomers, deleteCustomer } = useCustomersStore();
const { errors, message } = storeToRefs(useCustomersStore());

const customers = ref([]);

onMounted(async () => (customers.value = await getAllCustomers()));

async function handleDelete(id) {
  if (window.confirm('Are you sure you want to delete this customer?')) {
    await deleteCustomer(id);
    customers.value = customers.value.filter(customer => customer.id !== id);
  }
}
</script>

<template>
  <main>
    <div class="container">
      <div class="row justify-content-center align-items-center mt-5">
        <p v-if="message" :class="`text-${message.type}`">{{ message.text }}</p>
        <div class="col-md-12 col-lg-12">
          <h1 class="text-center mb-4 fundi-text">Customers</h1>
          <div v-if="customers.length > 0">
            <table class="table table-striped mx-auto">
              <thead class="table-light">
                <tr>
                  <th scope="col">#</th>
                  <th scope="col">First Name</th>
                  <th scope="col">Last Name</th>
                  <th scope="col">Email</th>
                  <th scope="col">ID Number</th>
                  <th scope="col">Date of Birth</th>
                  <th scope="col">Phone</th>
                  <th scope="col">Status</th>
                  <th scope="col"></th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="(customer, index) in customers" :key="customer.id">
                  <td>{{ index + 1 }}</td>
                  <td>{{ customer.first_name }}</td>
                  <td>{{ customer.last_name }}</td>
                  <td>{{ customer.email }}</td>
                  <td>{{ customer.id_number }}</td>
                  <td>{{ customer.date_of_birth }}</td>
                  <td>{{ customer.phone }}</td>
                  <td>{{ customer.status }}</td>
                  <td>
                    <button class="btn btn-warning edit_customer me-1" @click="editCustomer(customer.id)"><i class="bi bi-pencil"></i></button>
                    <button class="btn btn-danger delete_customer ml-1" @click="handleDelete(customer.id)"><i class="bi bi-trash"></i></button>
                  </td>
                </tr>

              </tbody>
            </table>
          </div>
          <div v-else>
            <h4>There are no cutomers</h4>
          </div>
        </div>
      </div>
    </div>
  </main>
</template>
