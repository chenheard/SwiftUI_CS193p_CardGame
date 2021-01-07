//
//  EmojiMemoryGameView.swift
//  SwiftUI_Day3
//
//  Created by 陈金雷 on 2021/1/4.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel:EmojiMemoryGame
    
    var body: some View {
        VStack{
            Grid(items:viewModel.cards){ card in
                CardView(card: card)
                    .onTapGesture {
                        withAnimation(.linear(duration:0.75)){
                            self.viewModel.choose(card: card)
                        }
                    }
                    .padding(5)
            }
            .padding()
            .foregroundColor(Color.orange)
            Button(action: {
                withAnimation(.easeOut(duration:1)){
                    self.viewModel.resetGame()
                }
                
            }, label: {
                Text("New Game")
            })
        }
    }
    
    
}



struct CardView: View {
    var card:MemoryGame<String>.Card
    var body: some View {
        GeometryReader{ geometry in
            self.body(for: geometry.size)
        }
    }
    @State private var animatedBonusRemaining:Double = 0
    
    private func startBonusTimeAnimation(){
        animatedBonusRemaining = card.bonusRemaining
        withAnimation(.linear(duration:card.bonusRemaining)){
            animatedBonusRemaining = 0
        }
    }
    
    @ViewBuilder
    private func  body(for size:CGSize)->some View {
        if card.isFaceUp || !card.isMatched{
             ZStack{
                Group{
                    if card.isConsumingBonusTime{
                        Pie(startAngle: Angle.degrees(0 - 90), endAngel: Angle.degrees(-animatedBonusRemaining * 360 - 90),clockwise:true)
                            .onAppear{
                                self.startBonusTimeAnimation()
                            }
                    }else{
                        Pie(startAngle: Angle.degrees(0 - 90), endAngel: Angle.degrees(-card.bonusRemaining * 360 - 90),clockwise:true)
                    }
                }
                .padding(5)
                .opacity(0.4)
                .transition(.identity)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
                    .rotationEffect(Angle.degrees(card.isMatched ? 360:0))
                    .animation(card.isMatched  ? Animation.linear(duration: 1).repeatForever(autoreverses: false):.default)
                
            }
            .cardify(isFaceUp: card.isFaceUp)
             .transition(AnyTransition.scale)
        }
    }
  private  func fontSize(for size:CGSize) ->CGFloat{
        min(size.width,size.height) * 0.7
    }
}
