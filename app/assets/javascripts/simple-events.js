function render_event(event_json){
    $template = $(".event-result-template");
    $new_result = $template.clone();
    $new_result.find('.event-start-time').text(event_json.start_time);
    $new_result.addClass('event-result').removeClass("event-result-template");
    $new_result.find('.event-name').text(event_json.name);
    if($(".event-result").length === 0){
        $("#sort").append($new_result.show());

    } else {
        $("#sort").append($new_result.show());
    }
}

//on page load
if ($("#callink-form").length > 0){
$.get("/api/callink/events",
 function(data, textStatus, jqXHR){
    if(data.events){
        $.each(data.events, function(i, event_json){
            render_event(event_json);
        })
        if(data.events.length === 0){
            $("#no-events-placeholder").show();
        } else {
            $("#no-events-placeholder").hide();
        }

    }
 }
)
}

//handle event search
$(document).ready(function(){
    $("#callink-form button").click(function(e){
        $(".event-result").remove();
        e.preventDefault();

        $.get("/api/callink/events", $("#callink-form").serialize(),
            function(data, textStatus, jqXHR){
            if(data.events){
                //$('#sort').tablesorter();
                //console.log("test");
                $.each(data.events, function(i, event_json){
                    render_event(event_json);
                });
                if(data.events.length === 0){
                        $("#no-events-placeholder").show();
                } else {
                        $("#no-events-placeholder").hide();

                }
            }
        });
    });
});

$(function(){
  //debugger
  //$('#sort').tablesorter(); 
});

$(function(){
  $('#hardcocde').tablesorter(); 
});
