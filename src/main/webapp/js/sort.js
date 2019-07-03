$(document).ready(function () {

    $('#accountFiltrBtn').on('click', function() {
        var url = "/admin/transaction/bills/account/" + $('#accountFiltr').val();
        window.location.href = url;
    })

    $('#payerFiltrBtn').on('click', function () {
        var url = "/admin/transaction/bills/payer/" + $('#payerFiltr').val();
        window.location.href = url;
    })

    $('#plusOrMinusBtn').on('click', function () {
        var url = "/admin/transaction/bills/plusOrMinus/" + $('#plusOrMinusFiltr').val();
        window.location.href = url;
    })

});