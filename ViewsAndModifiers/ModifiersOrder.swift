//
//  ModifiersOrder.swift
//  ViewsAndModifiers
//
//  Created by tibo on 31/10/2021.
//

import SwiftUI

struct ModifiersOrder: View {
    var body: some View {
        
        VStack {
            Button("Hello, world!") {
                print(type(of: self.body)) // will print in the target console the exact type this ModifiersOrder instance's body, which will match the type of the Button View /modified, if it's the only View in the Body
            }
            .background(.red)
            .frame(width: 200, height: 200)
            
            // modifiers order are important:
            Button("Hello, world!") {
                print(type(of: self.body)) // will print in the target console the exact type this ModifiersOrder instance's body, which will match the type of the Button View /modified, if it's the only View in the Body
            }.foregroundColor(.white)
            .background(.red)
            .padding()
            .background(.blue)
            .padding()
            .background(.green)
            .padding()
            .background(.yellow)
            .frame(width: 300, height: 300)
            .background(.mint)
        }
    }
}

struct ModifiersOrder_Previews: PreviewProvider {
    static var previews: some View {
        ModifiersOrder()
    }
}
