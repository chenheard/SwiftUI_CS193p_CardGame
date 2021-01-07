//
//  EmojiMemoryGame.swift
//  SwiftUI_Day3
//
//  Created by 陈金雷 on 2021/1/6.
//

import Foundation


class EmojiMemoryGame:ObservableObject{
  @Published  private   var model:MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
  private  static func createMemoryGame() -> MemoryGame<String>{
        let emojis:Array<String> = ["👻","🎃","🕷"]
        return  MemoryGame<String>(numberOfPairsOfCards: emojis.count){ pairIndex in
        return emojis[pairIndex]
      }
    }
    //MARK : Access to the model
    var cards:Array<MemoryGame<String>.Card>{
        model.cards
    }
    
    func choose(card:MemoryGame<String>.Card){
        
        model.choose(card:card)
    }
    
    func resetGame(){
        model = EmojiMemoryGame.createMemoryGame()
    }
}
