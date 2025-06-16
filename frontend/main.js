var baseUrl = "http://127.0.0.1:8000/api";

var token = null;

$(document).ready(function() {

    checkSession();

    handleLoginSubmission();

    handleLogoutEvent();

    handleEditFormEvent();

    handleAddNewFormEvent();

    handleAddEditFormSubmission();

    handleDeleteEvent();
});

function checkSession() {
    var token = getToken();

    if (token) {
        $.ajax({
            url: `${baseUrl}/user`,
            type: "GET",
            headers: {
                "Authorization": `Bearer ${token}`
            },
            contentType: "application/json",
            dataType: 'json',
            success: function(response, textStatus, jqXHR) {
                if (jqXHR.status == 200) {
                    updateUI(response.name);
                    loadCustomers();
                } else {
                    displayAlert("danger", response.message);
                    updateUI(null);
                }
            },
            error: function(jqXHR, textStatus, error) {
                updateUI(null);
                displayAlert("danger", error);
            }
        });
    } else {
        updateUI(null);
    }
}

function handleLoginSubmission() {
    $("#login_form").validate({
        submitHandler: function(form) {
            var json_string = serializeFormIntoJson(form);

            $.ajax({
                url: `${baseUrl}/login`,
                type: 'POST',
                contentType: "application/json",
                dataType: 'json',
                data: json_string,
                success: function(response) {
                    if (response.token) {
                        storeToken(response.token);
                        $("#login_page").hide();
                        $("#auth_nav").removeClass("d-none");
                        updateUI(response.user.name);
                        loadCustomers();
                    } else {
                        displayAlert("danger", "Login failed: " + (response.message));
                    }
                },
                error: function(error) {
                    displayAlert("danger", error.responseJSON.message);
                }
            });
        }
    });
}

function loadCustomers() {
    var token = getToken();

    $("#customers_list").empty();

    if (token == null) {
        updateUI();
        return;
    }

    $.ajax({
        url: `${baseUrl}/customers`,
        type: 'get',
        contentType: "application/json",
        dataType: 'json',
        headers: {
            "Authorization": `Bearer ${token}`
        },
        success: function(response) {
            if (response) {
                response.data.forEach(function(customer) {
                    $("#customers_list").append(`
                        <tr>
                            <td>${customer.first_name}</td>
                            <td>${customer.last_name}</td>
                            <td>${customer.email}</td>
                            <td>${customer.id_number}</td>
                            <td>${customer.date_of_birth}</td>
                            <td>${customer.phone}</td>
                            <td>${customer.status}</td>
                            <td colspan="2">
                                <button class="btn btn-warning edit_customer" data-id="${customer.id}"><i class="bi bi-pencil"></i></button>
                                <button class="btn btn-danger delete_customer" data-id="${customer.id}"><i class="bi bi-trash"></i></button>
                            </td>
                        </tr>`);
                });
            }
        },
        error: function() {
            displayAlert("danger", "Error connecting to the Server");
        }
    });
}

function handleEditFormEvent() {
    $(document).on("click", ".edit_customer", function() {
        var customerId = $(this).data("id");
        var token = getToken();

        $.ajax({
            url: `${baseUrl}/customers/${customerId}`,
            type: 'GET',
            contentType: "application/json",
            dataType: 'json',
            headers: {
                "Authorization": `Bearer ${token}`
            },
            success: function(response) {
                if (response.data) {
                    populateForm(response.data);
                    showFormModal();
                } else {
                    hideFormModal();
                    displayAlert("danger", "Error, Resource not Found");
                }
            },
            error: function() {
                displayAlert("danger", "Error connecting to the Server");
            }
        });
    });
}

function handleAddNewFormEvent() {
    $("#addCustomer").click(function() {
        populateForm();
        showFormModal();
    });
}

function populateForm(data = {}) {

    var title_name = (data.id) ? `${data.first_name} ${data.last_name}` : "Add";
    $("#customer_modal_title").text(title_name);

    $("#customer_id").val(data.id || "");
    $("#first_name").val(data.first_name || "");
    $("#last_name").val(data.last_name || "");
    $("#email").val(data.email || "");
    $("#id_number").val(data.id_number || "");
    $("#date_of_birth").val(data.date_of_birth || "");
    $("#phone").val(data.phone || "");
    $("#status").val(data.status || "pending");
}

function handleAddEditFormSubmission() {
    $("#customer_form").validate({
        submitHandler: function(form) {

            var customer_id = form.customer_id.value;
            var json_string = serializeFormIntoJson(form);
            var postObj = getAddEditFormPostConfig(customer_id);

            var token = getToken();

            $.ajax({
                url: `${baseUrl}/${postObj.endpoint}`,
                type: postObj.method,
                contentType: "application/json",
                headers: {
                    "Authorization": `Bearer ${token}`
                },
                dataType: 'json',
                data: json_string,
                success: function(response) {
                    if (response.data) {
                        hideFormModal();
                        loadCustomers();
                    } else {
                        displayAlert("danger", "Error Saving Customer information");
                    }
                    hideFormModal();
                },
                error: function() {
                    displayAlert("danger", "Error connecting to the Server");
                }
            });
        }
    });
}

function handleDeleteEvent() {
    $(document).on("click", ".delete_customer", function() {

        var text = "Are you sure you want to Delete?";
        if (confirm(text) !== true) {
            return;
        }

        var customerId = $(this).data("id");
        var token = getToken();

        $.ajax({
            url: `${baseUrl}/customers/${customerId}`,
            type: 'DELETE',
            contentType: "application/json",
            dataType: 'json',
            headers: {
                "Authorization": `Bearer ${token}`
            },
            success: function(response) {
                loadCustomers();
            },
            error: function() {
                displayAlert("danger", "Error connecting to the Server");
            }
        });
    });
}

function handleLogoutEvent() {
    var token = localStorage.getItem('token');

    $("#logout").click(function(e) {
        $.ajax({
            url: `${baseUrl}/logout`,
            type: 'POST',
            contentType: "application/json",
            dataType: 'json',
            headers: {
                "Authorization": `Bearer ${token}`
            },
            success: function() {
                deleteToken();
                updateUI(null);
            },
            error: function(error) {
                displayAlert("danger", error.responseJSON.message);
            }
        });
    });
}

function serializeFormIntoJson(form) {
    var jsonObject = {};
    $.each(form, function(index, field) {
        if (field.name != "") {
            jsonObject[field.name] = field.value;
        }
    });
    return JSON.stringify(jsonObject);
}

function getAddEditFormPostConfig(customer_id) {
    var postObj = {};

    if (customer_id > 0) {
        postObj.endpoint = 'customers/' + customer_id;
        postObj.method = 'PUT';
    } else {
        postObj.endpoint = 'customers/' + customer_id;
        postObj.method = 'POST';
    }
    return postObj;
}

function updateUI(name) {
    if (name) {
        $("#login_page").hide();
        $("#auth_nav").removeClass("d-none");
        $("#welcome_user").text("Welcome, " + name);
        $("#customers_page").removeClass("d-none");
        $("#customer_form_modal").modal("hide");
    } else {
        $("#auth_nav").addClass("d-none");
        $("#login_page").show();
        $("#customers_list").empty();
        $("#customers_page").addClass("d-none");
        $("#customer_form_modal").modal("hide");
    }
}

function storeToken(token) {
    localStorage.setItem('token', token);
}

function getToken() {
    return localStorage.getItem('token');
}

function deleteToken() {
    localStorage.removeItem('token');
}

function showFormModal() {
    $("#customer_form_modal").modal("show");
}

function hideFormModal() {
    $("#customer_form_modal").modal("hide");
}

function displayAlert(alert_type, message) {
    $("#alert").removeClass('alert-success alert-danger alert-warning alert-info d-none');
    $("#alert").addClass(`alert-${alert_type}`);
    $("#alertMessage").text(message);
}