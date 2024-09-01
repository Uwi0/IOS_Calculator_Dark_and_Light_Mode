import SwiftUI

struct ButtonView: View {
    
    let calcButton: CalcButton
    let fgColor: Color
    let bgColor: Color
    let width: CGFloat
    
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
    
    private var buttonDim: CGFloat {
        UIDevice.isIpad ? width / 6 : width / 5
    }
    
    
    var body: some View {
        ZStack {
            Text(textButton ?? "")
            Image(systemName: systemImage ?? "")
        }
        .font(UIDevice.isIpad ? .largeTitle : .title2)
        .fontWeight(UIDevice.isIpad ? .heavy : .semibold)
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
            bgColor: buttonBackgroundColor, 
            width: 375
        )
        
        ButtonView(
            calcButton: .one,
            fgColor: foregroundDigitsColor,
            bgColor: buttonBackgroundColor,
            width: 375
        )
        
        ButtonView(
            calcButton: .percent,
            fgColor: foregroundTopButtonsColor,
            bgColor: buttonBackgroundColor,
            width: 375
        )
        
        ButtonView(
            calcButton: .add,
            fgColor: foregroundRightButtonsColor,
            bgColor: buttonBackgroundColor,
            width: 375
        )
        
    }
}
