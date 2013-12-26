$ ->
  $("#user_addresses_attributes_0_country").change ->
    if $(this).val() is ""
      $("#user_addresses_attributes_0_state").html $("<option>No state provided for your country</option>")
    else
      $.ajax
        type: "GET"
        url: "/addresses/state_options/?parent_region=" + encodeURIComponent($(this).val())
        success: (data) ->
          if data.content is "None" #handle the case where no state related to country selected
            $("#user_addresses_attributes_0_state").empty()
            $("#user_addresses_attributes_0_state").append $("<option value='' disabled selected>No state provided for your country</option>")
          else
            $("#user_addresses_attributes_0_state").empty()
            $("#user_addresses_attributes_0_state").append $("<option value='' disabled selected>Select your State</option>")
            jQuery.each data, (i, v) ->
              $("#user_addresses_attributes_0_state").append $("<option value=\"" + data[i][1] + "\">" + data[i][0] + "</option>")
