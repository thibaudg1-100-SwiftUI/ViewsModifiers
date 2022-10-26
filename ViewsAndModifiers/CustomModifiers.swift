//
//  CustomModifiers.swift
//  ViewsAndModifiers
//
//  Created by tibo on 01/11/2021.
//

import SwiftUI

// a custom Modifier must conform to ViewModifier Protocol
// must have a 'func' called body returning 'some View'
// regualar built-in modifiers can then be applied to the content, which is what the modifier is called on
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

// it's generally a good idea to create an extension to the View protocol when using custom Modifiers:

extension View {
    func titleStyle() -> some View {
        return self.modifier(Title()) // or simply 'modifier(Title())'
    }
}
// you can also only declare an Extension (no custom Struct), but within an extension you can only add methods ('func') and computed properties ('var {}') but No stored properties, which reduce the scope of use for extension-only approach

struct CustomModifiers: View {
    var body: some View {
        VStack(spacing: 25){
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .modifier(Title()) // using here directly the custom Modifier called Title
            // yes there is a modifier called 'modifier' which is used to invoke custom modifiers
            
            Text("Another text")
                .titleStyle() // using throught a dedicated Extension
            
            Color.mint
                .modifier(Watermark(text: "credits"))
            
            Color.indigo
                .watermarked(for: "FranceInter")
            
            Spacer()
        }
    }
}

// here is another example showing that a modifier returns a completely new object conforming to the View protocol and may not only just apply a few trivial modifiers:
struct Watermark: ViewModifier {
    var text: String // here you can define additional containers used for your custom Struct

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content // here is the content the modifier is called on
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

// dedicated extension for the Watermark custom modifier:
extension View {
    func watermarked(for text: String) -> some View{
        modifier(Watermark(text: text))
    }
}

struct CustomModifiers_Previews: PreviewProvider {
    static var previews: some View {
        CustomModifiers()
    }
}
