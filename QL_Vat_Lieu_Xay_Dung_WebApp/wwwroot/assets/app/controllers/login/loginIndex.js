﻿var loginController = function () {
    this.initialize = function () {
        registerEvents();
    }

    var registerEvents = function () {
        $("#frmLogin").validate({
            errorClass: "red",
            ignore: [],
            lang: "vi",
            rules: {
                userName: {
                    required: true
                },
                password: {
                    required: true
                }
            }
        });
        $("#btnLogin").on("click", function (e) {
            if ($("#frmLogin").valid()) {
                e.preventDefault();
                var user = $("#txtUserName").val();
                var password = $("#txtPassword").val();
                login(user, password);
            }

        });
    }

    var login = function (user, pass) {
        $.ajax({
            url: "/Admin/Login/AuthenTask",
            data: {
                UserName: user,
                Password: pass
            },
            dataType:"json",
            type: "POST",
            success: function (res) {
                if (res.Success) {
                    window.location.href = "/Admin/Home/Index";
                }
                else {
                    app.notify(res.Message, "error");
                }
            }
        })
    }
}


