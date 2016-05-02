function UsersByPoints() {
    $.ajax({
        type: "POST",
        url: '../GameBoard/Admin.aspx/GetTopTen',
        data: "",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var jsonObject = JSON.parse(data.d);
            var GraphData = [];
            for (var key in jsonObject) {
                if (key != undefined) {
                    GraphData.push({ label: key.toString(), y: jsonObject[key] });
                }
            }
            var chart = new CanvasJS.Chart("UsersbyPoints", {
                title: { text: "Top 10 Users" },
                data: [{
                    type: "column",
                    dataPoints: GraphData
                }]
            });
            chart.render();
        },
        error: function (e) { }
    });
}

$('.form').find('input, textarea').on('keyup blur focus', function (e) {

    var $this = $(this),
        label = $this.prev('label');

    if (e.type === 'keyup') {
        if ($this.val() === '') {
            label.removeClass('active highlight');
        } else {
            label.addClass('active highlight');
        }
    } else if (e.type === 'blur') {
        if ($this.val() === '') {
            label.removeClass('active highlight');
        } else {
            label.removeClass('highlight');
        }
    } else if (e.type === 'focus') {

        if ($this.val() === '') {
            label.removeClass('highlight');
        }
        else if ($this.val() !== '') {
            label.addClass('highlight');
        }
    }

});

$('.tab a').on('click', function (e) {

    e.preventDefault();

    $(this).parent().addClass('active');
    $(this).parent().siblings().removeClass('active');

    target = $(this).attr('href');

    $('.tab-content > div').not(target).hide();
    localStorage.setItem('show', target);

    $(target).fadeIn(600);

});

$("#LogoutButton").on('click', function (e) {
    localStorage.removeItem('show');
});