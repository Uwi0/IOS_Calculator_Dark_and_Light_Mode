import SwiftUI

struct MainCalculatorView: View {
    
    @State var lightMode: Bool = true
    @State var currentComputation: String = ""
    @State var mainResult: String = "0"
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
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
                    ).padding(
                        .horizontal,
                        UIDevice.isIpad ? width * 0.1 : 0
                    )
                    
                    Spacer()
                    
                    CalculateButtonView(
                        currentComputation: $currentComputation,
                        mainResult: $mainResult,
                        width: width
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
}

#Preview {
    MainCalculatorView()
}
