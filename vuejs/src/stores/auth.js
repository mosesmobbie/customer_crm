import { defineStore } from "pinia";
import axios from "axios";
import router from "../router";

axios.defaults.baseURL = "http://localhost:8000/api";

export const useAuthStore = defineStore("authStore", {
  state: () => {
    return {
      user: null,
      errors: {},
    };
  },
  actions: {
    /** Get User **/
    async getUser() {
      if (localStorage.getItem("token")) {
        const response = await axios.get("user", {
          headers: {
            "Content-Type": "application/json",
            authorization: `Bearer ${localStorage.getItem("token")}`,
          },
        });

        const data = response.data;
        if (response.statusText == "OK") {
          this.user = data;
        }
      }
    },
    /** Register **/
    async authenticate(apiRoute, formData) {
      try {
        const response = await axios.post(apiRoute, formData, {
          headers: {
            "Content-Type": "application/json",
          },
        });

        if (response.data.errors) {
          this.errors = response.data.errors;
        } else {
          localStorage.setItem("token", response.data.token);
          this.user = response.data.user;
          this.router.push({ name: "home" });
        }

        return response.data;
      } catch (error) {
        console.error(
          "Error sending data:",
          error.response?.data || error.message
        );
        this.errors = error.response?.data?.errors || ["An error occurred"];
        throw error;
      }
    },
    /** Log out **/
    async logout() {
      const response = await axios.post("logout", null, {
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${localStorage.getItem("token")}`,
        },
      });

      if (response.statusText == "OK") {
        this.user = null;
        this.errors = {};
        localStorage.removeItem("token");
      }
      this.router.push({ name: "login" });
    },
  },
});
