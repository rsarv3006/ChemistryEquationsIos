import LaTeXSwiftUI
import SwiftUI
import ChemistryEquationsBackbone

struct HomeScreen: View {
//    @EnvironmentObject var storekitStore: StorekitStore
    @State private var selectedEquation: Equation? = nil
    @State private var isLoadingStorekit = true
    let equations = getEquations()
    
    var body: some View {
        if !isLoadingStorekit {
            VStack {
                ZStack {
                    HStack {
                        Spacer()
                        
                        NavigationLink(destination: SettingsScreen()) {
                            Image(systemName: "gear.circle")
                                .font(.title2)
                                .foregroundStyle(Color.accentColor)
                        }
                        .padding([.trailing])
                    }
                    
                    Text("Construction Equations")
                        .font(.title2)
                        .foregroundStyle(Color.accentColor)
                }
                
                Rectangle()
                    .fill(Color.accentColor)
                    .frame(height: 1)
                
                ScrollView {
                    ForEach(equations, id: \.title) { section in
                        Section(header:
                                    HStack {
                            Text(section.title)
                                .font(.title3)
                                .foregroundStyle(Color.accentColor)
                                .padding(.horizontal)
                            Spacer()
                        }) {
                            ForEach(section.equations, id: \.id) { equation in
                                HomeScreenEquationButton(equation: equation, selectedEquation: $selectedEquation)
                            }
                            .padding(.bottom)
                        }
                    }
                }
                .navigationDestination(isPresented: Binding<Bool>(
                    get: { selectedEquation != nil },
                    set: { _ in selectedEquation = nil }
                )) {
                    if let equation = selectedEquation {
                        EquationTabView(equation: equation)
                    }
                }
            }
        } else {
            ProgressView()
                .onAppear {
                    Task {
//                        await storekitStore.updateCustomerProductStatus()
                        isLoadingStorekit = false
                    }
                }
        }
    }
}


#Preview {
    HomeScreen()
//        .environmentObject(StorekitStore())
}
