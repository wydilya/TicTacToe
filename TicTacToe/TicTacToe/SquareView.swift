//
//  SquareView.swift
//  TicTacToe
//
//  Created by Ilya Zelkin on 23.05.2022.
//  Copyright © 2022 Ilya Zelkin. All rights reserved.
//

import Foundation
import SwiftUI

enum SquareStatus {
    case empty
    case home
    case visitor
}

class Square : ObservableObject {
    @Published var squareStatus : SquareStatus
    
    init(status : SquareStatus) {
        self.squareStatus = status
    }
}

struct SquareView : View {
    @ObservedObject var dataSource : Square
    var action: () -> Void
    var body: some View {
        Button(action: {
            self.action()
        }, label: {
            Text(self.dataSource.squareStatus == .home ?
                    "X" : self.dataSource.squareStatus == .visitor ? "0" : " ")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.purple.opacity(0.9))
                .frame(width: 70, height: 70, alignment: .center)
                .background(Color.yellow.opacity(0.5).cornerRadius(10))
                .padding(4)
        })
    }
}
