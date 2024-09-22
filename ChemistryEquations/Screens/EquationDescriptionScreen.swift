import LaTeXSwiftUI
import SwiftUI
import ChemistryEquationsBackbone

struct EquationDescriptionScreen: View {
    var equation: Equation

    var body: some View {
        ScrollView {
            LaTeX(equation.title)
                .font(.title2)
                .foregroundColor(.accentColor)
                .padding()

            LaTeX(equation.description)
                .foregroundColor(.accentColor)
                .padding()
        }
    }
}
