//
//  CalculateButtonView.swift
//  Calculator Dark and Light Mode
//
//  Created by dwi prasetyo on 30/08/24.
//

import SwiftUI

struct CalculateButtonView: View {
    
    @Binding var currentComputation: String
    @Binding var mainResult: String
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CalculateButtonView(
        currentComputation: .constant("hello"),
        mainResult: .constant("world")
    )
}
