require 'rubygems'
require 'mysql'
  $.ajax({
        type: "GET",
        url: "/local/data",
        data: { 'country_iso' : country_iso,  'region' : region,  'prefix' : prefix },
        success: function(data){
            window.location.href = '/local'
        }