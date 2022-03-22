//
//  BestScoreView.swift
//  Clicker
//
//  Created by Alexandre Legros on 10/02/2022.
//

import SwiftUI

struct BestScoreView: View {
    let title: String
    @Binding var newBestScore: Int
    @Binding var playerName: String

    var body: some View {
        VStack {
            Text("\(title) : \(newBestScore)")
                .font(.title)
            Text("Réalisé par : \(playerName)")
        }
        .padding()
    }
    
}

struct BestScoreView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BestScoreView(title: "Meilleur scrore", newBestScore: .constant(5), playerName: .constant("Alex"))
                .previewLayout(.sizeThatFits)
            BestScoreView(title: "Meilleur scrore", newBestScore: .constant(5), playerName: .constant("Alex"))
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
    }
}
