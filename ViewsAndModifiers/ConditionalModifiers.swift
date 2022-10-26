//
//  ConditionalModifiers.swift
//  ViewsAndModifiers
//
//  Created by tibo on 31/10/2021.
//

import SwiftUI

struct ConditionalModifiers: View {
    
    @State private var useRedText = false
    
    var body: some View {
        VStack(spacing: 20){
            Button("Hello World") {
                // flip the Boolean between true and false
                useRedText.toggle()
            }
            .foregroundColor(useRedText ? .red : .blue)
            // this is the best way to apply a modifier depending on a certain condition
            
            
            // Sometimes you cannot avoid using a if-else statement
            // But what SwiftUI does in this case is that it destroys one Button to create the other one and vice versa
            // This ends up in a slightly different transition when tapping on it (zoom in the live preview to get it)
            if useRedText {
                Button("Hello World") {
                    useRedText.toggle()
                }
                .foregroundColor(.red)
            } else {
                Button("Hello World") {
                    useRedText.toggle()
                }
                .foregroundColor(.blue)
            }
        }
    }
}

struct ConditionalModifiers_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalModifiers()
    }
}
