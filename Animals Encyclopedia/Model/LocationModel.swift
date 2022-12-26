//
//  LocationModel.swift
//  Animals Encyclopedia
//
//  Created by Admin on 25/12/22.
//

import Foundation
import MapKit

struct NationalParkLocation : Codable, Identifiable{
    let id : String
    var name : String
    var image : String
    var latitude : Double
    var longitude : Double
    
    // Computed Property
    var location : CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
}
