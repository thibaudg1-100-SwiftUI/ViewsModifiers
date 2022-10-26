//
//  Modifiers.swift
//  ViewsAndModifiers
//
//  Created by tibo on 31/10/2021.
//

import SwiftUI

struct Modifiers: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
            .background(.red) // The background of this padded Text View will be red
            // there is no way to color the ContentView itself, it's just a "passe-plat" between the content of the Body and the Root view (currently UIHostController)
            
            // if you want all screen around the Text to be red:
            Text("Hello, world!")
                .frame(maxWidth: .infinity, maxHeight: .infinity) // maxHeight/Width says that the View can use as much space as it wants but doesn't say that it must use all space
                .background(.red)
            
            // or even simpler, use a Color View:
            Color.red // if you use only this Color View in a Body, the entire physical screen is red
        }
        .padding(1) // to avoid the first Text View color leaking in the top unsafe area
    }
}

struct Modifiers_Previews: PreviewProvider {
    static var previews: some View {
        Modifiers()
    }
}
