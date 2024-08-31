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
        .background(
            secondaryBackgroundColor
                .cornerRadius(UIDevice.isIpad ? 50 : 20)
        )
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
            if fieldIsNotValid() {
                return
            }
            calculateResult(calcButton: calcButton)
        case .decimal:
            changeCurrentValueToDecimal()
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
            appendToCurrentComputation(calcButton: calcButton)
        }
    }
    
    private func appendToCurrentComputation(calcButton: CalcButton) {
        currentComputation += calcButton.rawValue
    }
    
    private func fieldIsNotValid() -> Bool {
        let fieldIsEmpty = currentComputation.isEmpty
        let lastCharIsAnOperator = lastCharacterIsAnOperator(str: currentComputation)
        return fieldIsEmpty || lastCharIsAnOperator
    }
    
    
    private func calculateResult(calcButton: CalcButton) {
        let sign = calcButton == .negative ? -1.0 : 1.0
        let computationValue = computeCurrentComputation()
        mainResult = formatResult(value: sign * computationValue)
        
        if calcButton == .negative {
            currentComputation = mainResult
        }
    }
    
    private func computeCurrentComputation() -> Double {
        let formattedValue = reformatCurrentComputation()
        let expr = NSExpression(format: formattedValue)
        let exprValue = expr.expressionValue(with: nil, context: nil) as! Double
        return exprValue
    }
    
    private func reformatCurrentComputation() -> String {
        let visibleWorking: String = currentComputation
        var workings = visibleWorking.replacingOccurrences(of: "%", with: "*0.01")
        workings = workings.replacingOccurrences(of: multiplySymbol, with: "*")
        workings = workings.replacingOccurrences(of: divisionSymbol, with: "/")
        if getlastCharOrEmptyOf(str: visibleWorking) == "." {
            workings += "0"
        }
        return workings
    }
    

    
    private func changeCurrentValueToDecimal(){
        if let lastOccurentOfDecimal = currentComputation.lastIndex(of: ".") {
            if lastCharisDigit(str: currentComputation) {
                addDigitIntoLastNumber(lastOccurentOfDecimal)
            }
        } else {
            if currentComputation.isEmpty {
                currentComputation += "0."
            }else if lastCharisDigit(str: currentComputation) {
                currentComputation += "."
            }
        }
    }
    
    private func addDigitIntoLastNumber(_ lastOccurentOfDecimal: String.Index) {
        let startIndex = currentComputation.index(lastOccurentOfDecimal, offsetBy: 1)
        let endIndex = currentComputation.endIndex
        let range = startIndex ..< endIndex
        let rightSubString = String(currentComputation[range])
        
        if Int(rightSubString) == nil && !rightSubString.isEmpty {
            currentComputation += "."
        }
    }
}

#Preview {
    CalculateButtonView(
        currentComputation: .constant("hello"),
        mainResult: .constant("world")
    )
}
