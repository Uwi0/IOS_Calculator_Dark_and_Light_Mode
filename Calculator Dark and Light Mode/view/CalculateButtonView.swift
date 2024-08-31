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
            action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
            label: {
                ButtonView(
                    calcButton: btnModel.calcButton,
                    fgColor: btnModel.color,
                    bgColor: buttonBackgroundColor
                )
            }
        )
    }
    
}

#Preview {
    CalculateButtonView(
        currentComputation: .constant("hello"),
        mainResult: .constant("world")
    )
}
