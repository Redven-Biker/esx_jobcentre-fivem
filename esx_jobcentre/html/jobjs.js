$(function () {
    function display(bool) {
        var item = event.data;

        if (bool) {
            $(".fullscreen").show();
        } else {
            $(".fullscreen").hide();
            

        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })

    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post(`http://esx_jobcentre/exit`, JSON.stringify({}));
            return
        }
    };


    $('#jobone').click(function(){
        _type = "jobone";
        $.post(`http://esx_jobcentre/jobone`, JSON.stringify({type : _type}));
        return
    });
    $('#jobtwo').click(function(){
        _type = "jobtwo";
        $.post(`http://esx_jobcentre/jobtwo`, JSON.stringify({type : _type}));
        return
    });
    $('#jobthree').click(function(){
        _type = "jobthree";
        $.post(`http://esx_jobcentre/jobthree`, JSON.stringify({type : _type}));
        return
    });
    $('#jobfour').click(function(){
        _type = "jobfour";
        $.post(`http://esx_jobcentre/jobfour`, JSON.stringify({type : _type}));
        return
    });
    $('#jobfive').click(function(){
        _type = "jobfive";
        $.post(`http://esx_jobcentre/jobfive`, JSON.stringify({type : _type}));
        return
    });
    $('#jobsix').click(function(){
        _type = "jobsix";
        $.post(`http://esx_jobcentre/jobsix`, JSON.stringify({type : _type}));
        return
    });
    $('#unemployed').click(function(){
        _type = "unemployed";
        $.post(`http://esx_jobcentre/unemployed`, JSON.stringify({type : _type}));
        return
    });

})


