//
//  BestScoreView.swift
//  Clicker
//
//  Created by Alexandre Legros on 10/02/2022.
//

import SwiftUI

struct BestScoreView: View {
    let title: String
    var bestScore: Int
    var playerNameBestScore: String

    var body: some View {
        VStack {
            Text("\(title) : \(bestScore)")
                .font(.title)
            Text("Réalisé par : \(playerNameBestScore)")
        }
        .padding()
    }
    
}

struct BestScoreView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BestScoreView(title: "Meilleur scrore", bestScore: 10, playerNameBestScore: "Alex")
                .previewLayout(.sizeThatFits)
            BestScoreView(title: "Meilleur scrore", bestScore: 10, playerNameBestScore: "Alex")
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
    }
}
