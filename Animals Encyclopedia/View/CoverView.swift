//
//  CoverView.swift
//  Animals Encyclopedia
//
//  Created by Admin on 23/12/22.
//

import SwiftUI

struct CoverView: View {
//    MARK: PROPERTYS
    let coverImages : [CoverImageModel] = Bundle.main.decode("covers.json")
    
    
//    MARK: BODY
    var body: some View {
        
        TabView(){
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            } // LOOP 
        }// TABVIEW
        .tabViewStyle(PageTabViewStyle())
    }
}

//    MARK: PREVIEW
struct CoverView_Previews: PreviewProvider {
    static var previews: some View {
        CoverView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
