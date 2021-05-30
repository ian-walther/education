$(document).ready(function() {
    $("#submit_college_name").click(function() {
        get_college_names();
    })
})

function college_search_name() {
    return $("#college_name").val();
}

function get_college_names() {
    console.log("this works");
    $.ajax({
        type: "GET",
        url: "/college_search/college_list",
        data: {
            school_name: college_search_name()
        },
        success: function(data) {
            console.log(data);
        }
    })
}
