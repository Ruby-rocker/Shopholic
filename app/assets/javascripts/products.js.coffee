# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  brands = $('#product_brand_id').html()
  $('#product_category_id').change ->
  category = $('#product_category_id :selected').text()
  escaped_category = category.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
  options = $(brands).filter("optgroup[label='#{escaped_category}']").html()
  if options
    $('#product_brand_id').html(options)
  else
    $('#product_brand_id').empty()