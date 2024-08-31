import SwiftUI

struct MainCalculatorView: View {
    
    @State var lightMode: Bool = true
    @State var currentComputation: String = ""
    @State var mainResult: String = "0"
    
    var body: some View {
        let padding: CGFloat = UIDevice.isIpad ?
            UIScreen.main.bounds.width * 0.1 : 0
        ZStack {
            primaryBackgroundColor.ignoresSafeArea()
            VStack {
                
                SunMoonView(lightMode: lightMode)
                    .onTapGesture {
                        withAnimation {
                            lightMode.toggle()
                        }
                    }
                
                Spacer()
                
                ComputationView(
                    currentComputation: currentComputation,
                    mainResult: mainResult
                ).padding(.horizontal, padding)
                
                Spacer()
                
                CalculateButtonView(
                    currentComputation: $currentComputation,
                    mainResult: $mainResult
                )
                
                if UIDevice.isIpad {
                    Spacer()
                }
                
            }
            .padding()
        }
        .environment(\.colorScheme, lightMode ? .light : .dark)
    }
}

#Preview {
    MainCalculatorView()
}
