//
//  DiceViewModel.swift
//  Dice
//
//  Created by Esben Viskum on 02/06/2021.
//

import Foundation

class DiceViewModel: ObservableObject {
    @Published var currentDice = Dice()
    @Published var currentDiceFace = 0
    @Published var diceResults: [Int] = []
    @Published var isDiceRolling = false
    
    @Published var isEnding1 = false
    @Published var isEnding2 = false
    

    
    private var clockTicks = 0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var outstandingDiceFaces: Int {
        currentDice.rollDiceNumbers.count
    }
    
    var currentDiceFaceString: String {
        if currentDiceFace == 0 { return "Roll" }
        return String(currentDiceFace)
    }
    
    var isTapEnabled: Bool {
        if isDiceRolling || isEnding1 || isEnding2 { return false }
        return true
    }
    
    func rollDice() {
        currentDice.rollDice()
        isDiceRolling = true
    }
    
    func popNumber() {
        if let diceFace = currentDice.popNumber() {
            currentDiceFace = diceFace
        }
        if outstandingDiceFaces == 0 {
            diceResults.insert(currentDiceFace, at: 0)
            isDiceRolling = false
            isEnding1 = true
        }
    }
    
    func reset() {
        diceResults = []
    }
    
    func clockTick() {
        if isDiceRolling {
            clockTicks += 1
            if clockTicks > 20 / (outstandingDiceFaces + 1) {
                popNumber()
                clockTicks = 0
            }
        }
    }
    
}
