import Foundation

struct RowOfCalcButtonsModel: Identifiable {
    let id = UUID()
    let row: [CalcButtonModel]
}

let buttonData: [RowOfCalcButtonsModel] = [
    RowOfCalcButtonsModel(row: [
        CalcButtonModel(calcButton: .clear,color: foregroundTopButtonsColor),
        CalcButtonModel(calcButton: .negative,color: foregroundTopButtonsColor),
        CalcButtonModel(calcButton: .percent,color: foregroundTopButtonsColor),
        CalcButtonModel(calcButton: .divide,color: foregroundRightButtonsColor)
    ]),
    RowOfCalcButtonsModel(row: [
        CalcButtonModel(calcButton: .seven),
        CalcButtonModel(calcButton: .eight),
        CalcButtonModel(calcButton: .nine),
        CalcButtonModel(calcButton: .multiply, color: foregroundRightButtonsColor)
    ]),
    RowOfCalcButtonsModel(row: [
        CalcButtonModel(calcButton: .four),
        CalcButtonModel(calcButton: .five),
        CalcButtonModel(calcButton: .six),
        CalcButtonModel(calcButton: .subtract,color: foregroundRightButtonsColor)
    ]),
    RowOfCalcButtonsModel(row: [
        CalcButtonModel(calcButton: .one),
        CalcButtonModel(calcButton: .two),
        CalcButtonModel(calcButton: .three),
        CalcButtonModel(calcButton: .add,color: foregroundRightButtonsColor)
    ]),
    RowOfCalcButtonsModel(row: [
        CalcButtonModel(calcButton: .undo),
        CalcButtonModel(calcButton: .zero),
        CalcButtonModel(calcButton: .decimal),
        CalcButtonModel(calcButton: .equal, color: foregroundRightButtonsColor)
    ])
]
