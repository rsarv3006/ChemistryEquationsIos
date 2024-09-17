//
//  ContentView.swift
//  ChemistryEquations
//
//  Created by Robert J. Sarvis Jr on 9/12/24.
//

import SwiftUI

struct ContentView: View {
    let thing = chemistry_equations_backbone.get_equations()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
