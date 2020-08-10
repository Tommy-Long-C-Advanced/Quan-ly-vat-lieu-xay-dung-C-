var productCategoryController = function () {
    this.initialize = function () {
        loadData();
        registerEvents();
    }
    function registerEvents() {
        $("#frmMaintainance").validate({
            errorClass: "red",
            ignore: [],
            lang: "vi",
            rules: {
                txtNameM: { required: true },
                txtOrderM: { number: true },
                txtHomeOrderM: { number: true }
            }
        });
        $("#btnCreate").off("click").on("click", function() {
                resetFormMaintainance();
                initTreeDropDownCategory();
                $("#modal-add-edit").modal("show");
            });
        $("body").on("click", "#btnEdit", function (e) {
            e.preventDefault();
            var dataHideInput = $("#hidId").val();
            $.ajax({
                type: "GET",
                url: "/Admin/ProductCategory/GetById",
                data: { id: dataHideInput },
                dataType: "json",
                beforeSend: function () {
                    app.startLoading();
                },
                success: function (response) {
                    var data = response;
                    $("#hidId").val(data.Id);
                    $("#txtName").val(data.Name);
                    //Load ProductCategory
                    initTreeDropDownCategory(data.ParentId);

                    $("#txtImage").val(data.Image);

                    $("#txtSeoKeyword").val(data.SeoKeywords);
                    $("#txtSeoDescription").val(data.SeoDescription);
                    $("#txtSeoPageTitle").val(data.SeoPageTitle);
                    $("#txtSeoAlias").val(data.SeoAlias);

                    $("#ckStatus").prop("checked", data.Status === 1);
                    $("#ckShowHome").prop("checked", data.HomeFlag);
                    $("#txtOrder").val(data.SortOrder);
                    $("#txtHomeOrder").val(data.HomeOrder);

                    $("#modal-add-edit").modal("show");
                    app.stopLoading();

                },
                error: function (status) {
                    app.notify("Có lỗi xảy ra", "error");
                    app.stopLoading();
                }
            });
        });
        $("body").on("click", "#btnDelete", function (e) {
            e.preventDefault();
            var that = $("#hidIdM").val();
            app.confirm("Are you sure to delete?", function () {
                $.ajax({
                    type: "POST",
                    url: "/Admin/ProductCategory/Delete",
                    data: { id: that },
                    dataType: "json",
                    beforeSend: function () {
                        app.startLoading();
                    },
                    success: function (response) {
                        app.notify("Xóa thành công", "success");
                        app.stopLoading();
                        loadData();
                    },
                    error: function (status) {
                        app.notify("Có lỗi trong quá trình xóa", "error");
                        app.stopLoading();
                    }
                });
            });
        });
        $("#btnSave").on("click", function (e) {
            if ($("#frmMaintainance").valid()) {
                e.preventDefault();
                var id = parseInt($("#hidId").val());
                var name = $("#txtName").val();
                var parentId = $("#ddlCategoryId").combotree("getValue");
                var description = $("#txtDesc").val();

                var image = $("#txtImage").val();
                var order = parseInt($("#txtOrder").val());
                var homeOrder = $("#txtHomeOrder").val();

                var seoKeyword = $("#txtSeoKeyword").val();
                var seoMetaDescription = $("#txtSeoDescription").val();
                var seoPageTitle = $("#txtSeoPageTitle").val();
                var seoAlias = $("#txtSeoAlias").val();
                var status = $("#ckStatus").prop("checked") == true ? 1 : 0;
                var showHome = $("#ckShowHome").prop("checked");

                $.ajax({
                    type: "POST",
                    url: "/Admin/ProductCategory/SaveEntity",
                    data: {
                        Id: id,
                        Name: name,
                        Description: description,
                        ParentId: parentId,
                        HomeOrder: homeOrder,
                        SortOrder: order,
                        HomeFlag: showHome,
                        Image: image,
                        Status: status,
                        SeoPageTitle: seoPageTitle,
                        SeoAlias: seoAlias,
                        SeoKeywords: seoKeyword,
                        SeoDescription: seoMetaDescription
                    },
                    dataType: "json",
                    beforeSend: function () {
                        app.startLoading();
                    },
                    success: function (response) {
                        app.notify("Cập nhật thành công", "success");
                        $("#modal-add-edit").modal("hide");

                        resetFormMaintainance();

                        app.stopLoading();
                        loadData(true);
                    },
                    error: function () {
                        app.notify("Có lỗi trong quá trình cập nhật", "error");
                        app.stopLoading();
                    }
                });
            }
            return false;

        });
        $("#btnSelectImg").on("click", function () {
            $("#fileInputImage").click();
        });
        $("#fileInputImage").on("change", function () {
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
                    $("#txtImage").val(path);
                    app.notify("Tải ảnh lên thành công", "success");

                },
                error: function () {
                    app.notify("Có lỗi trong quá trình tải ảnh!", "error");
                }
            });
        });
    }


    function resetFormMaintainance() {
        $("#hidId").val(0);
        $("#txtName").val("");
        initTreeDropDownCategory("");

        $("#txtDesc").val("");
        $("#txtOrder").val("");
        $("#txtHomeOrder").val("");
        $("#txtImage").val("");

        $("#txtMetakeyword").val("");
        $("#txtMetaDescription").val("");
        $("#txtSeoPageTitle").val("");
        $("#txtSeoAlias").val("");

        $("#ckStatus").prop("checked", true);
        $("#ckShowHome").prop("checked", false);
    }
    function initTreeDropDownCategory(selectedId) {
        $.ajax({
            url: "/Admin/ProductCategory/GetAll",
            type: "GET",
            dataType: "json",
            async: false,
            success: function (response) {
                var data = [];
                $.each(response, function (i, item) {
                    data.push({
                        id: item.Id,
                        text: item.Name,
                        parentId: item.ParentId,
                        sortOrder: item.SortOrder
                    });
                });
                var arr = app.unflattern(data);
                $("#ddlCategoryIdM").combotree({
                    data: arr
                });
                if (selectedId != undefined) {
                    $("#ddlCategoryIdM").combotree("setValue", selectedId);
                }
            }
        });
    }




    function loadData() {
        $.ajax({
            url: "/Admin/ProductCategory/GetAll",
            dataType: "json",
            success: function (response) {
                var data = [];
                $.each(response, function (i, item) {
                    data.push({
                        id: item.Id,
                        text: item.Name,
                        parentId: item.ParentId,
                        sortOrder: item.SortOrder
                    });
                });
                var treeArr = app.unflattern(data);
                treeArr.sort(function(a, b) {
                    return a.sortOrder - b.sortOrder;
                });
                $("#treeProductCategory").tree({
                    data: treeArr,
                    dnd: true,
                    onContextMenu: function(e,node) {
                        e.preventDefault();
                        // chọn node
                        $("#hidIdM").val(node.id);
                        // hiển thị context menu
                        $("#contextMenu").menu("show",
                        {
                            left: e.pageX,
                            top: e.pageY
                        });
                    },
                    onDrop: function(target, source, point) {
                        var targetNode = $(this).tree("getNode", target);
                        if (point === "append") {
                            var children = [];
                            $.each(targetNode.children, function (indexInArray, valueOfElement) {
                                children.push({
                                    key: valueOfElement.id,
                                    value: indexInArray
                                });
                            });
                            $.ajax({
                                type: "POST",
                                url: "/Admin/ProductCategory/UpdateParentId",
                                data: {
                                    sourceId: source.id,
                                    targetId: targetNode.id,
                                    items: children
                                },
                                dataType: "json",
                                success: function () {
                                    loadData();
                                }
                            });
                        } else if(point === "top" || point === "bottom") {
                            $.ajax({
                                type: "POST",
                                url: "/Admin/ProductCategory/ReOrder",
                                data: {
                                    sourceId: source.id,
                                    targetId: targetNode.id
                                },
                                dataType: "json",
                                success: function () {
                                    loadData();
                                }
                            });
                        }
                    }

                });

            },error: function(response) {
                console.log(response);
                app.notify("Không thể tải danh mục", "error");
            }
        });
    }
}