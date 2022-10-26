//
//  CustomContainers.swift
//  ViewsAndModifiers
//
//  Created by tibo on 01/11/2021.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content // this is a constant that represents closure which take 2 integers as parameters and returns some Content that conforms to the View protocol
    //@ViewBuilder allows you not to wrap your content in a Stack, but which type of Stack: depends on the parent Stack type, in this case the HStack of rows
    var body: some View{
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack{ // here is the parent Stack of 'content'
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

struct CustomContainers: View {
    var body: some View {
        GridStack(rows: 4, columns: 3, content: { row, column in
            // no need for Stack embedding if @ViewBuilder is used
//            HStack{
                Image(systemName: "\(row * 3 + column).circle")
                Text("R\(row)-C\(column)")
//            }
        })
    }
}

struct CustomContainers_Previews: PreviewProvider {
    static var previews: some View {
        CustomContainers()
    }
}
