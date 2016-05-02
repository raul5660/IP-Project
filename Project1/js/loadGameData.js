$(document).ready(function () {
    UsersProgress();
    UsersByPoints();
    var x = 0;
    $("#MainSideNavBar a").each(function (index) {
        $.ajax({
            type: "POST",
            url: '../GameBoard/User.aspx/LoadGameData',
            data: "{'GameID': '" + $(this).attr("href") + "'}",
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
                    localStorage.setItem('show', target);

                    $(target).fadeIn(600);

                });
                var show = localStorage.getItem('show');
                if (show && x == 0) {
                    $('#Dashboard').fadeOut(500);
                    $(show).fadeIn(500);
                    x++;
                }
                $(".form-inline #Submission").on('click', function (e) {
                    var target = $(this).attr('data-target');
                    var flag = $('#' + target + 'Submission').val();
                    var DATA = "{'ChallengeID': '" + target + "', 'Flag': '" + flag + "'}";
                    $.ajax({
                        type: "POST",
                        url: '../GameBoard/User.aspx/SubmitFlag',
                        data: DATA,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            if (data.d == 'true') {
                                $('#' + target + 'S').addClass("success")
                                $('#' + target + 'Submission').prop('disabled', true);
                                $('#' + target + 'Submission').parent().addClass("has-success");
                                UsersProgress();
                                UsersByPoints();
                            } else {
                                $('#' + target + 'Submission').parent().addClass("has-error");
                            }
                        },
                        error: function (e) {
                            $('#' + target + 'Submission').parent().addClass("has-error");
                        },
                    });
                });
            },
            error: function (e) {
                $("#MainContentHolder").append("Something Wrong.");
            }
        });
    });
});