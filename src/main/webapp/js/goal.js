$(document).ready(function () {

    $('#timeGoalBtn').on('click', function (event) {
        event.preventDefault()
        $('#timeQuestion').css('display', 'block');
    });

    $('#contributionBtn').on('click', function (event) {
        event.preventDefault();
        $('#contributionQuestion').css('display', 'block');
    })

});