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
    
    var route: Route!

    override func viewDidLoad() {
        super.viewDidLoad()

        let camera = GMSCameraPosition.camera(withLatitude: 52.4166667, longitude: 16.9666667, zoom: 10.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        showPath(mapView)
        showWaypoints(mapView)
        
        self.view = mapView
    }

    func showPath(_ mapView: GMSMapView) {
        guard let route = self.route, let encodedPath = route.encodedPath else { return }
        let path = GMSPath(fromEncodedPath: encodedPath)
        let polyline = GMSPolyline(path: path)
        polyline.map = mapView
    }
    
    func showWaypoints(_ mapView: GMSMapView) {
        guard let route = self.route, let waypoints = route.waypoints else { return }
        waypoints.forEach {
            let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: $0.latitude!, longitude: $0.longitude!))
            marker.title = $0.name
            marker.map = mapView
        }
        
    }
    
}
