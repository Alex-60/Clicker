//
//  GameManager.swift
//  Clicker
//
//  Created by Alexandre Legros on 22/03/2022.
//

import Foundation

class GameManager: ObservableObject {

    @Published var playerList: [Player] = []
    var bestScoreGame: Player? { playerList.first }

    func gameDidFinish(click: Int, player: String) {
        objectWillChange.send()
        playerList.append(Player(name: player, score: click))
        playerList.sort { result1, result2 in
            result1.score > result2.score
        }
    }

    func removePlayerList() {
        objectWillChange.send()
        playerList.removeAll()
    }
}
