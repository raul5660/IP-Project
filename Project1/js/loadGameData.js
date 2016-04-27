$(document).ready(function () {
    $.ajax({
        type: "POST",
        url: '../GameBoard/User.aspx/LoadGameData',
        data: "",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $("#MainContentHolder").append(data.d);
            $('.tab a').on('click', function (e) {

                e.preventDefault();

                $(this).parent().addClass('active');
                $(this).parent().siblings().removeClass('active');

                target = $(this).attr('href');

                $('.tab-content > div').not(target).hide();

                $(target).fadeIn(600);

            });
        },
        error: function (e) {
            $("#MainContentHolder").append("Something Wrong.");
        }
    });
});