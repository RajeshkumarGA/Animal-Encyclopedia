//
//  AnimalDetailView.swift
//  Animals Encyclopedia
//
//  Created by Admin on 23/12/22.
//

import SwiftUI

struct AnimalDetailView: View {
//    MARK: PROPERTYS
    let animal : Animal
    
//    MARK: BODY
    var body: some View {
        ScrollView(.vertical){
            VStack(alignment: .center, spacing: 20) {
                // HERO IMAGE
                Image(animal.image)
                    .resizable()
                    .scaledToFill()
                
                // TITLE
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                
                // HEADLINE
                
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .fontWeight(.medium)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                // GALLERY
                Group{
                    HeadingView(headingText: "Wilderness in Pictures", headingImage: "photo.on.rectangle.angled")
                    
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                // FACTS
                Group{
                    HeadingView(headingText: "Did you Know?", headingImage: "questionmark.circle")
                    InsetFactsView(facts: animal.fact)
                }
                
                // DESCRIPTION
                Group{
                    HeadingView(headingText: "All about \(animal.name)", headingImage: "info.circle")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal)
                        .layoutPriority(1)
                }
                
                // MAP
                Group{
                    HeadingView(headingText: "National Parks", headingImage: "map")
                    InsetMapView()
                }
                .padding(.horizontal)
                
                // LINK
                Group{
                    HeadingView(headingText: "Learn More", headingImage: "books.vertical")
                    ExternalWebLinkView(animal: animal)
                    Image("launch-screen-image")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                }
                .padding(.horizontal)
                
                
            }// Vstack
            .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
        } // ScroolView
    }
}
//    MARK: PREVIEW
struct AnimalDetailView_Previews: PreviewProvider {
    static let animals : [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        NavigationView{
            AnimalDetailView(animal: animals[0])
        }
    }
}
