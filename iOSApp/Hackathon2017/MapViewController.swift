//
//  MapViewController.swift
//  Hackathon2017
//
//  Created by Arkadiusz Żmudzin on 16.07.2017.
//  Copyright © 2017 CzorneSalami. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    
//    var route: Route!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let camera = GMSCameraPosition.camera(withLatitude: 52.4166667, longitude: 16.9666667, zoom: 10.0)
//        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
//        
//        self.route = Route()
//        route.encodedPath = "www~Hgn{eBqFaKu@iA}FkHsBsCYq@a@uAoC`CwAlA]RX~AlAtGLbAMcAmAuGY_B\\SvAmA|BqBPOSaAsBuLiBoKkAyGgCsOqDuU{AwKi@{ByB{MmB{KkJeg@K}@|@]bBm@tEWp@CRDB_@NsBp@{G|C}[xCbBnGzDPL~ChBz@j@{@k@_DiBIGb@iCb@gCbBsKuEuE{EmE}AiBSQKC}@R{E|@yFnAaBV_ALuC@qAAoASmHoA{@QG[oAqIgAoI[mDUeFUqLCqA@{@\\gFRqCDoD\\}AF_@gCiAoBq@KKWWYKY@SF_AK}EgAuCi@}@[qBa@sAWk@Se@OaAe@o@_@aAu@kBkBK_@Ec@c@_A[QcA_@SIGKyAcBiAeBy@}As@aBs@cBIYk@y@qAsAeAcA{C{C{BwBwD_EcE}DWM_@IyAEc@BiCnJkA~De@lAo@|@i@f@o@\\o@P[Dq@@oDc@iAY_F{A}AOiGEgC?sNb@{ADsA?_AIcB_@yBo@mBe@@YgA[yAc@IAQBWIMGiBQOGOKK?m@Ng@LyC~@aGRuCJc@@ASCIaG?gE@YDgCXw@h@}ABoB@iCCwEQgDAuEH_DF[EcBD{CJq@WoCKO}FUU?eDCwFEgS}BMiK[wA?"
//        let place1 = Place()!
//        place1.coordinates = [52.3917953, 16.857482]
//        place1.name = "Pixel"
//        place1.address = "Grunwaldzka 182, 60-166 Poznań, Polska"
//        let place3 = Place()!
//        place3.coordinates = [52.3927853, 16.858943]
//        place3.name = "asd"
//        place3.address = "asdasd"
//        let place2 = Place()!
//        place2.coordinates = [52.4537902, 16.9275968]
//        place2.name = "Dom"
//        place2.address = "Umultowska 45, Poznań, Polska"
//        route.waypoints = [place1, place3, place2]
//        
//        showPath(mapView)
//        showWaypoints(mapView)
//        
//        self.view = mapView
//    }
//
//    func showPath(_ mapView: GMSMapView) {
//        guard let route = self.route, let encodedPath = route.encodedPath else { return }
//        let path = GMSPath(fromEncodedPath: encodedPath)
//        let polyline = GMSPolyline(path: path)
//        polyline.strokeWidth = 2
//        polyline.map = mapView
//    }
//    
//    func showWaypoints(_ mapView: GMSMapView) {
//        guard let route = self.route, let waypoints = route.waypoints else { return }
//        addMarker(waypoints.first, toMap: mapView, markerColor: .green)
//        addMarker(waypoints.last, toMap: mapView, markerColor: .red)
//        waypoints.dropFirst().dropLast().forEach {
//            addMarker($0, toMap: mapView)
//        }
//    }
//    
//    func addMarker(_ place: Place?, toMap mapView: GMSMapView, markerColor: UIColor = .gray) {
//        guard let place = place else { return }
//        let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: place.latitude!, longitude: place.longitude!))
//        marker.title = place.name
//        marker.snippet = place.address
//        marker.map = mapView
//        marker.icon = GMSMarker.markerImage(with: markerColor)
//    }
    
}
