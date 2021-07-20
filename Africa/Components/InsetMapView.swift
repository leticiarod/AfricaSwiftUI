//
//  InsetMapView.swift
//  Africa
//
//  Created by Leticia Rodriguez on 7/20/21.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    
    // MANDATORY REQUIEREMENT IF YOU WANT TO CREATE A MAP VIEW IN SWIFT UI.
    // THE RESONING BEHIND IT IS THAT MAPS ARE USING BINDINGS TO KEEP TRACK OF ANY CHANGES THAT MAY OCCUR IN THE MAPS REGION SUCH AS ROUT TRACKING, SPANING, ZOMM IN OR OUT ETC
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    
    var body: some View {
        // Since the map region coud be changed any time, we
       // we must use bindings in order to keep track of any changes
        // using the @tsate property wrapper, thats why the '$' before region property.
        
        Map(coordinateRegion: $region)
            .overlay(
                NavigationLink(
                    destination: MapView(),
                    label: {
                        HStack  {
                            Image(systemName: "mappin.circle")
                                .foregroundColor(.white)
                                .imageScale(.large)
                            Text("Locations")
                                .foregroundColor(.accentColor)
                                .fontWeight(.bold)
                        } //: HSTACK
                        .padding(.vertical, 10)
                        .padding(.horizontal, 14)
                        .background(
                            Color.black
                                .opacity(0.4)
                                .cornerRadius(10)
                        )
                    }) //: Navigation
                    .padding(12), alignment: .topTrailing
            )
            .frame(height: 256)
            .cornerRadius(12)
    }
}

struct InsetMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsetMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
