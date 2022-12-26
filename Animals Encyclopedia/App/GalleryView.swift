//
//  GalleryView.swift
//  Animals Encyclopedia
//
//  Created by Admin on 22/12/22.
//

import SwiftUI

struct GalleryView: View {
//    MARK: Propertys
    @State var selectedAniimal : String = "lion"
    let animals : [Animal] = Bundle.main.decode("animals.json")
    let haptic = UIImpactFeedbackGenerator(style: .medium)
    // Simple Grid Defenation
//    let gridLayout: [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
    // Effiicent Griid Defeniitiion
//    let gridLayout : [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    // Diinamic GRID Layout
    @State private var gridLayout : [GridItem] = [GridItem(.flexible())]
    @State private var gridColumns : Double = 3.0
    
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumns))
    }
    
//    MARK: BODY
    var body: some View {
        
        // MARK: GRIID
       
        ScrollView(.vertical, showsIndicators: false){
            VStack (alignment: .center, spacing: 30) {
                Image(selectedAniimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
//                MARK Slider
                Slider(value: $gridColumns, in: 2...4, step: 1 )
                    .padding(.horizontal)
                    .onChange(of: gridColumns, perform: {newValue in 
                        gridSwitch()
                    })
                
                LazyVGrid(columns: gridLayout, alignment: .center,spacing: 10, content: {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white , lineWidth: 2))
                            .onTapGesture(perform: {
                                selectedAniimal = item.image
                                haptic.impactOccurred()
                            })
                        
                    }
                }) // Grid
                .animation(.easeOut, value: UUID())
                .onAppear(perform: {
                    gridSwitch()
                })
            } // VStack
           
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(MotionAnimationView())
        
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
