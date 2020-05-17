//
//  MapRepresentView.swift
//  Portfolio
//
//  Created by Денис Андриевский on 17.05.2020.
//  Copyright © 2020 Денис Андриевский. All rights reserved.
//

import SwiftUI
import MapKit

struct MapRepresentatinView: UIViewRepresentable {
    
    var mapView = MKMapView()
    var location: CLLocation
    
    func makeUIView(context: Context) -> MKMapView {
        mapView.register(CityView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.addAnnotation(City(location: location))
    }
    
    mutating func refresh(newLocation: CLLocation) {
        location = newLocation
        mapView.addAnnotation(City(location: location))
    }
    
}

class CityView: MKMarkerAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            if (newValue as? City) != nil {
                glyphText = "👀"
                markerTintColor =   .green
            }
        }
    }

}

class City: NSObject, MKAnnotation {
    
    var location: CLLocation
    
    init(location: CLLocation) {
        self.location = location
    }
    
    var coordinate: CLLocationCoordinate2D {
        get {
            return location.coordinate
        }
    }
    var title: String? {
        get {
            return "I am here"
        }
    }
}
