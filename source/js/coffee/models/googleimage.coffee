#class window.GoogleImages extends Backbone.Collection
#  model: window.GoogleImage
#
#  initialize: ->
#    @logger = Logger.get 'Images'

class window.GoogleImage extends Backbone.Model
  defaults:
    url: ''
    directionalDegrees: ''
    coords: {}
    hardUrl: undefined

  url: ->
    if @attributes.hardUrl?
      console.log 'showing hardURL'
      return @attributes.hardUrl
    else
      console.log 'showing REGULAR'
      return "http://maps.googleapis.com/maps/api/streetview?gid=#{@cid}&size=640x640&location=" + @attributes.coords.lat + "," + @attributes.coords.lng + "&heading=" + @attributes.directionalDegrees + "&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU"

