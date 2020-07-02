/*
import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uri/uri.dart';
///This API Key will be used for both the interactive maps as well as the static maps.
///Make sure that you have enabled the following APIs in the Google API Console (https://console.developers.google.com/apis)
/// - Static Maps API
/// - Android Maps API
/// - iOS Maps API
const API_KEY = "AIzaSyCLQTG59usHzrIRrkQwmb8Pzu80Mqsa7ho";



class MyAppe extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyAppe> {
  MapView mapView = new MapView();
  CameraPosition cameraPosition;
  var compositeSubscription = new CompositeSubscription();
  var staticMapProvider = new StaticMapProvider(API_KEY);
  Uri staticMapUri;

  //Marker bubble
  List<Marker> _markers = <Marker>[
    new Marker(
      "1",
      "Something fragile!",
      45.52480841512737,
      -122.66201455146073,
      color: Colors.blue,
      draggable: true, //Allows the user to move the marker.
      markerIcon: new MarkerIcon(
        "images/flower_vase.png",
        width: 112.0,
        height: 75.0,
      ),
    ),
  ];

  //Line
  List<Polyline> _lines = <Polyline>[
    new Polyline(
        "11",
        <Location>[
          new Location(45.52309483308097, -122.67339684069155),
          new Location(45.52298442915803, -122.66339991241693),
        ],
        width: 15.0,
        color: Colors.blue),
  ];

  //Drawing
  List<Polygon> _polygons = <Polygon>[
    new Polygon(
        "111",
        <Location>[
          new Location(45.5231233, -122.6733130),
          new Location(45.5231195, -122.6706147),
          new Location(45.5231120, -122.6677823),
          new Location(45.5230894, -122.6670957),
          new Location(45.5230518, -122.6660979),
          new Location(45.5230518, -122.6655185),
          new Location(45.5232849, -122.6652074),
          new Location(45.5230443, -122.6649070),
          new Location(45.5230443, -122.6644135),
          new Location(45.5230518, -122.6639414),
          new Location(45.5231195, -122.6638663),
          new Location(45.5231947, -122.6638770),
          new Location(45.5233074, -122.6639950),
          new Location(45.5232698, -122.6643813),
          new Location(45.5235480, -122.6644349),
          new Location(45.5244349, -122.6645529),
          new Location(45.5245928, -122.6639628),
          new Location(45.5248108, -122.6632762),
          new Location(45.5249385, -122.6626861),
          new Location(45.5249310, -122.6622677),
          new Location(45.5250212, -122.6621926),
          new Location(45.5251490, -122.6621711),
          new Location(45.5251791, -122.6623106),
          new Location(45.5252242, -122.6625681),
          new Location(45.5251791, -122.6632118),
          new Location(45.5249010, -122.6640165),
          new Location(45.5247431, -122.6646388),
          new Location(45.5249611, -122.6646602),
          new Location(45.5253820, -122.6642525),
          new Location(45.5260811, -122.6642525),
          new Location(45.5260435, -122.6637161),
          new Location(45.5261713, -122.6635551),
          new Location(45.5263066, -122.6634800),
          new Location(45.5265471, -122.6635873),
          new Location(45.5269003, -122.6639628),
          new Location(45.5270356, -122.6642632),
          new Location(45.5271484, -122.6646602),
          new Location(45.5274866, -122.6649177),
          new Location(45.5271258, -122.6651645),
          new Location(45.5269605, -122.6653790),
          new Location(45.5267049, -122.6654434),
          new Location(45.5262990, -122.6657224),
          new Location(45.5261337, -122.6666021),
          new Location(45.5256677, -122.6678467),
          new Location(45.5245777, -122.6687801),
          new Location(45.5236908, -122.6690161),
          new Location(45.5233751, -122.6692307),
          new Location(45.5233826, -122.6714945),
          new Location(45.5233337, -122.6729804),
          new Location(45.5233225, -122.6732969),
          new Location(45.5232398, -122.6733506),
          new Location(45.5231233, -122.6733130),
        ],
        strokeWidth: 5.0,
        strokeColor: Colors.red,
        fillColor: Color.fromARGB(75, 255, 0, 0)),
  ];

  @override
  initState() {
    super.initState();
    cameraPosition = new CameraPosition(Locations.portland, 2.0);
    staticMapUri = staticMapProvider.getStaticUri(Locations.portland, 12,
        width: 900, height: 400,);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text('Map View Example'),
          ),
          body: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Container(
                height: 250.0,
                child: new Stack(
                  children: <Widget>[
                    new Center(
                        child: new Container(
                          child: new Text(
                            "You are supposed to see a map here.\n\nAPI Key is not valid.\n\n"
                                "To view maps in the example application set the "
                                "API_KEY variable in example/lib/main.dart. "
                                "\n\nIf you have set an API Key but you still see this text "
                                "make sure you have enabled all of the correct APIs "
                                "in the Google API Console. See README for more detail.",
                            textAlign: TextAlign.center,
                          ),
                          padding: const EdgeInsets.all(20.0),
                        )),
                    new InkWell(
                      child: new Center(
                        child: new Image.network(staticMapUri.toString()),
                      ),
                      onTap: showMap,
                    )
                  ],
                ),
              ),
              new Container(
                padding: new EdgeInsets.only(top: 10.0),
                child: new Text(
                  "Tap the map to interact",
                  style: new TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              new Container(
                padding: new EdgeInsets.only(top: 25.0),
                child:
                new Text("Camera Position: \n\nLat: ${cameraPosition.center
                    .latitude}\n\nLng:${cameraPosition.center
                    .longitude}\n\nZoom: ${cameraPosition.zoom}"),
              ),
            ],
          )),
    );
  }

  showMap() {
    mapView.show(
        new MapOptions(
            mapViewType: MapViewType.normal,
            showUserLocation: true,
            showMyLocationButton: true,
            showCompassButton: true,
            initialCameraPosition: new CameraPosition(
                new Location(45.526607443935724, -122.66731660813093), 15.0),
            hideToolbar: false,
            title: "Recently Visited"),
        toolbarActions: [new ToolbarAction("Close", 1)]);
    StreamSubscription sub = mapView.onMapReady.listen((_) {
      mapView.setMarkers(_markers);
      mapView.setPolylines(_lines);
      mapView.setPolygons(_polygons);
    });
    compositeSubscription.add(sub);
    sub = mapView.onLocationUpdated.listen((location) {
      print("Location updated $location");
    });
    compositeSubscription.add(sub);
    sub = mapView.onTouchAnnotation
        .listen((annotation) => print("annotation ${annotation.id} tapped"));
    compositeSubscription.add(sub);
    sub = mapView.onTouchPolyline
        .listen((polyline) => print("polyline ${polyline.id} tapped"));
    compositeSubscription.add(sub);
    sub = mapView.onTouchPolygon
        .listen((polygon) => print("polygon ${polygon.id} tapped"));
    compositeSubscription.add(sub);
    sub = mapView.onMapTapped
        .listen((location) => print("Touched location $location"));
    compositeSubscription.add(sub);
    sub = mapView.onMapLongTapped
        .listen((location) => print("Long tapped location $location"));
    compositeSubscription.add(sub);
    sub = mapView.onCameraChanged.listen((cameraPosition) =>
        this.setState(() => this.cameraPosition = cameraPosition));
    compositeSubscription.add(sub);
    sub = mapView.onAnnotationDragStart.listen((markerMap) {
      var marker = markerMap.keys.first;
      print("Annotation ${marker.id} dragging started");
    });
    sub = mapView.onAnnotationDragEnd.listen((markerMap) {
      var marker = markerMap.keys.first;
      print("Annotation ${marker.id} dragging ended");
    });
    sub = mapView.onAnnotationDrag.listen((markerMap) {
      var marker = markerMap.keys.first;
      var location = markerMap[marker];
      print("Annotation ${marker.id} moved to ${location.latitude} , ${location
          .longitude}");
    });
    compositeSubscription.add(sub);
    sub = mapView.onToolbarAction.listen((id) {
      print("Toolbar button id = $id");
      if (id == 1) {
        _handleDismiss();
      }
    });
    compositeSubscription.add(sub);
    sub = mapView.onInfoWindowTapped.listen((marker) {
      print("Info Window Tapped for ${marker.title}");
    });
    compositeSubscription.add(sub);
    sub = mapView.onIndoorBuildingActivated.listen(
            (indoorBuilding) => print("Activated indoor building $indoorBuilding"));
    compositeSubscription.add(sub);
    sub = mapView.onIndoorLevelActivated.listen(
            (indoorLevel) => print("Activated indoor level $indoorLevel"));
    compositeSubscription.add(sub);
  }

  _handleDismiss() async {
    double zoomLevel = await mapView.zoomLevel;
    Location centerLocation = await mapView.centerLocation;
    List<Marker> visibleAnnotations = await mapView.visibleAnnotations;
    List<Polyline> visibleLines = await mapView.visiblePolyLines;
    List<Polygon> visiblePolygons = await mapView.visiblePolygons;
    print("Zoom Level: $zoomLevel");
    print("Center: $centerLocation");
    print("Visible Annotation Count: ${visibleAnnotations.length}");
    print("Visible Polylines Count: ${visibleLines.length}");
    print("Visible Polygons Count: ${visiblePolygons.length}");
    var uri = await staticMapProvider.getImageUriFromMap(mapView,
        width: 900, height: 400);
    setState(() => staticMapUri = uri);
    mapView.dismiss();
    compositeSubscription.cancel();
  }
}

class CompositeSubscription {
  Set<StreamSubscription> _subscriptions = new Set();

  void cancel() {
    for (var n in this._subscriptions) {
      n.cancel();
    }
    this._subscriptions = new Set();
  }

  void add(StreamSubscription subscription) {
    this._subscriptions.add(subscription);
  }

  void addAll(Iterable<StreamSubscription> subs) {
    _subscriptions.addAll(subs);
  }

  bool remove(StreamSubscription subscription) {
    return this._subscriptions.remove(subscription);
  }

  bool contains(StreamSubscription subscription) {
    return this._subscriptions.contains(subscription);
  }

  List<StreamSubscription> toList() {
    return this._subscriptions.toList();
  }
}
class CameraPosition {
  final Location center;
  final double zoom;
  final double bearing;
  final double tilt;

  const CameraPosition(this.center, this.zoom,
      {this.bearing = 0.0, this.tilt = 0.0});

  factory CameraPosition.fromMap(Map map) {
    return new CameraPosition(new Location.fromMap(map), map["zoom"],
        bearing: map["bearing"], tilt: map["tilt"]);
  }

  Map toMap() {
    Map map = center.toMap();
    map["zoom"] = zoom;
    map["bearing"] = bearing;
    map["tilt"] = tilt;
    return map;
  }
}
class Location {
  final double latitude;
  final double longitude;

  /// Time in milliseconds
  final int time;

  /// Altitude in meters.
  ///
  /// Read platform specification for this value.
  final double altitude;

  /// Speed in meters per second
  final double speed;

  /// Bearing value in a range from 0.0 to 360.0.
  ///
  /// This value is called "course" in the iOS platform. Check the CLLocation class reference for more info.
  ///
  /// This is not the device orientation. For more info, read each platform documentation regarding this value.
  final double bearing;

  /// Horizontal accuracy in meters
  ///
  /// Read platform specification for this value.
  final double horizontalAccuracy;

  /// Vertical accuracy in meters.
  ///
  /// Read platform specification for this value.
  /// In Android is required API 26 onwards.
  final double verticalAccuracy;

  const Location(latitude, longitude)
      : latitude = latitude,
        longitude = longitude,
        time = 0,
        altitude = 0.0,
        speed = 0.0,
        bearing = 0.0,
        horizontalAccuracy = 0.0,
        verticalAccuracy = 0.0;

  Location.full(this.latitude, this.longitude, this.time, this.altitude,
      this.speed, this.bearing, this.horizontalAccuracy, this.verticalAccuracy);

  factory Location.fromMap(Map map) {
    return new Location(map["latitude"], map["longitude"]);
  }

  factory Location.fromMapFull(Map map) {
    return new Location.full(
      map["latitude"],
      map["longitude"],
      map["time"],
      map["altitude"],
      map["speed"],
      map["bearing"],
      map["horizontalAccuracy"],
      map["verticalAccuracy"],
    );
  }

  static List<Map<String, dynamic>> listToMap(List<Location> list) {
    List<Map<String, dynamic>> result = [];
    for (var element in list) {
      result.add(element.toMap());
    }
    return result;
  }

  Map<String, dynamic> toMap() => {
    "latitude": latitude,
    "longitude": longitude,
    "time": time,
    "altitude": altitude,
    "speed": speed,
    "bearing": bearing,
    "horizontalAccuracy": horizontalAccuracy,
    "verticalAccuracy": verticalAccuracy,
  };

  @override
  String toString() {
    return 'Location{latitude: $latitude, longitude: $longitude, time: $time, altitude: $altitude, speed: $speed, bearing: $bearing, horizontalAccuracy: $horizontalAccuracy, verticalAccuracy: $verticalAccuracy}';
  }
}
class Locations {
  static Location portland = new Location(45.512794, -122.679565);
  static Location centerOfUSA = new Location(37.0902, -95.7192);
}
class ToolbarAction {
  final String title;
  final int identifier;

  /// Show the button in the toolbar only if there is room.
  /// DEFAULTS to false
  /// Only works on Android
  bool showIfRoom = false;

  ToolbarAction(this.title, this.identifier);

  Map get toMap => {"title": title, "identifier": identifier};
}
class Polygon {
  final String id;
  List<Location> points;
  List<Hole> holes;
  final double strokeWidth;
  final Color fillColor;
  final Color strokeColor;
  ///Only supported in Android. iOS don't have this for some reason.
  ///https://developers.google.com/android/reference/com/google/android/gms/maps/model/JointType
  final FigureJointType jointType;

  static const Color _defaultColor = const Color(-769226);
  static const double _defaultWidth = 10.0;
  static const FigureJointType _defaultJointType = FigureJointType.def;
  static const List<Hole> _defaultHoles = <Hole>[];

  Polygon(
      this.id,
      this.points, {
        this.fillColor: _defaultColor,
        this.strokeColor: _defaultColor,
        this.strokeWidth: _defaultWidth,
        this.jointType: _defaultJointType,
        this.holes: _defaultHoles,
      });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Polygon && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "points": Location.listToMap(points),
      "holes": Hole.listToMap(holes),
      "strokeWidth": strokeWidth,
      "jointType": jointType.value,
      "fillColor": {
        "r": fillColor.red,
        "g": fillColor.green,
        "b": fillColor.blue,
        "a": fillColor.alpha
      },
      "strokeColor": {
        "r": strokeColor.red,
        "g": strokeColor.green,
        "b": strokeColor.blue,
        "a": strokeColor.alpha
      },
    };
  }
}

class Hole {
  List<Location> points = [];

  Hole(this.points);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Hole &&
              runtimeType == other.runtimeType &&
              points == other.points;

  @override
  int get hashCode => points.hashCode;

  static listToMap(List<Hole> holes) {
    List<Map<String, dynamic>> result = [];
    for (var element in holes) {
      result.add(element.toMap());
    }
    return result;
  }

  Map<String, dynamic> toMap() {
    return {
      "points": Location.listToMap(points),
    };
  }
}
class FigureJointType {
  const FigureJointType._(this.value);

  final int value;

  ///Default: Mitered joint, with fixed pointed extrusion equal to half the stroke width on the outside of the joint.
  ///
  /// See: https://developers.google.com/android/reference/com/google/android/gms/maps/model/JointType
  static const FigureJointType def = const FigureJointType._(0);

  ///Flat bevel on the outside of the joint.
  ///
  /// See: https://developers.google.com/android/reference/com/google/android/gms/maps/model/JointType
  static const FigureJointType bevel = const FigureJointType._(1);

  ///Rounded on the outside of the joint by an arc of radius equal to half the stroke width, centered at the vertex.
  ///
  /// See: https://developers.google.com/android/reference/com/google/android/gms/maps/model/JointType
  static const FigureJointType round = const FigureJointType._(2);
}
class Polyline {
  final String id;
  List<Location> points;
  ///Only supported in Android. iOS don't have this for some reason.
  ///https://developers.google.com/android/reference/com/google/android/gms/maps/model/JointType
  final FigureJointType jointType;
  final double width;
  final Color color;

  static const Color _defaultColor = const Color(-769226);
  static const double _defaultWidth = 10.0;
  static const FigureJointType _defaultJointType = FigureJointType.def;

  Polyline(
      this.id,
      this.points, {
        this.color: _defaultColor,
        this.width: _defaultWidth,
        this.jointType: _defaultJointType,
      });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Polyline && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "points": Location.listToMap(points),
      "width": width,
      "jointType": jointType.value,
      "color": {
        "r": color.red,
        "g": color.green,
        "b": color.blue,
        "a": color.alpha
      }
    };
  }
}
class Marker {
  final String id;
  final String title;
  final double latitude;
  final double longitude;

  ///Marker Icon representation object.
  ///
  ///Setting this value replaces the attribute color.
  ///If the image can't be set, the color will be used with the default marker.
  final MarkerIcon markerIcon;

  ///The rotation of the marker in degrees clockwise from the default position.
  final double rotation;

  ///Color of the default marker.
  final Color color;

  ///Enables/disables the marker drag functionality.
  final bool draggable;

  static const Color _defaultColor = const Color(-769226);

  Marker(
      this.id,
      this.title,
      this.latitude,
      this.longitude, {
        this.rotation: 0.0,
        this.markerIcon,
        this.color: _defaultColor,
        this.draggable: false,
      });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Marker && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "id": id,
      "title": title,
      "latitude": latitude,
      "longitude": longitude,
      "rotation": rotation,
      "type": "pin",
      "draggable": draggable,
      "color": {
        "r": color.red,
        "g": color.green,
        "b": color.blue,
        "a": color.alpha
      }
    };
    if (markerIcon != null)
      map.putIfAbsent("markerIcon", () => markerIcon.toMap());
    return map;
  }
}

class MarkerIcon {
  ///Asset image to be set in the marker.
  String asset;

  ///Width of the image icon.
  ///
  ///Should not be 0.0, otherwise the image original width will be used.
  ///
  ///Sizes behave differently in each platform, so change this value to match
  ///the desired look in each platform.
  double width;

  ///Height of the image icon.
  ///
  ///Should not be 0.0, otherwise the image original height will be used.
  ///
  ///Sizes behave differently in each platform, so change this value to match
  ///the desired look in each platform.
  double height;

  MarkerIcon(
      this.asset, {
        this.width = 0.0,
        this.height = 0.0,
      });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MarkerIcon &&
              runtimeType == other.runtimeType &&
              asset == other.asset &&
              width == other.width &&
              height == other.height;

  @override
  int get hashCode => asset.hashCode ^ width.hashCode ^ height.hashCode;

  Map<String, dynamic> toMap() {
    return {
      "asset": asset,
      "width": width,
      "height": height,
    };
  }
}
class StaticMapProvider {
  final String googleMapsApiKey;
  static const int defaultZoomLevel = 4;
  static const int defaultWidth = 600;
  static const int defaultHeight = 400;
  static const StaticMapViewType defaultMaptype = StaticMapViewType.roadmap;

  StaticMapProvider(this.googleMapsApiKey);

  ///
  /// Creates a Uri for the Google Static Maps API
  /// Centers the map on [center] using a zoom of [zoomLevel]
  /// Specify a [width] and [height] that you would like the resulting image to be. The default is 600w x 400h
  ///

  Uri getStaticUri(Location center, int zoomLevel,
      {int width, int height, StaticMapViewType mapType}) {
    return _buildUrl(
        null,
        center,
        zoomLevel ?? defaultZoomLevel,
        width ?? defaultWidth,
        height ?? defaultHeight,
        mapType ?? defaultMaptype);
  }

  ///
  /// Creates a Uri for the Google Static Maps API using a list of locations to create pins on the map
  /// [locations] must have at least 1 location
  /// Specify a [width] and [height] that you would like the resulting image to be. The default is 600w x 400h
  ///

  Uri getStaticUriWithMarkers(List<Marker> markers,
      {int width, int height, StaticMapViewType maptype, Location center}) {
    return _buildUrl(markers, center, null, width ?? defaultWidth,
        height ?? defaultHeight, maptype ?? defaultMaptype);
  }

  ///
  /// Creates a Uri for the Google Static Maps API using a list of locations to create pins on the map
  /// [locations] must have at least 1 location
  /// Specify a [width] and [height] that you would like the resulting image to be. The default is 600w x 400h
  /// Centers the map on [center] using a zoom of [zoomLevel]
  ///
  Uri getStaticUriWithMarkersAndZoom(List<Marker> markers,
      {int width,
        int height,
        StaticMapViewType maptype,
        Location center,
        int zoomLevel}) {
    return _buildUrl(markers, center, zoomLevel, width ?? defaultWidth,
        height ?? defaultHeight, maptype ?? defaultMaptype);
  }

  ///
  /// Creates a Uri for the Google Static Maps API using an active MapView
  /// This method is useful for generating a static image
  /// [mapView] must currently be visible when you call this.
  /// Specify a [width] and [height] that you would like the resulting image to be. The default is 600w x 400h
  ///
  Future<Uri> getImageUriFromMap(MapView mapView,
      {int width, int height, StaticMapViewType maptype}) async {
    var markers = await mapView.visibleAnnotations;
    var center = await mapView.centerLocation;
    var zoom = await mapView.zoomLevel;
    return _buildUrl(markers, center, zoom.toInt(), width ?? defaultWidth,
        height ?? defaultHeight, maptype ?? defaultMaptype);
  }

  Uri _buildUrl(List<Marker> locations, Location center, int zoomLevel,
      int width, int height, StaticMapViewType mapType) {
    var finalUri = new UriBuilder()
      ..scheme = 'https'
      ..host = 'maps.googleapis.com'
      ..port = 443
      ..path = '/maps/api/staticmap';

    if (center == null && (locations == null || locations.length == 0)) {
      center = Locations.centerOfUSA;
    }

    if (locations == null || locations.length == 0) {
      if (center == null) center = Locations.centerOfUSA;
      finalUri.queryParameters = {
        'center': '${center.latitude},${center.longitude}',
        'zoom': zoomLevel.toString(),
        'size': '${width ?? defaultWidth}x${height ?? defaultHeight}',
        'maptype': _getMapTypeQueryParam(mapType),
        'key': googleMapsApiKey,
      };
    } else {
      List<String> markers = new List();
      locations.forEach((location) {
        num lat = location.latitude;
        num lng = location.longitude;
        String marker = '$lat,$lng';
        markers.add(marker);
      });
      String markersString = markers.join('|');
      finalUri.queryParameters = {
        'markers': markersString,
        'size': '${width ?? defaultWidth}x${height ?? defaultHeight}',
        'maptype': _getMapTypeQueryParam(mapType),
        'key': googleMapsApiKey,
      };
    }
    if (center != null)
      finalUri.queryParameters['center'] =
      '${center.latitude},${center.longitude}';

    var uri = finalUri.build();
    return uri;
  }

  String _getMapTypeQueryParam(StaticMapViewType maptype) {
    String mapTypeQueryParam;
    switch (maptype) {
      case StaticMapViewType.roadmap:
        mapTypeQueryParam = "roadmap";
        break;
      case StaticMapViewType.satellite:
        mapTypeQueryParam = "satellite";
        break;
      case StaticMapViewType.hybrid:
        mapTypeQueryParam = "hybrid";
        break;
      case StaticMapViewType.terrain:
        mapTypeQueryParam = "terrain";
        break;
    }
    return mapTypeQueryParam;
  }
}
enum MapViewType { none, normal, satellite, terrain, hybrid }

enum StaticMapViewType { roadmap, satellite, terrain, hybrid }
class MapView {
  MethodChannel _channel = const MethodChannel("com.apptreesoftware.map_view");
  StreamController<Marker> _annotationStreamController =
  new StreamController.broadcast();
  StreamController<Map<Marker, Location>> _annotationDragStartController =
  new StreamController.broadcast();
  StreamController<Map<Marker, Location>> _annotationDragEndController =
  new StreamController.broadcast();
  StreamController<Map<Marker, Location>> _annotationDragController =
  new StreamController.broadcast();
  StreamController<Polyline> _polylineStreamController =
  new StreamController.broadcast();
  StreamController<Polygon> _polygonStreamController =
  new StreamController.broadcast();
  StreamController<Location> _locationChangeStreamController =
  new StreamController.broadcast();
  StreamController<Location> _mapTapInteractionStreamController =
  new StreamController.broadcast();
  StreamController<Location> _mapLongTapInteractionStreamController =
  new StreamController.broadcast();
  StreamController<CameraPosition> _cameraStreamController =
  new StreamController.broadcast();
  StreamController<int> _toolbarActionStreamController =
  new StreamController.broadcast();
  StreamController<Null> _mapReadyStreamController =
  new StreamController.broadcast();
  StreamController<Marker> _infoWindowStreamController =
  new StreamController.broadcast();
  StreamController<IndoorBuilding> _indoorBuildingActivatedStreamController =
  new StreamController.broadcast();
  StreamController<IndoorLevel> _indoorLevelActivatedStreamController =
  new StreamController.broadcast();

  Map<String, Marker> _annotations = {};
  Map<String, Polyline> _polylines = {};
  Map<String, Polygon> _polygons = {};

  MapView() {
    _channel.setMethodCallHandler(_handleMethod);
  }

  static bool _apiKeySet = false;

  static void setApiKey(String apiKey) {
    MethodChannel c = const MethodChannel("com.apptreesoftware.map_view");
    c.invokeMethod('setApiKey', apiKey);
    _apiKeySet = true;
  }

  void show(MapOptions mapOptions, {List<ToolbarAction> toolbarActions}) {
    if (!_apiKeySet) {
      throw "API Key must be set before calling `show`. Use MapView.setApiKey";
    }
    List<Map> actions = [];
    if (toolbarActions != null) {
      actions = toolbarActions.map((t) => t.toMap).toList();
    }
    print(mapOptions.toMap());
    _channel.invokeMethod(
        'show', {"mapOptions": mapOptions.toMap(), "actions": actions});
  }

  void dismiss() {
    _annotations.clear();
    _polylines.clear();
    _polygons.clear();
    _channel.invokeMethod('dismiss');
  }

  List<Marker> get markers => _annotations.values.toList(growable: false);

  List<Polyline> get polylines => _polylines.values.toList(growable: false);

  List<Polygon> get polygons => _polygons.values.toList(growable: false);

  void setMarkers(List<Marker> annotations) {
    _annotations.clear();
    annotations.forEach((a) => _annotations[a.id] = a);
    _channel.invokeMethod('setAnnotations',
        annotations.map((a) => a.toMap()).toList(growable: false));
  }

  void clearAnnotations() {
    _channel.invokeMethod('clearAnnotations');
    _annotations.clear();
  }

  void addMarker(Marker marker) {
    if (_annotations.containsKey(marker.id)) {
      return;
    }
    _annotations[marker.id] = marker;
    _channel.invokeMethod('addAnnotation', marker.toMap());
  }

  void removeMarker(Marker marker) {
    if (!_annotations.containsKey(marker.id)) {
      return;
    }
    _annotations.remove(marker.id);
    _channel.invokeMethod('removeAnnotation', marker.toMap());
  }

  void setPolylines(List<Polyline> polylines) {
    _polylines.clear();
    polylines.forEach((a) => _polylines[a.id] = a);
    _channel.invokeMethod('setPolylines',
        polylines.map((a) => a.toMap()).toList(growable: false));
  }

  void clearPolylines() {
    _channel.invokeMethod('clearPolylines');
    _polylines.clear();
  }

  void addPolyline(Polyline polyline) {
    if (_polylines.containsKey(polyline.id)) {
      return;
    }
    _polylines[polyline.id] = polyline;
    _channel.invokeMethod('addPolyline', polyline.toMap());
  }

  void removePolyline(Polyline polyline) {
    if (!_polylines.containsKey(polyline.id)) {
      return;
    }
    _polylines.remove(polyline.id);
    _channel.invokeMethod('removePolyline', polyline.toMap());
  }

  void setPolygons(List<Polygon> polygons) {
    _polygons.clear();
    polygons.forEach((a) => _polygons[a.id] = a);
    _channel.invokeMethod(
        'setPolygons', polygons.map((a) => a.toMap()).toList(growable: false));
  }

  void clearPolygons() {
    _channel.invokeMethod('clearPolygons');
    _polygons.clear();
  }

  void addPolygon(Polygon polygon) {
    if (_polygons.containsKey(polygon.id)) {
      return;
    }
    _polygons[polygon.id] = polygon;
    _channel.invokeMethod('addPolygon', polygon.toMap());
  }

  void removePolygon(Polygon polygon) {
    if (!_polygons.containsKey(polygon.id)) {
      return;
    }
    _polygons.remove(polygon.id);
    _channel.invokeMethod('removePolygon', polygon.toMap());
  }

  void zoomToFit({int padding: 50}) {
    _channel.invokeMethod('zoomToFit', padding);
  }

  void zoomToAnnotations(List<String> annotationIds, {double padding: 50.0}) {
    _channel.invokeMethod('zoomToAnnotations',
        {"annotations": annotationIds, "padding": padding});
  }

  void zoomToPolylines(List<String> polylines, {double padding: 50.0}) {
    _channel.invokeMethod(
        'zoomToPolylines', {"polylines": polylines, "padding": padding});
  }

  void zoomToPolygons(List<String> polygonsIds, {double padding: 50.0}) {
    _channel.invokeMethod(
        'zoomToPolygons', {"polygons": polygonsIds, "padding": padding});
  }

  void setCameraPosition(CameraPosition cameraPosition) {
    _channel.invokeMethod("setCamera", cameraPosition.toMap());
  }

  Future<Location> get centerLocation async {
    Map locationMap = await _channel.invokeMethod("getCenter");
    return new Location(locationMap["latitude"], locationMap["longitude"]);
  }

  Future<double> get zoomLevel async {
    return await _channel.invokeMethod("getZoomLevel");
  }

  Future<List<Marker>> get visibleAnnotations async {
    List<dynamic> ids = await _channel.invokeMethod("getVisibleMarkers");
    var annotations = <Marker>[];
    for (var id in ids) {
      var annotation = _annotations[id];
      annotations.add(annotation);
    }
    return annotations;
  }

  Future<List<Polyline>> get visiblePolyLines async {
    List<dynamic> ids = await _channel.invokeMethod("getVisiblePolylines");
    var polylines = <Polyline>[];
    for (var id in ids) {
      var polyline = _polylines[id];
      polylines.add(polyline);
    }
    return polylines;
  }

  Future<List<Polygon>> get visiblePolygons async {
    List<dynamic> ids = await _channel.invokeMethod("getVisiblePolygons");
    var polygons = <Polygon>[];
    for (var id in ids) {
      var polygon = _polygons[id];
      polygons.add(polygon);
    }
    return polygons;
  }

  Stream<Marker> get onTouchAnnotation => _annotationStreamController.stream;

  Stream<Map<Marker, Location>> get onAnnotationDragStart =>
      _annotationDragStartController.stream;

  Stream<Map<Marker, Location>> get onAnnotationDragEnd =>
      _annotationDragEndController.stream;

  Stream<Map<Marker, Location>> get onAnnotationDrag =>
      _annotationDragController.stream;

  Stream<Polyline> get onTouchPolyline => _polylineStreamController.stream;

  Stream<Polygon> get onTouchPolygon => _polygonStreamController.stream;

  Stream<Location> get onLocationUpdated =>
      _locationChangeStreamController.stream;

  Stream<Location> get onMapTapped => _mapTapInteractionStreamController.stream;

  Stream<Location> get onMapLongTapped => _mapLongTapInteractionStreamController.stream;

  Stream<CameraPosition> get onCameraChanged => _cameraStreamController.stream;

  Stream<int> get onToolbarAction => _toolbarActionStreamController.stream;

  Stream<Null> get onMapReady => _mapReadyStreamController.stream;

  Stream<Marker> get onInfoWindowTapped => _infoWindowStreamController.stream;

  Stream<IndoorBuilding> get onIndoorBuildingActivated =>
      _indoorBuildingActivatedStreamController.stream;

  Stream<IndoorLevel> get onIndoorLevelActivated =>
      _indoorLevelActivatedStreamController.stream;

  Future<dynamic> _handleMethod(MethodCall call) async {
    switch (call.method) {
      case "onMapReady":
        _mapReadyStreamController.add(null);
        return new Future.value("");
      case "locationUpdated":
        Map args = call.arguments;
        _locationChangeStreamController.add(new Location.fromMapFull(args));
        return new Future.value("");
      case "annotationTapped":
        String id = call.arguments;
        var annotation = _annotations[id];
        if (annotation != null) {
          _annotationStreamController.add(annotation);
        }
        return new Future.value("");
      case "annotationDragStart":
        String id = call.arguments["id"];
        var annotation = _annotations[id];
        var latitude = call.arguments["latitude"];
        var longitude = call.arguments["longitude"];
        if (annotation != null) {
          Map<Marker, Location> map = new Map();
          map.putIfAbsent(annotation, () => new Location(latitude, longitude));
          _annotationDragStartController.add(map);
        }
        return new Future.value("");
      case "annotationDragEnd":
        String id = call.arguments["id"];
        var annotation = _annotations[id];
        var latitude = call.arguments["latitude"];
        var longitude = call.arguments["longitude"];
        if (annotation != null) {
          Map<Marker, Location> map = new Map();
          map.putIfAbsent(annotation, () => new Location(latitude, longitude));
          _annotationDragEndController.add(map);
        }
        return new Future.value("");
      case "annotationDrag":
        String id = call.arguments["id"];
        var annotation = _annotations[id];
        var latitude = call.arguments["latitude"];
        var longitude = call.arguments["longitude"];
        if (annotation != null) {
          Map<Marker, Location> map = new Map();
          map.putIfAbsent(annotation, () => new Location(latitude, longitude));
          _annotationDragController.add(map);
        }
        return new Future.value("");
      case "polylineTapped":
        String id = call.arguments;
        var polyline = _polylines[id];
        if (polyline != null) {
          _polylineStreamController.add(polyline);
        }
        return new Future.value("");
      case "polygonTapped":
        String id = call.arguments;
        var polygon = _polygons[id];
        if (polygon != null) {
          _polygonStreamController.add(polygon);
        }
        return new Future.value("");
      case "infoWindowTapped":
        String id = call.arguments;
        var annotation = _annotations[id];
        if (annotation != null) {
          _infoWindowStreamController.add(annotation);
        }
        return new Future.value("");
      case "mapTapped":
        Map locationMap = call.arguments;
        Location location = new Location.fromMap(locationMap);
        _mapTapInteractionStreamController.add(location);
        return new Future.value("");
      case "mapLongTapped":
        Map locationMap = call.arguments;
        Location location = new Location.fromMap(locationMap);
        _mapLongTapInteractionStreamController.add(location);
        return new Future.value("");
      case "cameraPositionChanged":
        _cameraStreamController.add(new CameraPosition.fromMap(call.arguments));
        return new Future.value("");
      case "onToolbarAction":
        _toolbarActionStreamController.add(call.arguments);
        break;
      case "indoorBuildingActivated":
        if (call.arguments == null) {
          _indoorBuildingActivatedStreamController.add(null);
        } else {
          List<IndoorLevel> levels = [];
          for (var value in call.arguments["levels"]) {
            levels.add(IndoorLevel(value["name"], value["shortName"]));
          }
          _indoorBuildingActivatedStreamController.add(new IndoorBuilding(
              call.arguments["underground"],
              call.arguments["defaultLevelIndex"],
              levels));
        }
        break;
      case "indoorLevelActivated":
        if (call.arguments == null) {
          _indoorLevelActivatedStreamController.add(null);
        } else {
          _indoorLevelActivatedStreamController.add(
              IndoorLevel(call.arguments["name"], call.arguments["shortName"]));
        }
        break;
    }
    return new Future.value("");
  }
}
class IndoorBuilding {
  final bool underground;
  final int defaultIndex;
  final List<IndoorLevel> levels;

  IndoorBuilding(this.underground, this.defaultIndex, this.levels);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is IndoorBuilding &&
              runtimeType == other.runtimeType &&
              underground == other.underground &&
              defaultIndex == other.defaultIndex &&
              levels == other.levels;

  @override
  int get hashCode =>
      underground.hashCode ^ defaultIndex.hashCode ^ levels.hashCode;

  @override
  String toString() {
    return 'IndoorBuilding{underground: $underground, defaultIndex: $defaultIndex, levels: $levels}';
  }
}

class IndoorLevel {
  final String name;
  final String shortName;

  IndoorLevel(this.name, this.shortName);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is IndoorLevel &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              shortName == other.shortName;

  @override
  int get hashCode => name.hashCode ^ shortName.hashCode;

  @override
  String toString() {
    return 'IndoorLevel{name: $name, shortName: $shortName}';
  }
}
class MapOptions {
  /// Allows the app to receive location updates.
  final bool showUserLocation;
  /// show/hide the button to center the map on the user location.
  ///
  /// Requires showUserLocation to be true.
  final bool showMyLocationButton;
  /// show/hide the compass button on the map.
  ///
  /// Normally is not visible all the time. Becomes visible when the orientation
  /// of the map is changes through gesture.
  final bool showCompassButton;
  /// show/hide the toolbar while on the map activity/view.
  ///
  /// Actions passed to the MapView.show(MapOptions,<ToolbarAction>[]) function will not work
  /// because they will not be visible.
  final bool hideToolbar;
  final CameraPosition initialCameraPosition;
  final String title;
  static const CameraPosition _defaultCamera =
  const CameraPosition(const Location(45.5329661, -122.7059508), 12.0);
  MapViewType mapViewType;

  MapOptions(
      {this.showUserLocation: false,
        this.showMyLocationButton: false,
        this.showCompassButton: false,
        this.hideToolbar = false,
        this.initialCameraPosition: _defaultCamera,
        this.title: "",
        this.mapViewType: MapViewType.normal});

  Map<String, dynamic> toMap() {
    return {
      "showUserLocation": showUserLocation,
      "showMyLocationButton": showMyLocationButton,
      "showCompassButton": showCompassButton,
      "hideToolbar": hideToolbar,
      "cameraPosition": initialCameraPosition.toMap(),
      "title": title,
      "mapViewType": getMapTypeName(mapViewType)
    };
  }

  String getMapTypeName(MapViewType mapType) {
    String mapTypeName = "normal";
    switch (mapType) {
      case MapViewType.none:
        mapTypeName = "none";
        break;
      case MapViewType.satellite:
        mapTypeName = "satellite";
        break;
      case MapViewType.terrain:
        mapTypeName = "terrain";
        break;
      case MapViewType.hybrid:
        mapTypeName = "hybrid";
        break;
      case MapViewType.normal:
        mapTypeName = "normal";
        break;
    }
    return mapTypeName;
  }
}
*/

