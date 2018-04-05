function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var orgAddress = document.getElementById('custom-id');

    if (orgAddress) {
      var autocomplete = new google.maps.places.Autocomplete(orgAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(orgAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
