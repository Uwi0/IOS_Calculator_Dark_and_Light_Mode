import SwiftUI

struct ButtonView: View {
    
    let calcButton: CalcButton
    let fgColor: Color
    let bgColor: Color
    
    private var systemImage: String? {
        let value = calcButton.rawValue
        let predicate = value.contains("IMG")
        let replacedValue = value.replacingOccurrences(of: "IMG", with: "")
        return predicate ? replacedValue : nil
    }
    
    private var textButton: String? {
        let value = calcButton.rawValue
        let predicate = value.contains("IMG")
        return predicate ? nil : value
    }
    
    private let buttonDim: CGFloat = UIScreen.main.bounds.width / 5
    
    
    var body: some View {
        ZStack {
            Text(textButton ?? "")
            Image(systemName: systemImage ?? "")
        }
        .font(.title2)
        .fontWeight(.semibold)
        .frame(width: buttonDim, height: buttonDim)
        .foregroundStyle(fgColor)
        .background(bgColor)
        .clipShape(RoundedRectangle(cornerRadius: 15.0))
        .shadow(color: bgColor.opacity(0.5), radius: 3, x: 5, y: 5)
        
    }
}

#Preview {
    VStack {
        
        ButtonView(
            calcButton: .undo,
            fgColor: foregroundDigitsColor,
            bgColor: buttonBackgroundColor
        )
        
        ButtonView(
            calcButton: .one,
            fgColor: foregroundDigitsColor,
            bgColor: buttonBackgroundColor
        )
        
        ButtonView(
            calcButton: .percent,
            fgColor: foregroundTopButtonsColor,
            bgColor: buttonBackgroundColor
        )
        
        ButtonView(
            calcButton: .add,
            fgColor: foregroundRightButtonsColor,
            bgColor: buttonBackgroundColor
        )
        
    }
}
