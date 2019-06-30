document.addEventListener("DOMContentLoaded", function () {
    var sidebarHidden = document.querySelectorAll(".sidebarHidden");
    sidebarHidden.forEach(function (value) {
        value.style.display = "none";
    });

    var btnToHide = document.querySelectorAll('.dropdown-btn');
    console.log(btnToHide);

    btnToHide.forEach(function (e) {
        e.addEventListener('click', function () {
            if (this.nextElementSibling.style.display === "inline"){
                this.nextElementSibling.style.display = "none";
            } else {
                this.nextElementSibling.style.display = "inline";

            }
        })
    });
});
