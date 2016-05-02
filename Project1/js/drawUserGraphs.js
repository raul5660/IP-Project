function UsersProgress() {
    $.ajax({
        type: "POST",
        url: '../GameBoard/User.aspx/GetUsersProgress',
        data: "",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var solveCount = 0;
            var totalChallenges = 0;
            var jsonObject = JSON.parse(data.d);
            var GraphData = [];
            for (var key in jsonObject) {
                switch (key) {
                    case "solved":
                        solveCount = jsonObject[key];
                        break;
                    case "total":
                        totalChallenges = jsonObject[key];
                        break;
                }
            }
            var percentage = (solveCount / totalChallenges) * 100;
            for(var x = 0; x < percentage; x++){
                $("#TotalSolved").attr("aria-valuenow", x);
                $("#TotalSolved").width(x + '%');
                $("#TotalSolved").html(x + '%');
            }
        },
        error: function (e) { }
    });
}

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