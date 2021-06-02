//
//  RollDiceView.swift
//  Dice
//
//  Created by Esben Viskum on 02/06/2021.
//

import SwiftUI

struct RollDiceView: View {
    @ObservedObject var rollDiceVM: DiceViewModel
    @State var fontScale: CGFloat = 1.0
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .overlay(
                Text(rollDiceVM.currentDiceFaceString)
                    .font(.system(size: 75))
                    .scaleEffect(fontScale)
                    .foregroundColor(.white)
            )
            .frame(width: 150, height: 150)
            .onReceive(rollDiceVM.timer) { _ in
                rollDiceVM.clockTick()
                if rollDiceVM.isEnding1 {
                    withAnimation {
                        fontScale = 3.0
                        rollDiceVM.isEnding1 = false
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                            rollDiceVM.isEnding2 = true
                        }
                    }
                }
                if rollDiceVM.isEnding2 {
                    withAnimation {
                        fontScale = 1.0
                        rollDiceVM.isEnding2 = false
                    }
                }
            }
            .onTapGesture {
                if rollDiceVM.isTapEnabled { rollDiceVM.rollDice() }
            }
    }
}

struct RollDiceView_Previews: PreviewProvider {
    static var previews: some View {
        RollDiceView(rollDiceVM: DiceViewModel())
    }
}
