//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Leticia Rodriguez on 7/15/21.
//

import SwiftUI

struct AnimalDetailView: View {
    // MARK: - Properties
    
    let animal: Animal
    
    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                // HERO IMAGE
                
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                // TITLE
                
                Text(animal.name)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
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
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                // GALLERY
                
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                
                // FACTS
                
                Group {
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    InsetFactView(animal: animal)
                    
                }.padding(.horizontal)
                
                // DESCRIPTION
                
                Group {
                    HeadingView(headingImage: "info.circle",
                                headingText: "All about \(animal.name)")
                    
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                }.padding(.horizontal)
                
                // MAP
                
                Group {
                    HeadingView(headingImage: "map", headingText: "National Parks")
                    InsetMapView()
                }
                .padding(.horizontal)
                
                // LINK
                
                Group {
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                    ExternalWebLinkView(animal: animal)
                } .padding(.horizontal)
                
                
            } //: VSTACK
            .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
        } //: SCROLLVIEW
    }
}

// MARK: - Preview
struct AnimalDetailView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        NavigationView {
            AnimalDetailView(animal: animals[0])
        }
        .previewDevice("iPhone 11 Pro")
    }
}