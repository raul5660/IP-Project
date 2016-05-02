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