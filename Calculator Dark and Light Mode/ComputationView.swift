import SwiftUI

struct ComputationView: View {
    
    let currentComputation: String
    let mainResult: String
    
    var body: some View {
        VStack {
            Text("computation view")
            Text(currentComputation)
            Text(mainResult)
        }
        
    }
}

#Preview {
    ComputationView(currentComputation: "hello", mainResult: "world")
}
