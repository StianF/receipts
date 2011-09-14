// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){
  $("#add_line").click(function(){
    var number_of_rows = $("#line_table tbody>tr").length
    var new_line = "<tr id=\"receipt_receipt_lines_row_"+number_of_rows+"_id\">";
    new_line += "<td><input id=\"receipt_receipt_lines_attributes_"+number_of_rows+"_title\" type=\"text\" size=\"30\" name=\"receipt[receipt_lines_attributes]["+number_of_rows+"][title]\"></td>";
    new_line += "<td><input id=\"receipt_receipt_lines_attributes_"+number_of_rows+"_price\" type=\"text\" size=\"10\" name=\"receipt[receipt_lines_attributes]["+number_of_rows+"][price]\"></td>";
    new_line += "<td><input id=\"receipt_receipt_lines_attributes_"+number_of_rows+"_qty\" type=\"text\" size=\"5\" name=\"receipt[receipt_lines_attributes]["+number_of_rows+"][qty]\"></td>";
    new_line += "<td><a class=\"delete_line\" receipt_line_id=\""+number_of_rows+"\">Delete</a></td></tr>";
    $(new_line).appendTo("#line_table tbody");
    upDateDeleteLine();
    return false;
  });
});
$(document).ready(function(){
  $("#add_file").click(function(){
    var number_of_rows = $("#file_table tbody>tr").length 
    var new_file = "<tr id=\"receipt_receipt_files_row_"+number_of_rows+"_id\">";
    new_file += "<td><input id=\"receipt_receipt_files_attributes_"+number_of_rows+"_file\" type=\"file\" name=\"receipt[receipt_files_attributes]["+number_of_rows+"][file]\"></td>"
    new_file += "<td><a class=\"delete_file\" receipt_file_id=\""+number_of_rows+"\">Delete</a></td></tr>";
    $(new_file).appendTo("#file_table tbody");
    upDateDeleteFile();
    return false;
  });
});

function upDateDeleteLine(){
  $(".delete_line").click(function(event){
    var id = $(event.target).attr("receipt_line_id");
    $("#receipt_receipt_lines_row_"+id+"_id").remove();
    if($("#receipt_receipt_lines_attributes_"+id+"_id")){
      $("#receipt_receipt_lines_attributes_"+id+"_id").remove();
    }i
    return false;
  });
}
function upDateDeleteFile(){
  $(".delete_file").click(function(event){
    var id = $(event.target).attr("receipt_file_id");
    $("#receipt_receipt_files_row_"+id+"_id").remove();
    if($("#receipt_receipt_files_attributes_"+id+"_id")){
      $("#receipt_receipt_files_attributes_"+id+"_id").remove();
    }i
    return false;
  });
}
$(function(){
  $("#receipt_company_id").tokenInput("/companies.json", {
    crossDomain: false,
    prepopulate: $("#receipt_company_id").data("pre"),
    tokenLimit: 1
  });
});
$(document).ready(function(){
  upDateDeleteLine();
  upDateDeleteFile();
});
$(function(){
  $("#receipt_date").datepicker({dateFormat: 'yy-mm-dd'});
});
