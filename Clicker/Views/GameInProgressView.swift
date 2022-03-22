//
//  GameInProgressView.swift
//  Clicker
//
//  Created by Alexandre Legros on 10/02/2022.
//

import SwiftUI

struct GameInProgressView: View {
    @Binding var clickNumber: Int

    var body: some View {
        Image(systemName: "plus.circle")
            .foregroundColor(.yellow)
            .font(.title)
            .onTapGesture {
                clickNumber += 1
            }
    }
}

struct GameInProgressView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GameInProgressView(clickNumber: .constant(10))
                .previewLayout(.sizeThatFits)
            GameInProgressView(clickNumber: .constant(10))
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
    }
}
