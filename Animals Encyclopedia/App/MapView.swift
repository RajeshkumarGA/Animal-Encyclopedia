//
//  MapView.swift
//  Animals Encyclopedia
//
//  Created by Admin on 22/12/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: Propertys
    let locations : [NationalParkLocation] = Bundle.main.decode("locations.json")
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    
    //MARK: BODY
    var body: some View {
        // 1. BASIC MAP always static
//        Map(coordinateRegion: $region)
        
        //2. ADVANCED MAP
        
        Map(coordinateRegion: $region , annotationItems: locations, annotationContent: { item in
            //(A). old Style
//            MapPin(coordinate: item.location , tint: .accentColor)
            
            //(B). MARKERS (new Style always static)
//            MapMarker(coordinate: item.location, tint: .accentColor)
            
            //(C). CUSTOME Basic Anotatios (it could be interactive )
//            MapAnnotation(coordinate: item.location, content: {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32,height: 32)
//
//            })
            
            // (D). COMPLAX MAP ANOTATION (Could be Interractive)
            
            MapAnnotation(coordinate: item.location, content: {
                MapAnotationView(location: item)
            })
            
        }) // MAP
        .overlay(alignment: .top ,content: {
            HStack(alignment: .center, spacing: 12){
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48,height: 48, alignment: .center)
                VStack(alignment: .leading, spacing: 3, content: {
                    HStack{
                        Text("Latitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    Divider()
                    HStack{
                        Text("Longitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                })
                
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(
                Color.black
                    .cornerRadius(8)
                    .opacity(0.6)
            )
            .padding()
        })
    }
}
    //MARK: PREVIEW
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
