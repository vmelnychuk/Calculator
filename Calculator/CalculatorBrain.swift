//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Vasyl Melnychuk on 10/28/16.
//  Copyright © 2016 Magenta Margin. All rights reserved.
//

import Foundation

class CalculatorBrain
{
    private var accumulator = 0.0
    
    func setOperant(operand: Double) {
        accumulator = operand
    }
    
    func performOperation(symbol: String) {
        switch symbol {
        case "π": accumulator = M_PI
        case "√": accumulator = sqrt(accumulator)
        default:
            break
        }
    }
    
    var result: Double {
        get {
            return accumulator
        }
    }
}
