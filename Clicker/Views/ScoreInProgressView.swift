//
//  ScoreInProgressView.swift
//  Clicker
//
//  Created by Alexandre Legros on 10/02/2022.
//

import SwiftUI

struct ScoreInProgressView: View {
    @Binding var clickInProgress: Int
    
    var body: some View {
        Text("Score : \(clickInProgress)")
            .padding()
            .font(.title)
    }
}

struct ScoreInProgressView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ScoreInProgressView(clickInProgress: .constant(10))
                .previewLayout(.sizeThatFits)
            ScoreInProgressView(clickInProgress: .constant(10))
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
    }
}
