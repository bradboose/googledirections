window.HomeView = Backbone.View.extend(
  template: "HomeView"
  events:
    change: "onChange"
    "click .getDirections": "onGetDirections"

  map: null
  directionsRenderer: null
  threeSixtyView: null

  hardImages: ["http://maps.googleapis.com/maps/api/streetview?gid=c8&size=640x640&location=36.059090000000005,-112.14320000000001&heading=75&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c9&size=640x640&location=36.05923,-112.14279&heading=120&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c10&size=640x640&location=36.05926,-112.14271000000001&heading=120&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c11&size=640x640&location=36.05931,-112.14268000000001&heading=120&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c12&size=640x640&location=36.059340000000006,-112.14276000000001&heading=120&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c13&size=640x640&location=36.05933,-112.14295000000001&heading=100&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c14&size=640x640&location=36.05932,-112.14316000000001&heading=100&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c15&size=640x640&location=36.059340000000006,-112.14331000000001&heading=100&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c16&size=640x640&location=36.05935,-112.14359&heading=100&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c17&size=640x640&location=36.05932,-112.14385000000001&heading=100&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c18&size=640x640&location=36.059270000000005,-112.14401000000001&heading=76&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c19&size=640x640&location=36.05915,-112.14422&heading=76&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c20&size=640x640&location=36.05908,-112.14438000000001&heading=76&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c21&size=640x640&location=36.059050000000006,-112.14447000000001&heading=76&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c22&size=640x640&location=36.05901,-112.14457000000002&heading=76&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c23&size=640x640&location=36.05897,-112.14463&heading=76&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c24&size=640x640&location=36.05897,-112.14475000000002&heading=76&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c25&size=640x640&location=36.05892,-112.1449&heading=76&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c26&size=640x640&location=36.058980000000005,-112.14482000000001&heading=76&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c27&size=640x640&location=36.059050000000006,-112.14482000000001&heading=76&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c28&size=640x640&location=36.059110000000004,-112.14482000000001&heading=90&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c29&size=640x640&location=36.059200000000004,-112.14471&heading=180&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c30&size=640x640&location=36.05923,-112.14472&heading=185&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c30&size=640x640&location=36.05923,-112.14472&heading=185&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c31&size=640x640&location=36.059250000000006,-112.14479000000001&heading=185&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c32&size=640x640&location=36.059200000000004,-112.14489&heading=185&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c33&size=640x640&location=36.05915,-112.14499&heading=75&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c34&size=640x640&location=36.059140000000006,-112.14506000000002&heading=75&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c35&size=640x640&location=36.059140000000006,-112.14514000000001&heading=75&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c36&size=640x640&location=36.05917,-112.14514000000001&heading=75&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c37&size=640x640&location=36.059200000000004,-112.14510000000001&heading=40&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c38&size=640x640&location=36.05923,-112.14501000000001&heading=40&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c39&size=640x640&location=36.05928,-112.14495000000001&heading=40&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c40&size=640x640&location=36.05932,-112.1449&heading=40&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c41&size=640x640&location=36.05939,-112.14487000000001&heading=40&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c42&size=640x640&location=36.05944,-112.14482000000001&heading=100&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c43&size=640x640&location=36.059470000000005,-112.14477000000001&heading=100&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c44&size=640x640&location=36.059450000000005,-112.14463&heading=110&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c45&size=640x640&location=36.05941,-112.14453&heading=180&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c46&size=640x640&location=36.05944,-112.14449&heading=180&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c47&size=640x640&location=36.059490000000004,-112.14448000000002&heading=160&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c48&size=640x640&location=36.059520000000006,-112.14447000000001&heading=160&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c49&size=640x640&location=36.05955,-112.14449&heading=160&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c50&size=640x640&location=36.05959,-112.14453&heading=160&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c51&size=640x640&location=36.059650000000005,-112.14460000000001&heading=130&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c52&size=640x640&location=36.059670000000004,-112.14465000000001&heading=130&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c53&size=640x640&location=36.05971,-112.14470000000001&heading=130&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c54&size=640x640&location=36.05973,-112.14470000000001&heading=130&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c55&size=640x640&location=36.059740000000005,-112.14465000000001&heading=130&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c56&size=640x640&location=36.05973,-112.14458&heading=130&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c57&size=640x640&location=36.0597,-112.14449&heading=130&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c58&size=640x640&location=36.05966,-112.14443000000001&heading=130&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c59&size=640x640&location=36.059610000000006,-112.14434000000001&heading=130&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c60&size=640x640&location=36.059580000000004,-112.14428000000001&heading=130&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c61&size=640x640&location=36.05957,-112.14423000000001&heading=130&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c62&size=640x640&location=36.05959,-112.14420000000001&heading=150&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU","http://maps.googleapis.com/maps/api/streetview?gid=c63&size=640x640&location=36.05959,-112.14415000000001&heading=75&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU"];



  onChange: (event) ->
    console.log "HomeView.onChange( )"

    # Apply the change to the model
    target = event.target
    change = {}
    #change[target.name] = target.value
    #@model.set change
    #console.log target.name + ": " + target.value

  onGetDirections: ->
    console.log "HomeView.onGetDirections( )"
    @getDirections @model.get("originAddress"), @model.get("destinationAddress")

  onRoute: (result, status) ->
    console.log "HomeView.onRoute( " + result + ", " + status + ")"
    @renderRoute result

  onFileSystemError: (e) ->
    msg = ""
    switch e.code
      when FileError.QUOTA_EXCEEDED_ERR
        msg = "QUOTA_EXCEEDED_ERR"
      when FileError.NOT_FOUND_ERR
        msg = "NOT_FOUND_ERR"
      when FileError.SECURITY_ERR
        msg = "SECURITY_ERR"
      when FileError.INVALID_MODIFICATION_ERR
        msg = "INVALID_MODIFICATION_ERR"
      when FileError.INVALID_STATE_ERR
        msg = "INVALID_STATE_ERR"
      else
        msg = "Unknown Error"
    console.log "Error: " + msg

  onFileSystemInit: (fs) ->
    fs.root.getFile "images.txt",
      create: true
      exclusive: true
    , ((fileEntry) ->

    # fileEntry.isFile === true
    # fileEntry.name == 'log.txt'
    # fileEntry.fullPath == '/log.txt'
    ), @onFileSystemError
    console.log "Opened file system: " + fs.name

  dataURItoBlob: (dataURI, callback) ->

    # convert base64 to raw binary data held in a string
    # doesn't handle URLEncoded DataURIs
    byteString = atob(dataURI.split(",")[1])

    # separate out the mime component
    mimeString = dataURI.split(",")[0].split(":")[1].split(";")[0]

    # write the bytes of the string to an ArrayBuffer
    ab = new ArrayBuffer(byteString.length)
    ia = new Uint8Array(ab)
    i = 0

    while i < byteString.length
      ia[i] = byteString.charCodeAt(i)
      i++

    # write the ArrayBuffer to a blob, and you're done
    bb = new window.WebKitBlobBuilder() # or just BlobBuilder() if not using Chrome
    bb.append ab
    bb.getBlob mimeString

  getBase64Image: (img) ->

    # Create an empty canvas element
    canvas = document.createElement("canvas")
    canvas.width = img.width
    canvas.height = img.height

    # Copy the image contents to the canvas
    ctx = canvas.getContext("2d")
    ctx.drawImage img, 0, 0

    # Get the data-URL formatted image
    # Firefox supports PNG and JPEG. You could check img.src to
    # guess the original format, but be aware the using "image/jpg"
    # will re-encode the image.
    dataURL = canvas.toDataURL("image/png")
    dataURL.replace /^data:image\/(png|jpg);base64,/, ""

  initialize: ->

    @app = new window.AppModel()
    #alert @hardImages.length

    # var that = this;
    # $.getImageData({
    #   url: "http://farm4.static.flickr.com/3002/2758349058_ab6dc9cfdc_z.jpg",
    #   success: function(image){
    #     //console.log('success');
    #     //alert('success');
    #     image.crossOrigin = "Anonymous";
    #     console.log(image);

    #     var asdf = new Image();
    #     console.log(asdf);
    #window.requestFileSystem = window.requestFileSystem or window.webkitRequestFileSystem
    #window.requestFileSystem window.PERSISTANT, 5 * 1024 * 1024, @onFileSystemInit, @onFileSystemError #5MB

    #     // Set up the canvas
    #     var can = document.getElementsByTagName('canvas')[0];
    #     var ctx = can.getContext('2d');

    #     // Set the canvas width and heigh to the same as the image
    #     $(can).attr('width', image.width);
    #     $(can).attr('height', image.height);

    #     // Draw the image on to the canvas
    #     ctx.drawImage(image, 0, 0, image.width, image.height);

    #     // Get the image data
    #     var image_data = ctx.getImageData(0, 0,  image.width, image.height);

    #     console.log(image_data);

    #     var image_data_array = image_data.data;

    #     // Invert every pixel
    #     for (var i = 0, j = image_data_array.length; i < j; i+=4) {
    #       image_data_array[i] = 255 - image_data_array[i];
    #       image_data_array[i+1] = 255 - image_data_array[i+1];
    #       image_data_array[i+2] = 255 - image_data_array[i+2];
    #     }

    #     // Write the image data to the canvas
    #     ctx.putImageData(image_data, 0, 0);

    #   //   window.requestFileSystem(window.PERSISTENT, 1024*1024, function(fs){
    #    //    fs.root.getFile("image.png", {create:true}, function(fileEntry) {
    #    //        fileEntry.createWriter(function(fileWriter) {
    #    //            fileWriter.write(that.dataURItoBlob(can.toDataURL("image/png")));
    #    //        }, this.onFileSystemError);
    #    //    }, this.onFileSystemError);
    #     // }, this.onFileSystemError);

    #   },
    #   error: function(xhr, text_status){
    #     alert('error');
    #     console.log(xhr);
    #     // Handle your error here
    #   }
    # });

    # function onInitFs(fs) {
    #   console.log('Opened file system: ' + fs.name);
    # }
    # function errorHandler(fs) {
    #   console.log('Error opening file system');
    # }

    #Create image
    # var imageDownload = new Image();
    # imageDownload.src = 'https://sphotos-a.xx.fbcdn.net/hphotos-ash3/1151040_10103324431654235_1355183202_n.jpg';

    #data = this.getBase64Image(imageDownload);
    # /console.log(data);

    #originAddress: "36.059351,-112.143463",
    #   destinationAddress: "36.059282,-112.14287"
    @model.set
      originAddress: "36.057333,-112.143586"
      destinationAddress: "36.065096,-112.137107"

    @render()

  getDirections: (origin, destination) ->
    request =
      origin: origin
      destination: destination
      travelMode: google.maps.TravelMode.WALKING

    directionsService = new google.maps.DirectionsService()
    directionsService.route request, $.proxy(@onRoute, this)

  render: ->
    that = this
    $.get "/templates/" + @template + ".html", (template) ->
      $(that.el).html template
      that.initMap()

    this

  initMap: ->
    mapOptions =
      center: new google.maps.LatLng(-34.397, 150.644)
      zoom: 8
      mapTypeId: google.maps.MapTypeId.ROADMAP

    @map = new google.maps.Map(document.getElementById("map_container"), mapOptions)
    @directionsRenderer = new google.maps.DirectionsRenderer()
    @directionsRenderer.setMap @map
    @directionsRenderer.setPanel document.getElementById("directions_container")

  renderRoute: (result) ->
    @directionsRenderer.setDirections result
    images = []
    image = ""
    steps = result.routes[0].legs[0].steps
    points = []
    i = 0

    while i < steps.length
      points = google.maps.geometry.encoding.decodePath(steps[i].polyline.points)
      j = 0

      while j < points.length

        image = "http://maps.googleapis.com/maps/api/streetview?size=640x640&location=" + points[j].lat() + "," + points[j].lng() + "&heading=75&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU"
        images.unshift image

        #TODO: move to constructor
        googleImage = new window.GoogleImage()
        googleImage.attributes.hardUrl = @hardImages[j]
        googleImage.attributes.url = image
        googleImage.attributes.directionalDegrees = 75
        googleImage.attributes.imageId = j
        googleImage.attributes.coords =
          'lat': points[j].lat()
          'lng': points[j].lng()

        # add to image collection
        @app.addImage googleImage


        j++
      i++

    console.log @images
    unless @threeSixtyView
      @threeSixtyView = new ThreeSixtyView()
      console.log "@app.attributes.googleImages"
      console.log @app.attributes.googleImages
      @threeSixtyView.setImages @app.attributes.googleImages
    $("#threesixty_container").html @threeSixtyView.el
)
