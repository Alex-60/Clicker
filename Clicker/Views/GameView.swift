//
//  ContentView.swift
//  Clicker
//
//  Created by Alexandre Legros on 09/02/2022.
//

import SwiftUI

struct GameView: View {
    @State var numberOfClick = 0
    @State var gameIsInProgress = false
    @AppStorage("currentPlayer") var currentPlayer = ""

    @StateObject var gameManager = GameManager()

    var isOnFire: Bool {
        guard let bestScore = gameManager.bestScoreGame?.score else { return false }
        return numberOfClick > bestScore
    }

    var body: some View {
        VStack {
            if isOnFire {
                BestScoreView(title: "Meilleur Score", bestScore: gameManager.bestScoreGame!.score, playerNameBestScore: gameManager.bestScoreGame!.name)
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
                    PlayersListView(playerList: gameManager.playerList)
                    if gameManager.playerList.count > 0 {
                        Button("Supprimer les scores", action: gameManager.removePlayerList)
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
        gameManager.gameDidFinish(click: numberOfClick, player: currentPlayer)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
