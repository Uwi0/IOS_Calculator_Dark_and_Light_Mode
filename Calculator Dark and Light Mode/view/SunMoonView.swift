import SwiftUI

struct SunMoonView: View {
    
    var lightMode: Bool
    
    var sunColor: Color {
        lightMode ? sunOrMoonSelectedColor : sunOrMoonNotSelectedColor
    }
    
    var moonColor: Color {
        lightMode ? sunOrMoonNotSelectedColor : sunOrMoonSelectedColor
    }
    
    var body: some View {
        HStack(spacing: 30) {
            Image(systemName: "sun.min")
                .imageScale(.large)
                .foregroundStyle(sunColor)

            
            Image(systemName: "moon")
                .imageScale(.large)
                .foregroundStyle(moonColor)

        }
        .padding()
        .font(UIDevice.isIpad ? .title : .body)
        .fontWeight(UIDevice.isIpad ? .semibold : .regular)
        .background(secondaryBackgroundColor)
        .cornerRadius(20)
    }
}

#Preview {
    VStack {
        SunMoonView(lightMode: true)
        SunMoonView(lightMode: false)
    }
}
