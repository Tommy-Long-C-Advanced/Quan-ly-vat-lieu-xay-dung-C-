var function_ajax = function () {
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
                txtId:{required: true},
                txtURL:{required: true},
                txtName: { required: true },
                txtOrder: { number: true }
            }
        });
        $("#btnCreate").off("click").on("click", function() {
                resetFormMaintainance();
                initTreeDropDownCategory();
                $("#modal-add-edit").modal("show");
            });
        $("body").on("click", "#btnEdit", function (e) {
            $("#txtId").prop("readonly", true);
            e.preventDefault();
            $.ajax({
                type: "GET",
                url: "/Admin/Function/GetById",
                data: { id:  $("#txtId").val() },
                dataType: "json",
                beforeSend: function () {
                    app.startLoading();
                },
                success: function (response) {
                    var data = response;
                    $("#txtId").val(data.Id);

                    $("#txtName").val(data.Name);
                    $("#txtURL").val(data.URL);
                    //Load FunctionCategory
                    initTreeDropDownCategory(data.ParentId);

                    $("#txtIconCss").val(data.IconCss);

                    $("#ckStatus").prop("checked", data.Status === 1);

                    $("#txtOrder").val(data.SortOrder);

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
            var that = $("#txtId").val();
            app.confirm("Are you sure to delete?", function () {
                $.ajax({
                    type: "POST",
                    url: "/Admin/Function/Delete",
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
                var id = $("#txtId").val();
                var name = $("#txtName").val();
                var url = $("#txtURL").val();
                var parentId = $("#ddlCategoryId").combotree("getValue");

                var iconCss = $("#txtIconCss").val();

                var order = parseInt($("#txtOrder").val());

                var status = $("#ckStatus").prop("checked") === true ? 1 : 0;

                $.ajax({
                    type: "POST",
                    url: "/Admin/Function/SaveEntity",
                    data: {
                        Id: id,
                        Name: name,
                        URL: url,
                        ParentId: parentId,
                        IconCss: iconCss,
                        SortOrder: order,
                        Status: status
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
    }


    function resetFormMaintainance() {
        $("#txtId").prop("readonly", false);
        $("#txtId").val("");

        $("#txtName").val("");
        $("#txtURL").val("");
        //Load ProductCategory
        initTreeDropDownCategory("");

        $("#txtIconCss").val("");

        $("#ckStatus").prop("checked", true);

        $("#txtOrder").val("");
    }

    function initTreeDropDownCategory(selectedId) {
        $.ajax({
            url: "/Admin/Function/GetAll",
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
                $("#ddlCategoryId").combotree({
                    data: arr
                });
                if (selectedId != undefined) {
                    $("#ddlCategoryId").combotree("setValue", selectedId);
                }
            }
        });
    }




    function loadData() {
        $.ajax({
            url: "/Admin/Function/GetAll",
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
                $("#treeFunction").tree({
                    data: treeArr,
                    dnd: true,
                    onContextMenu: function(e,node) {
                        e.preventDefault();
                        // chọn node
                        $("#txtId").val(node.id);
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
                                url: "/Admin/Function/UpdateParentId",
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
                                url: "/Admin/Function/ReOrder",
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
                app.notify("Không thể tải danh mục funtion", "error");
            }
        });
    }
}