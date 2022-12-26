//
//  VideoModel.swift
//  Animals Encyclopedia
//
//  Created by Admin on 24/12/22.
//

import Foundation

struct Video : Codable , Identifiable{
    let id: String
    let name: String
    let headline: String
    
    //COMPUTED PROPERTY
    var thumbnail : String{
        "video-\(id)"
    }
}
