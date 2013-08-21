(function() {
  var _ref,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.GoogleImage = (function(_super) {
    __extends(GoogleImage, _super);

    function GoogleImage() {
      _ref = GoogleImage.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    GoogleImage.prototype.defaults = {
      url: '',
      directionalDegrees: '',
      coords: {},
      hardUrl: void 0
    };

    GoogleImage.prototype.url = function() {
      if (this.attributes.hardUrl != null) {
        console.log('showing hardURL');
        return this.attributes.hardUrl;
      } else {
        console.log('showing REGULAR');
        return ("http://maps.googleapis.com/maps/api/streetview?gid=" + this.cid + "&size=640x640&location=") + this.attributes.coords.lat + "," + this.attributes.coords.lng + "&heading=" + this.attributes.directionalDegrees + "&sensor=false&key=AIzaSyCyUdEWUkmZFkb1jmDjWi2UmZ345Rvb4sU";
      }
    };

    return GoogleImage;

  })(Backbone.Model);

}).call(this);
