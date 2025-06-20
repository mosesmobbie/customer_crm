# CRM Application

**CRM Application - Laravel API with Sanctum, jQuery, Bootstrap and PHPUNIt test**
This is a simple Customer Relationship Management (CRM) application built with a Laravel API backend (using Sanctum for authentication) and a frontend powered by jQuery and Bootstrap. The application allows users to manage customers, contacts, and related data.

## Features
* User authentication (login/register) using Laravel Sanctum.
* CRUD operations for managing customers and contacts.
* Responsive frontend interface built with Bootstrap.
* AJAX-based interactions using jQuery for seamless user experience.
* Secure API endpoints protected by Sanctum tokens.

## Technologies Used**
* Backend: Laravel (PHP), Sanctum (API authentication)
* Frontend: jQuery, Bootstrap (CSS framework)
* Database: MySQL (or your preferred database)
* Version Control: Git

## Prerequisites
* PHP >= 8.1
* Composer
* Node.js and npm
* MySQL (or another supported database)
* Git
* Laravel CLI (optional, for easier command execution)

# Application Setup Guide

## Backend (PHP 8.1)
- Import the `crm_database` file into a MySQL server (MySQL 8 recommended).
- Duplicate the `.env.example` file and rename it to `.env`.
- Configure the database settings in the `.env` file.
- Launch the Laravel application.

## Frontend (jQuery 3.7 & Bootstrap 5.3)
- Set the API `baseUrl` on line 1 of the `main.js` file.
- Open the `index.html` file in any web browser.
