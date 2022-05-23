//
//  ContentView.swift
//  TicTacToe
//
//  Created by Ilya Zelkin on 23.05.2022.
//  Copyright © 2022 Ilya Zelkin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @StateObject var ticTacToeModel = TicTacToeModel()
    @State var gameOver : Bool = false
    
    func buttonAction(_ index : Int) {
        _ = self.ticTacToeModel.makeMove(index: index, player: .home)
        self.gameOver = self.ticTacToeModel.gameOver.1
    }
    
    var body: some View {
        Color.gray.opacity(0.3)
            .edgesIgnoringSafeArea(.all)
            .overlay(
        VStack {
            Text("Tic Tac Toe")
                .bold()
                .foregroundColor(Color.black.opacity(0.7))
                .padding(.bottom)
                .font(.title2)
            ForEach(0 ..< ticTacToeModel.squares.count / 3, id: \.self, content: {
                row in
                HStack {
                    ForEach(0 ..< 3, content: {
                        column in
                        let index = row * 3 + column
                        SquareView(dataSource: ticTacToeModel.squares[index], action: {self.buttonAction(index)})
                    })
                }
            })
        }.alert(isPresented: self.$gameOver, content: {
            Alert(title: Text("Game Over"),
                  message: Text(self.ticTacToeModel.gameOver.0 != .empty ? self.ticTacToeModel.gameOver.0 == .home ? "You Win!": "AI Wins!" : "Nobody Wins" ) , dismissButton: Alert.Button.destructive(Text("OK"), action: {
                    self.ticTacToeModel.resetGame()
                  }))
        }))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
