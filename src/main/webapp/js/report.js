$(document).ready(function () {

    $('#accountReportBtn').on('click', function () {
       var url = "/admin/report/account/" + $('#accountToReport').val() + "/" + $('#time').val();
       window.location.href = url;
    });

    $('#categoryReportBtn').on('click', function () {
        var url = "/admin/report/category/" + $('#categoryToReport').val() + "/" + $('#time').val();
        window.location.href = url;
    });


    $('#payerReportBtn').on('click', function () {
        var url = "/admin/report/payer/" + $('#payerToReport').val() + "/" + $('#time').val();
        window.location.href = url;
    });

});