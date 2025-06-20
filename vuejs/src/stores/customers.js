// stores/customers.js
import { defineStore } from 'pinia';
import axios from 'axios';
import toastr from 'toastr'; // Import toastr directly
import router from '../router';

export const useCustomersStore = defineStore('customersStore', {
  state: () => ({
    customers: [], 
    currentCustomer: null, 
    errors: [], 

  }),
  actions: {
    /* Get All Customers */
    async getAllCustomers() {
      try {
        if (!localStorage.getItem('token')) {
          toastr.error('No authentication token found.');
          return [];
        }

        const response = await axios.get('customers', {
          headers: {
            'Content-Type': 'application/json',
            Authorization: `Bearer ${localStorage.getItem('token')}`,
          },
        });

        this.customers = response.data.data; // Store customers in state
        return this.customers;
      } catch (error) {
        this.errors = error.response?.data.errors || [];
        toastr.error(error.response?.data.message);
        return [];
      }
    },

    /* Get Customer by ID */
    async getCustomer(id) {
      try {
        const response = await axios.get(`customers/${id}`, {
          headers: {
            'Content-Type': 'application/json',
            Authorization: `Bearer ${localStorage.getItem('token')}`,
          },
        });

        this.currentCustomer = response.data.data; // Store single customer
        return this.currentCustomer;
      } catch (error) {
        this.errors = error.response?.data.errors || [];
        toastr.error(error.response?.data.message);
        return null;
      }
    },

    /* Delete Customer */
    async deleteCustomer(id) {
      try {
        const response = await axios.delete(`customers/${id}`, {
          headers: {
            'Content-Type': 'application/json',
            Authorization: `Bearer ${localStorage.getItem('token')}`,
          },
        });

        toastr.success(response.data.message);
      } catch (error) {
        this.errors = error.response?.data.errors || [];
        toastr.error(error.response?.data.message );
      }
    },

    /* Create a Customer */
    async createCustomer(formData) {
      try {
        const response = await axios.post('customers', formData, {
          headers: {
            'Content-Type': 'application/json',
            Authorization: `Bearer ${localStorage.getItem('token')}`,
          },
        });

        this.errors = [];
        toastr.success(response.data.message);
        router.push({ name: 'home' }); 
      } catch (error) {
        this.errors = error.response?.data.errors || [];
        toastr.error(error.response?.data.message);
      }
    },

    /* Clear Messages */
    clearMessages() {
      this.errors = [];
    },
  },
});