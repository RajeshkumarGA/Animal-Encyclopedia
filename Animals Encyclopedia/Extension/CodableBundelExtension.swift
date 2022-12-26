//
//  CodableBundelExtension.swift
//  Animals Encyclopedia
//
//  Created by Admin on 23/12/22.
//

import Foundation

extension Bundle{
    func decode<T: Codable>(_ file : String) -> T{
        //1. Locate the json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) from the bundel")
        }
        //2. Create a Property for the Data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load data from \(file) in the bundel")
        }
        //3. Create a Decoder
        let decoder = JSONDecoder()
        
        //4. Create a property for decoded data
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from the bundel")
        }
        //5. Retur a Data
        return loadedData
        
    }
}
