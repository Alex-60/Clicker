//
//  GameManager.swift
//  Clicker
//
//  Created by Alexandre Legros on 22/03/2022.
//

import Foundation

    class GameManager: ObservableObject {

    @Published var bestScore = 0
    @Published var playerBestScoreName = ""
    @Published var playerList: [Player] = []

    func gameDidFinish(click: Int, player: String) {
        if click >= bestScore {
            bestScore = click
            playerBestScoreName = player
        }
        playerList.append(Player(name: player, score: click))
        playerList.sort { result1, result2 in
            result1.score > result2.score
        }
    }

    func removePlayerList() {
        bestScore = 0
        playerList.removeAll()
    }
}
