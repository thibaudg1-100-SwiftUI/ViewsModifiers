//
//  EnvironnmentModifiers.swift
//  ViewsAndModifiers
//
//  Created by tibo on 31/10/2021.
//

import SwiftUI

struct EnvironmentModifiers: View {
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text("Gryffindor")
                    .font(.largeTitle) // But the child can override the environment modifier
                // Local modifiers always override environment modifiers from the parent
                Text("Hufflepuff")
                Text("Ravenclaw")
                Text("Slytherin")
            }
            .font(.title) // this is an Environment modifier that applies to all children in the Stack
            
            Spacer()
            VStack{
                Text("Gryffindor")
                    .blur(radius: 0) // has no effect: does not remove the Blur stack modifier
                    .blur(radius: 2) // worst (?): it adds up more blur
                // Local modifiers always override environment modifiers from the parent
                // But .blur is NOT an environment variable
                Text("Hufflepuff")
                Text("Ravenclaw")
                Text("Slytherin")
            }
            .font(.title)
            .blur(radius: 2) // However this is not an environment modifier even if it applies to the children in the Stack as well
            // Because this modifier is not overridable by the children
            // Blur is a regular modifier
            // To know which modifier can be an enviroment modifier, no other way that reading the individual documentation
            
            Spacer()
        }
        
    }
}

struct EnvironmentModifiers_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentModifiers()
    }
}
