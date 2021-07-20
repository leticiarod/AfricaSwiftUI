//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Leticia Rodriguez on 7/20/21.
//

import SwiftUI

struct ExternalWebLinkView: View {
    
    let animal: Animal
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.right.square")
                    Link(animal.name,
                         destination: (URL(string: animal.link) ?? URL(string: "https://www.wikipedia.org/"))!)
                }
                .foregroundColor(.accentColor)
            } //: HSTACK
            
        } //: GroupBox
    }
}

struct ExternalWebLinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        ExternalWebLinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
