//
//  InsetFactsView.swift
//  Animals Encyclopedia
//
//  Created by Admin on 23/12/22.
//

import SwiftUI

struct InsetFactsView: View {
    var facts : [String]
    var body: some View {
        GroupBox {
            TabView(){
                
                ForEach(facts , id: \.self) { item in
                    Text(facts[0])
                        .multilineTextAlignment(.center)
                }
            }
            .tabViewStyle(.page)
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }
        .padding(.horizontal)
    }
}

struct InsetFactsView_Previews: PreviewProvider {
    static let animals : [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetFactsView(facts: animals[0].fact)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
