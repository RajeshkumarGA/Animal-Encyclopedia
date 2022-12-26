//
//  MapAnotationView.swift
//  Animals Encyclopedia
//
//  Created by Admin on 25/12/22.
//

import SwiftUI

struct MapAnotationView: View {
    var location : NationalParkLocation
    @State private var aniimation : Double = 0.0
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54 , alignment: .center)
            
            Circle()
                .stroke(Color.accentColor , lineWidth: 2)
                .frame(width: 52,height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(aniimation))
                .opacity(1 - aniimation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
            .clipShape(Circle())
        }// ZSTACK
        .onAppear{
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)){
                aniimation = 1
            }
        }
    }
}

struct MapAnotationView_Previews: PreviewProvider {
    static var locations : [NationalParkLocation] = Bundle.main.decode("locations.json")
    static var previews: some View {
        MapAnotationView(location: locations[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
