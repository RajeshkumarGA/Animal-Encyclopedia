//
//  ContentView.swift
//  Animals Encyclopedia
//
//  Created by Admin on 22/12/22.
//

import SwiftUI

struct ContentView: View {
//    MARK: PROPEERTYS
    let animals : [Animal] = Bundle.main.decode("animals.json")
    @State private var isGridViewActive : Bool = false
    let haptics = UIImpactFeedbackGenerator(style: .medium)
//    let gridLayout : [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    @State var gridLayout : [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn : Int = 1
    @State private var toolBarIcon : String = "square.grid.2x2"
    
    
// FUNCTIONS
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid Number : \(gridColumn)")
        
        switch gridColumn{
        case 1 :
            toolBarIcon = "square.grid.2x2"
        case 2:
            toolBarIcon = "square.grid.3x2"
        case 3:
            toolBarIcon = "rectangle.grid.1x2"
        default:
            toolBarIcon = "square.grid.2x2"
        }
    }
//    MARK: BODY
    var body: some View {
       
        NavigationView{
            Group{
                if !isGridViewActive {
                    List{
                        CoverView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)){
                                AnimalListItemView(animal: animal)
                            }
                        }
                    } // LIST
                } else {
                    ScrollView(.vertical, showsIndicators: false){
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10){
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)){
                                    AnimalGridItemView(animal: animal)
                                } // NaviigationLink
                            } // Loop
                        }// Grid
                        .padding(10)
                        .animation(.easeIn , value: UUID())
                    }//Scrool
                }//Condition
            }// Group
            .navigationBarTitle("Africa", displayMode: .large)
            .navigationViewStyle(StackNavigationViewStyle())
            .listStyle(.plain)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    HStack(spacing: 16, content: {
                        Button(action: {
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        })
                        
                        Button(action: {
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        }, label: {
                            Image(systemName: toolBarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary )
                        })
                    })
                })
            })
        
        }// NavigationView
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
