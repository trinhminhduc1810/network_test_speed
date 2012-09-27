var startTime, endTime;
var downloadSize = 44198400 //bit


function timeout() {
    $.ajax({
        url: "/download_result",
        type: "get",
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        data: {
            gate_way: $('.gateway').text(),
            result_download: "Very slow speed or connection failed"
        },
        dataType: "script"
    });
}

function getCurrentTime() {
    return (new Date()).getTime();
}



function showResults() {
    endTime = getCurrentTime();
    var duration = (endTime - startTime)/1000;
    var result = (downloadSize/duration)/1000000;
    result = result.toFixed(2);
    $('.result').text(result+" mbps");
    $.ajax({
        url: "/download_result",
        type: "get",
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        data: {
            gate_way: $('.gateway').text(),
            result_download: $('.result').text()
        },
        dataType: "script"
    });
}


