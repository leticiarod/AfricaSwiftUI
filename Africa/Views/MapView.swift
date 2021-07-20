//
//  MapView.swift
//  Africa
//
//  Created by Leticia Rodriguez on 7/15/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    // We use state here since maps in swiftUI are using bindings in order to
    // notify about changes
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    var body: some View {
        // MARK: - No1 Basic Map
        //Map(coordinateRegion: $region)
        
        // MARK: - No2 Map with annotations
        Map(coordinateRegion: $region, annotationItems: locations) { item in
            // A) Pin: Old style (always static)
            //MapPin(coordinate: item.location, tint: .accentColor)
            // B) MArker: New Style (always static)
            //MapMarker(coordinate: item.location, tint: .accentColor)
            // C) Custom basic Annotaion (it could be interactive)
            MapAnnotation(coordinate: item.location) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
            } //: Annotation
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
