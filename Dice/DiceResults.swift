//
//  DiceResults.swift
//  Dice
//
//  Created by Esben Viskum on 02/06/2021.
//

import SwiftUI

struct DiceResults: View {
    @ObservedObject var rollDiceVM: DiceViewModel
    
    var body: some View {
            List(rollDiceVM.diceResults, id: \.self) { diceResult in
                Text("\(diceResult)")
            }
    }
}

struct DiceResults_Previews: PreviewProvider {
    static var previews: some View {
        DiceResults(rollDiceVM: DiceViewModel())
    }
}
