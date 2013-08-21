(function() {
  window.HomeView = Backbone.View.extend({
    template: "HomeView",
    events: {
      change: "onChange",
      "click .getDirections": "onGetDirections"
    },
    map: null,
    directionsRenderer: null,
    threeSixtyView: null,
    hardImages: ["http://maps.googleapis.com/maps/api/streetview?gid=c8&size=640x640&location=36.059090000000005,-112.14320000000001&heading=75&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c9&size=640x640&location=36.05923,-112.14279&heading=120&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c10&size=640x640&location=36.05926,-112.14271000000001&heading=120&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c11&size=640x640&location=36.05931,-112.14268000000001&heading=120&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c12&size=640x640&location=36.059340000000006,-112.14276000000001&heading=120&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c13&size=640x640&location=36.05933,-112.14295000000001&heading=100&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c14&size=640x640&location=36.05932,-112.14316000000001&heading=100&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c15&size=640x640&location=36.059340000000006,-112.14331000000001&heading=100&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c16&size=640x640&location=36.05935,-112.14359&heading=100&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c17&size=640x640&location=36.05932,-112.14385000000001&heading=100&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c18&size=640x640&location=36.059270000000005,-112.14401000000001&heading=76&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c19&size=640x640&location=36.05915,-112.14422&heading=76&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c20&size=640x640&location=36.05908,-112.14438000000001&heading=76&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c21&size=640x640&location=36.059050000000006,-112.14447000000001&heading=76&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c22&size=640x640&location=36.05901,-112.14457000000002&heading=76&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c23&size=640x640&location=36.05897,-112.14463&heading=76&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c24&size=640x640&location=36.05897,-112.14475000000002&heading=76&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c25&size=640x640&location=36.05892,-112.1449&heading=76&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c26&size=640x640&location=36.058980000000005,-112.14482000000001&heading=76&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c27&size=640x640&location=36.059050000000006,-112.14482000000001&heading=76&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c28&size=640x640&location=36.059110000000004,-112.14482000000001&heading=90&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c29&size=640x640&location=36.059200000000004,-112.14471&heading=180&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c30&size=640x640&location=36.05923,-112.14472&heading=185&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c30&size=640x640&location=36.05923,-112.14472&heading=185&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c31&size=640x640&location=36.059250000000006,-112.14479000000001&heading=185&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c32&size=640x640&location=36.059200000000004,-112.14489&heading=185&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c33&size=640x640&location=36.05915,-112.14499&heading=75&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c34&size=640x640&location=36.059140000000006,-112.14506000000002&heading=75&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c35&size=640x640&location=36.059140000000006,-112.14514000000001&heading=75&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c36&size=640x640&location=36.05917,-112.14514000000001&heading=75&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c37&size=640x640&location=36.059200000000004,-112.14510000000001&heading=40&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c38&size=640x640&location=36.05923,-112.14501000000001&heading=40&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c39&size=640x640&location=36.05928,-112.14495000000001&heading=40&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c40&size=640x640&location=36.05932,-112.1449&heading=40&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c41&size=640x640&location=36.05939,-112.14487000000001&heading=40&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c42&size=640x640&location=36.05944,-112.14482000000001&heading=100&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c43&size=640x640&location=36.059470000000005,-112.14477000000001&heading=100&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c44&size=640x640&location=36.059450000000005,-112.14463&heading=110&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c45&size=640x640&location=36.05941,-112.14453&heading=180&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c46&size=640x640&location=36.05944,-112.14449&heading=180&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c47&size=640x640&location=36.059490000000004,-112.14448000000002&heading=160&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c48&size=640x640&location=36.059520000000006,-112.14447000000001&heading=160&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c49&size=640x640&location=36.05955,-112.14449&heading=160&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c50&size=640x640&location=36.05959,-112.14453&heading=160&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c51&size=640x640&location=36.059650000000005,-112.14460000000001&heading=130&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c52&size=640x640&location=36.059670000000004,-112.14465000000001&heading=130&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c53&size=640x640&location=36.05971,-112.14470000000001&heading=130&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c54&size=640x640&location=36.05973,-112.14470000000001&heading=130&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c55&size=640x640&location=36.059740000000005,-112.14465000000001&heading=130&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c56&size=640x640&location=36.05973,-112.14458&heading=130&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c57&size=640x640&location=36.0597,-112.14449&heading=130&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c58&size=640x640&location=36.05966,-112.14443000000001&heading=130&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c59&size=640x640&location=36.059610000000006,-112.14434000000001&heading=130&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c60&size=640x640&location=36.059580000000004,-112.14428000000001&heading=130&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c61&size=640x640&location=36.05957,-112.14423000000001&heading=130&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c62&size=640x640&location=36.05959,-112.14420000000001&heading=150&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU", "http://maps.googleapis.com/maps/api/streetview?gid=c63&size=640x640&location=36.05959,-112.14415000000001&heading=75&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU"],
    onChange: function(event) {
      var change, target;
      console.log("HomeView.onChange( )");
      target = event.target;
      return change = {};
    },
    onGetDirections: function() {
      console.log("HomeView.onGetDirections( )");
      return this.getDirections(this.model.get("originAddress"), this.model.get("destinationAddress"));
    },
    onRoute: function(result, status) {
      console.log("HomeView.onRoute( " + result + ", " + status + ")");
      return this.renderRoute(result);
    },
    onFileSystemError: function(e) {
      var msg;
      msg = "";
      switch (e.code) {
        case FileError.QUOTA_EXCEEDED_ERR:
          msg = "QUOTA_EXCEEDED_ERR";
          break;
        case FileError.NOT_FOUND_ERR:
          msg = "NOT_FOUND_ERR";
          break;
        case FileError.SECURITY_ERR:
          msg = "SECURITY_ERR";
          break;
        case FileError.INVALID_MODIFICATION_ERR:
          msg = "INVALID_MODIFICATION_ERR";
          break;
        case FileError.INVALID_STATE_ERR:
          msg = "INVALID_STATE_ERR";
          break;
        default:
          msg = "Unknown Error";
      }
      return console.log("Error: " + msg);
    },
    onFileSystemInit: function(fs) {
      fs.root.getFile("images.txt", {
        create: true,
        exclusive: true
      }, (function(fileEntry) {}), this.onFileSystemError);
      return console.log("Opened file system: " + fs.name);
    },
    dataURItoBlob: function(dataURI, callback) {
      var ab, bb, byteString, i, ia, mimeString;
      byteString = atob(dataURI.split(",")[1]);
      mimeString = dataURI.split(",")[0].split(":")[1].split(";")[0];
      ab = new ArrayBuffer(byteString.length);
      ia = new Uint8Array(ab);
      i = 0;
      while (i < byteString.length) {
        ia[i] = byteString.charCodeAt(i);
        i++;
      }
      bb = new window.WebKitBlobBuilder();
      bb.append(ab);
      return bb.getBlob(mimeString);
    },
    getBase64Image: function(img) {
      var canvas, ctx, dataURL;
      canvas = document.createElement("canvas");
      canvas.width = img.width;
      canvas.height = img.height;
      ctx = canvas.getContext("2d");
      ctx.drawImage(img, 0, 0);
      dataURL = canvas.toDataURL("image/png");
      return dataURL.replace(/^data:image\/(png|jpg);base64,/, "");
    },
    initialize: function() {
      this.app = new window.AppModel();
      this.model.set({
        originAddress: "36.057333,-112.143586",
        destinationAddress: "36.065096,-112.137107"
      });
      return this.render();
    },
    getDirections: function(origin, destination) {
      var directionsService, request;
      request = {
        origin: origin,
        destination: destination,
        travelMode: google.maps.TravelMode.WALKING
      };
      directionsService = new google.maps.DirectionsService();
      return directionsService.route(request, $.proxy(this.onRoute, this));
    },
    render: function() {
      var that;
      that = this;
      $.get("/templates/" + this.template + ".html", function(template) {
        $(that.el).html(template);
        return that.initMap();
      });
      return this;
    },
    initMap: function() {
      var mapOptions;
      mapOptions = {
        center: new google.maps.LatLng(-34.397, 150.644),
        zoom: 8,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      };
      this.map = new google.maps.Map(document.getElementById("map_container"), mapOptions);
      this.directionsRenderer = new google.maps.DirectionsRenderer();
      this.directionsRenderer.setMap(this.map);
      return this.directionsRenderer.setPanel(document.getElementById("directions_container"));
    },
    renderRoute: function(result) {
      var googleImage, i, image, images, j, points, steps;
      this.directionsRenderer.setDirections(result);
      images = [];
      image = "";
      steps = result.routes[0].legs[0].steps;
      points = [];
      i = 0;
      while (i < steps.length) {
        points = google.maps.geometry.encoding.decodePath(steps[i].polyline.points);
        j = 0;
        while (j < points.length) {
          image = "http://maps.googleapis.com/maps/api/streetview?size=640x640&location=" + points[j].lat() + "," + points[j].lng() + "&heading=75&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU";
          images.unshift(image);
          googleImage = new window.GoogleImage();
          googleImage.attributes.hardUrl = this.hardImages[j];
          googleImage.attributes.url = image;
          googleImage.attributes.directionalDegrees = 75;
          googleImage.attributes.imageId = j;
          googleImage.attributes.coords = {
            'lat': points[j].lat(),
            'lng': points[j].lng()
          };
          this.app.addImage(googleImage);
          j++;
        }
        i++;
      }
      console.log(this.images);
      if (!this.threeSixtyView) {
        this.threeSixtyView = new ThreeSixtyView();
        console.log("@app.attributes.googleImages");
        console.log(this.app.attributes.googleImages);
        this.threeSixtyView.setImages(this.app.attributes.googleImages);
      }
      return $("#threesixty_container").html(this.threeSixtyView.el);
    }
  });

}).call(this);
