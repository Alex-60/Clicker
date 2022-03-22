//
//  Player.swift
//  Clicker
//
//  Created by Alexandre Legros on 17/02/2022.
//

import Foundation

struct Player: Identifiable {
    var id = UUID()
    let name: String
    let score: Int
}
