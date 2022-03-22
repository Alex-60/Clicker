//
//  ContentView.swift
//  Clicker
//
//  Created by Alexandre Legros on 09/02/2022.
//

import SwiftUI

struct ContentView: View {
    @State var numberOfClick = 0
    @State var gameIsInProgress = false
    @State var currentPlayer = ""
    @State var playerList: [Player] = []
    @AppStorage("bestScore") var bestScore = 0
    @AppStorage("playerBestScoreName") var playerBestScoreName = ""

    var body: some View {
        VStack {
            if bestScore > 0 {
                BestScoreView(title: "Meilleur Score", newBestScore: $bestScore, playerName: $playerBestScoreName)
            }
            if gameIsInProgress {
                Text("Joueur actuel : \(currentPlayer)")
                ScoreInProgressView(clickInProgress: $numberOfClick)
                GameInProgressView(clickNumber: $numberOfClick)
                Spacer()
            } else {
                VStack {
                    TextField("Pseudo (3 caractères min)", text: $currentPlayer)
                        .padding()
                        .frame(width: 300.0)
                        .textFieldStyle(.roundedBorder)
                    if currentPlayer.count >= 3 {
                        Button("Nouvelle partie", action: initGame)
                    }
                    PlayersListView(playerList: playerList)
                    if playerList.count > 0 {
                        Button("Supprimer les scores", action: removePlayerList)
                    }
                }
            }
        }
    }
    
    func initGame() {
        numberOfClick = 0
        gameIsInProgress = true
        Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false) { _ in
            gameDidFinish()
        }
    }

    func gameDidFinish() {
        gameIsInProgress = false
        if numberOfClick >= bestScore {
            bestScore = numberOfClick
            playerBestScoreName = currentPlayer
        }
        playerList.append(Player(name: currentPlayer,
                                 score: numberOfClick))
    }

    func removePlayerList() {
        bestScore = 0
        playerList.removeAll()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
