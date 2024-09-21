//
//  ContentView.swift
//  ChemistryEquations
//
//  Created by Robert J. Sarvis Jr on 9/12/24.
//

import SwiftUI
import ChemistryEquationsBackbone

struct ContentView: View {
    let equations = getEquations()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text("Hello, world!")
            
            List {
                ForEach(equations, id: \.id) {section in
                    Text("Title: \(section.title)")
                    ForEach(section.equations, id: \.id) {section in
                        Text("Equation: \(section.title)")
                    }
                }
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
