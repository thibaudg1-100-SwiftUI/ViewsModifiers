//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by tibo on 31/10/2021.
//

import SwiftUI

struct ProminentTitle: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func prominented() -> some View {
        modifier(ProminentTitle())
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .prominented() // challenge 3 of Project 3
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
