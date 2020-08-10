var ImagesManagementAjax = function () {
    var images = [];

    this.initialize = function () {
        registerEvents();
    }

    function registerEvents() {
        $("body").on("click", ".btn-images", function (e) {
            e.preventDefault();
            var that = $(this).data("id");
            $("#hidId").val(that);
            loadImages();
            $("#modal-image-manage").modal("show");
        });
        $("body").on("click", ".btn-delete-image", function (e) {
            e.preventDefault();
            $(this).closest("div").remove();
        });
        $("#fileImage").on("change", function () {
            var fileUpload = $(this).get(0);
            var files = fileUpload.files;
            var data = new FormData();
            for (var i = 0; i < files.length; i++) {
                data.append(files[i].name, files[i]);
            }
            $.ajax({
                type: "POST",
                url: "/Admin/UploadImageFile/UploadImage",
                contentType: false,
                processData: false,
                data: data,
                success: function (path) {
                    images.push(path);
                    $("#image-list").append('<div class="col-md-3"><img width="100px"  data-path="' + path + '" src="' + path + '"></div>');
                    app.notify("Đã tải ảnh lên thành công!", "success");

                },
                error: function () {
                    app.notify("There was error uploading files!", "error");
                }
            });
        });

        $("#btnSaveImages").on("click", function () {
            var imageList = [];
            var tmp1 = $("#image-list").find("img");
            console.log("Test1 : " + tmp1);
            console.log("Test1 : " + tmp1.data);
            $.each($("#image-list").find("img"), function () {
                var tmp = $(this).data("path");
                console.log(tmp);
                imageList.push(tmp);
            });
            $.ajax({
                url: "/admin/Product/SaveImages",
                data: {
                    productId: $("#hidId").val(),
                    images: imageList
                },
                type: "post",
                dataType: "json",
                success: function () {
                    $("#modal-image-manage").modal("hide");
                    $("#image-list").html("");
                }
            });
        });
    }
    function loadImages() {
        $.ajax({
            url: "/admin/Product/GetImages",
            data: {
                productId: $("#hidId").val()
            },
            type: "get",
            dataType: "json",
            success: function (response) {
                var render = "";
                $.each(response, function (i, item) {
                    render += '<div class="col-md-3"><img width="100" data-path="' + item.Path + '" src="' + item.Path +
                        '"><br/><a href="#" class="btn-delete-image">Xóa</a></div>';
                });
                $("#image-list").html(render);
            }
        });
    }
}