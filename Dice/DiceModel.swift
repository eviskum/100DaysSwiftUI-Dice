//
//  DiceModel.swift
//  Dice
//
//  Created by Esben Viskum on 02/06/2021.
//

import Foundation

struct Dice {
    var diceSize: Int {
        switch diceSizeText {
        case "4":
            return 4
        case "6":
            return 6
        case "10":
            return 10
        case "12":
            return 12
        case "20":
            return 20
        default:
            return 100
        }
    }
    var rollDiceNumbers: [Int] = []
    
    var diceSizeText = "6"
    
    mutating func rollDice() {
        rollDiceNumbers = (0..<20).map{ _ in Int.random(in: 1...diceSize) }
    }
    
    mutating func popNumber() -> Int? {
        if rollDiceNumbers.isEmpty { return nil }
        return rollDiceNumbers.removeFirst()
    }
/*
    mutating func setDiceSize(sizeIdx: Int) {
        switch sizeIdx {
        case 0:
            diceSize = 4
        case 1:
            diceSize = 6
        case 2:
            diceSize = 10
        case 3:
            diceSize = 12
        case 4:
            diceSize = 20
        default:
            diceSize = 100
        }
    } */
}

