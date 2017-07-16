//
//  EventsDetailsMapTableViewCell.swift
//  Hackathon2017
//
//  Created by Jakub Janicki on 16.07.2017.
//  Copyright © 2017 CzorneSalami. All rights reserved.
//

import UIKit
import GoogleMaps

class EventsDetailsMapTableViewCell: UITableViewCell {
    
    @IBOutlet weak var view: UIView!
    var route: Route!
    var mapView: GMSMapView!

    func setupCell(event: Event) {
        let place = DataManager.shared.places!.filter { $0.id! == event.details!.startPlace! }.first!
        let camera = GMSCameraPosition.camera(withLatitude: place.latitude!, longitude: place.longitude!, zoom: 15.0)
        mapView = GMSMapView.map(withFrame: self.contentView.frame, camera: camera)
        
        self.view.addSubview(mapView)
        
        ApiClient.shared.getRouteForEvent(withId: event.details!.id!, successCallback: { (route) in
            self.route = route
            self.showPath(self.mapView)
        }, errorCallback: {
            
        })
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = true
    }
    
    class func reuseIdentifier() -> String {
        return "EventsDetailsMapTableViewCell"
    }
    
    func showPath(_ mapView: GMSMapView) {
        guard let route = self.route, let encodedPath = route.points else { return }
        let path = GMSPath(fromEncodedPath: encodedPath)
        let polyline = GMSPolyline(path: path)
        polyline.strokeWidth = 2
        polyline.map = mapView
    }
    
    func showWaypoints(_ mapView: GMSMapView, fromEvent event: Event) {
        let places = DataManager.shared.places!
        let mapped = event.details!.places!.map { id in
            return places.filter { $0.id! == id }.first!
        }
        addMarker(mapped.first, toMap: mapView, markerColor: .green)
        addMarker(mapped.last, toMap: mapView, markerColor: .red)
        mapped.dropFirst().dropLast().forEach {
            addMarker($0, toMap: mapView)
        }
    }
    
    func addMarker(_ place: Place?, toMap mapView: GMSMapView, markerColor: UIColor = .gray) {
        guard let place = place else { return }
        let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: place.latitude!, longitude: place.longitude!))
        marker.title = place.name
        marker.snippet = place.address
        marker.map = mapView
        marker.icon = GMSMarker.markerImage(with: markerColor)
    }
    
}
