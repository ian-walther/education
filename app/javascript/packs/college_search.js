import { Loader } from "@googlemaps/js-api-loader"

const loader = new Loader({
    apiKey: "AIzaSyB2GPa1A6kUVefnW6-JFjBmPT2WKZWRs2E", //TODO: this is hardcoded for simplicity but should come from an env var that comes from the back end
    version: "weekly"
})

let map;

$(document).ready(function() {
    $("#submit_college_name").click(function() {
        get_college_names();
    })
    $(document).keypress(function(e) {
       if(e.which == 13) {
           $("#submit_college_name").click();
       }
    });
    init_google_maps();
    disable_loading_spinner();
    $("#college_name").focus();
})

function college_search_name() {
    return $("#college_name").val();
}

function get_college_names() {
    enable_loading_spinner();
    $.ajax({
        type: "GET",
        url: "/college_search/college_list",
        data: {
            school_name: college_search_name()
        },
        success: function(data) {
            disable_loading_spinner();
            show_in_google_maps(data)
        }
    })
}

function init_google_maps() {
    loader.load().then(() => {
        map = new google.maps.Map(document.getElementById("map"), {
            center: { lat: 39.8097343, lng: -98.5556199 },
            zoom: 3,
        });
    });
}

function enable_loading_spinner() {
    $("#loading_spinner").show();
}

function disable_loading_spinner() {
    $("#loading_spinner").hide();
}

function show_in_google_maps(names_and_locations) {
    map = new google.maps.Map(document.getElementById("map"), {
        center: {lat: 39.8097343, lng: -98.5556199},
        zoom: 3,
    });

    const infoWindow = new google.maps.InfoWindow();
    const bounds = new google.maps.LatLngBounds();

    names_and_locations.forEach((element, i) => {
        let position = element.location;
        const marker = new google.maps.Marker({
            position,
            map,
            title: element.name,
            label: (i + 1).toString(),
            optimized: false
        });

        bounds.extend(marker.position)

        marker.addListener("click", () => {
            infoWindow.close();
            infoWindow.setContent(marker.getTitle());
            infoWindow.open(marker.getMap(), marker);
        })
    });
    map.fitBounds(bounds);
}
