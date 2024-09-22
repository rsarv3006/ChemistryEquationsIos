//
//  ChemistryEquationsApp.swift
//  ChemistryEquations
//
//  Created by Robert J. Sarvis Jr on 9/12/24.
//

import SwiftUI
import ChemistryEquationsBackbone

@main
struct ChemistryEquationsApp: App {
    @StateObject private var storekitStore = StorekitStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(storekitStore)
        }
    }
}
