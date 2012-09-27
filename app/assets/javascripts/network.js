var startTime, endTime;
var downloadSize = 44198400 //bit


function timeout() {
    $.ajax({
        url: "/send_result",
        type: "get",
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        data: {
            gate_way: $('.gateway').text(),
            result_network: "Very slow speed or connection failed"
        },
        dataType: "script"
    });
}



function showResults() {
    endTime = (new Date()).getTime();
    var duration = (endTime - startTime)/1000;
    var result = (downloadSize/duration)/1000000;
    result = result.toFixed(2);
    $('.result').text(result+" mbps");

    $.ajax({
        url: "/send_result",
        type: "get",
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        data: {
            gate_way: $('.gateway').text(),
            result_network: $('.result').text()
        },
        dataType: "script"
    });
}


