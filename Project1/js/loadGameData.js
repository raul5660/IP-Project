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
            var tmp = 0;
            $(".form-inline #Submission").on('click', function (e) {
                var target = $(this).attr('data-target');
                var flag = $('#' + target + 'Submission').val();
                var DATA = "{'ChallengeID': '" + target + "', 'Flag': '"+flag+"'}";
                $.ajax({
                    type: "POST",
                    url: '../GameBoard/User.aspx/SubmitFlag',
                    data: DATA,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.d == 'true') {
                            $('#' + target + 'Submission').prop('disabled', true);
                            $('#' + target + 'Submission').parent().addClass("has-success");
                        } else {
                            $('#' + target + 'S').addClass("success")
                            $('#' + target + 'Submission').parent().addClass("has-error");
                        }
                    },
                    error: function (e) { },
                });
            });
        },
        error: function (e) {
            $("#MainContentHolder").append("Something Wrong.");
        }
    });
});

