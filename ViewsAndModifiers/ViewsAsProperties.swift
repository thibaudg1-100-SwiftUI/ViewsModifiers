//
//  ViewsAsProperties.swift
//  ViewsAndModifiers
//
//  Created by tibo on 31/10/2021.
//

import SwiftUI

struct ViewsAsProperties: View {
    //stored propertirs that can be use in the Body
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")
    
    // computed property used in Body
    var motto3: some View { // but @ViewBuilder is not silently added like with var body
        Text("Draco dormiens")
    }
    
    // you need to use a stack if it is to be used directly in Body not containning a Stack:
    var spells: some View {
        VStack {
            Text("Lumos")
            Text("Obliviate")
        }
    }
    
    // if you don't want a Stack arrangement, but let the parent View decide of it, just use a Group:
    var spells2: some View {
        Group {
            Text("Lumos")
            Text("Obliviate")
        }
    }
    
    // alternatively add @ViewBuilder: that is the same as the body var
    @ViewBuilder var spells3: some View {
                Text("Lumos")
                Text("Obliviate")
    }
    
    var body: some View {
//        VStack {
//            motto1
//                .foregroundColor(.mint)
//            motto2
//                .foregroundColor(.indigo)
//            motto3
//                .foregroundColor(.yellow)
//        }
//        spells
//            .foregroundColor(.red)
//        spells2 // this will display 2 screens for the Group is not defining any arrangement and the parent view is the directly the body var
//            .foregroundColor(.blue)
        spells3
            .foregroundColor(.mint)
    }
}

struct ViewsAsProperties_Previews: PreviewProvider {
    static var previews: some View {
        ViewsAsProperties()
    }
}
