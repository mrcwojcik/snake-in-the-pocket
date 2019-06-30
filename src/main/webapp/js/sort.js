$(document).ready(function () {

    $('#accountFiltrBtn').on('click', function() {
        // var value = $('#accountFiltr').options[$('#accountFiltr').selectedIndex].value;
        var url = "/admin/transaction/bills/account/" + $('#accountFiltr').val();
        window.location.href = url;
    })

    $('#payerFiltrBtn').on('click', function () {
        // var value = $('#payerFiltr').options[$('#payerFiltr').selectedIndex].value;
        var url = "/admin/transaction/bills/payer/" + $('#payerFiltr').val();
        window.location.href = url;
    })

});