//
//  ConfigureDice.swift
//  Dice
//
//  Created by Esben Viskum on 02/06/2021.
//

import SwiftUI

struct ConfigureDice: View {
    @ObservedObject var rollDiceVM: DiceViewModel
    
    let dices = ["4", "6", "10", "12", "20", "100"]
    
    var body: some View {
        Picker("Vælg terning", selection: $rollDiceVM.currentDice.diceSizeText) {
            ForEach(dices, id: \.self) {
                Text($0)
            }
        }
    }
}

struct ConfigureDice_Previews: PreviewProvider {
    static var previews: some View {
        ConfigureDice(rollDiceVM: DiceViewModel())
    }
}
