import LaTeXSwiftUI
import SwiftUI
import ChemistryEquationsBackbone

let decimalFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.maximumFractionDigits = 4
    return formatter
}()

struct EquationScreen: View {
    var equation: Equation

    @State private var values: [Double] = []

    init(equation: Equation) {
        self.equation = equation
        _values = State(initialValue: Array(repeating: 0, count: equation.fieldLabels.count))
    }

    var body: some View {
        ScrollView {
            VStack {
                LaTeX(equation.title)
                    .font(.title2)
                    .foregroundColor(.accentColor)
                    .padding()

                ForEach(0 ..< equation.fieldLabels.count, id: \.self) { i in
                    HStack {
                        Text(equation.fieldLabels[i])
                            .font(.title2)
                            .foregroundStyle(Color.accentColor)
                            .padding(.trailing, 42)

                        Spacer()

                        if equation.fieldLabels.count - 1 == i {
                            Text(String(describing: $values[i].wrappedValue))
                                .foregroundStyle(Color.accentColor)
                                .font(.title3)
                                .padding(.top, 4)
                        } else {
                            TextField("Enter value", value: $values[i], formatter: decimalFormatter)
                                .foregroundStyle(Color.accentColor)
                                .disabled(equation.fieldLabels.count - 1 == i)
                                .padding(12)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.accentColor, lineWidth: 1)
                                )
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.clear)
                                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                                )
                                .frame(maxWidth: 120)
                        }
                    }
                    .padding(.horizontal)
                }

                Button(action: {
                    let inputValues = values
                    _ = inputValues.dropLast()

//                    values[equation.fieldLabels.count - 1] = equation.equation(inputValues)
                }, label: {
                    Text("Calculate")
                        .font(.title)
                })
                .padding()
            }
        }
    }
}
