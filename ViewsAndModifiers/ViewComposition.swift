//
//  ViewComposition.swift
//  ViewsAndModifiers
//
//  Created by tibo on 31/10/2021.
//

import SwiftUI

// let's extract the capsule out of the body:
struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
//            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .clipShape(Capsule())
            .border(Color.mint)
            
    }
}

struct ViewComposition: View {
    var body: some View {
        VStack {
            
            // that is very long (lots of lines) and less readable
            Text("First")
                .padding()
                .foregroundColor(.white)
                .background(.blue)
                .clipShape(Capsule())
                .border(Color.mint)

            Text("Second")
                .padding()
                .foregroundColor(.yellow)
                .background(.blue)
                .clipShape(Capsule())
                .border(Color.mint)
            
            
            // doing the same with 2 lines of codes:
            CapsuleText(text: "Third")
            CapsuleText(text: "Fourth")
                .foregroundColor(.yellow) // has no effect because this environment modifier is already used in the custom View and is overridden by the child
                .font(.caption) // will have effect as an environment modifier if this type of modifier is not yet used and overriden in the Custom View
                .padding() // you can always add more padding
                .border(Color.red) // while this type of modifier is already used in the custom view, here it applies to the padded View one line above, not on the Text declared in the custom View
        }
    }
}

struct ViewComposition_Previews: PreviewProvider {
    static var previews: some View {
        ViewComposition()
    }
}
