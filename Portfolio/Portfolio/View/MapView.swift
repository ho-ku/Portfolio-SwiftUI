//
//  MapView.swift
//  Portfolio
//
//  Created by Денис Андриевский on 17.05.2020.
//  Copyright © 2020 Денис Андриевский. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var body: some View {
        var mapView = MapRepresentatinView(location: CLLocation())
        var location = CLLocation()
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString("Kyiv, Ukraine") { (placemarks, error) in
            if error == nil, let placemark = placemarks?.first {
                location = placemark.location ?? CLLocation()
                mapView.refresh(newLocation: location)
            }
        }
        return mapView.edgesIgnoringSafeArea(.all)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
