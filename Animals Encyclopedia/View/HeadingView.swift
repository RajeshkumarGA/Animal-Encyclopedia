//
//  HeadingView.swift
//  Animals Encyclopedia
//
//  Created by Admin on 23/12/22.
//

import SwiftUI

struct HeadingView: View {
    var headingText : String
    var headingImage : String
    var body: some View {
        HStack(alignment: .center, spacing: 10){
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.primary)
        }
        .padding(.vertical)
    }
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingText: "Wilderness in Pictures", headingImage: "photo.on.rectangle.angled")
            .previewLayout(.sizeThatFits)
    }
}
