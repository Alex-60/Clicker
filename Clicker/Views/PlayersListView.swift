//
//  PlayersListView.swift
//  Clicker
//
//  Created by Alexandre Legros on 17/02/2022.
//

import SwiftUI

struct PlayersListView: View {
    let playerList: [Player]
    
    var body: some View {
        List(playerList) { player in
            HStack {
                Text(player.name)
                Text("\(player.score)")
            }
        }
    }

}

struct PlayersListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlayersListView(playerList:[])
                .previewLayout(.sizeThatFits)
            PlayersListView(playerList:[])
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
                
        }
    }
}
