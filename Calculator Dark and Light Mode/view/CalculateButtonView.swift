import SwiftUI

typealias ButtonRows = GridRow<ForEach<[CalcButtonModel], UUID, Button<ButtonView>>>

struct CalculateButtonView: View {
    
    @Binding var currentComputation: String
    @Binding var mainResult: String
    
    var body: some View {
        Grid() {
            ForEach(buttonData) { rowOffButtons in
                RowOfCalcButton(rowOffButtons)
            }
        }
        .padding()
        .background(secondaryBackgroundColor.cornerRadius(20))
    }
    
    private func RowOfCalcButton(_ rowOffButtons: RowOfCalcButtonsModel) -> ButtonRows {
        GridRow {
            ForEach(rowOffButtons.row) { btnModel in
                CalcButton(btnModel)
            }
        }
    }
    
    private func CalcButton(_ btnModel: CalcButtonModel) -> Button<ButtonView> {
        Button(
            action: {
                buttonPressed(calcButton: btnModel.calcButton)
            },
            label: {
                ButtonView(
                    calcButton: btnModel.calcButton,
                    fgColor: btnModel.color,
                    bgColor: buttonBackgroundColor
                )
            }
        )
    }
    
    private func buttonPressed(calcButton: CalcButton) {
        switch calcButton {
        case .clear:
            currentComputation = ""
            mainResult = "0"
        case .equal, .negative:
            print("eq/neg")
        case .decimal:
            print("decimal")
        case .percent:
            if lastCharisDigitOrPercent(str: currentComputation) {
                appendToCurrentComputation(calcButton: calcButton)
            }
        case .undo:
            currentComputation = String(currentComputation.dropLast())
        case .add, .subtract, .multiply, .divide:
            if lastCharisDigit(str: currentComputation) {
                appendToCurrentComputation(calcButton: calcButton)
            }
        default:
            //TODO: Need Further implementation
            appendToCurrentComputation(calcButton: calcButton)
        }
    }
    
    private func appendToCurrentComputation(calcButton: CalcButton) {
        currentComputation += calcButton.rawValue
    }
    
}

#Preview {
    CalculateButtonView(
        currentComputation: .constant("hello"),
        mainResult: .constant("world")
    )
}
