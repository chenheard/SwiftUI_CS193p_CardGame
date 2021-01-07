//
//  SwiftUI_Day3App.swift
//  SwiftUI_Day3
//
//  Created by 陈金雷 on 2021/1/4.
//

import SwiftUI

@main
struct SwiftUI_Day3App: App {
    var body: some Scene {
        WindowGroup {
            let game  = EmojiMemoryGame()
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
