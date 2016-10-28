//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Vasyl Melnychuk on 10/28/16.
//  Copyright © 2016 Magenta Margin. All rights reserved.
//

import Foundation

func multiply(a: Double, b: Double) -> Double {
    return a * b
}

class CalculatorBrain
{
    private var accumulator = 0.0
    
    private var operations: Dictionary<String, Operation> = [
        "π" : Operation.Constant(M_PI),
        "e" : Operation.Constant(M_E),
        "√" : Operation.UnaryOperation(sqrt),
        "cos" : Operation.UnaryOperation(cos),
        "sin" : Operation.UnaryOperation(sin),
        "×" : Operation.BinaryOperation(multiply),
        "=" : Operation.Equals
    ]
    
    private enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
    }
    
    func setOperant(operand: Double) {
        accumulator = operand
    }
    
    func performOperation(symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .Constant(let value): accumulator = value
            case .UnaryOperation(let function): accumulator = function(accumulator)
            case .BinaryOperation(let function):
                pending = PendingBinaryOperationInfo(binaryFunction: function, fistOpernd: accumulator)
            case .Equals :
                if pending != nil {
                    accumulator = pending!.binaryFunction(pending!.fistOpernd, accumulator)
                    pending = nil
                }
            }
        }
    }
    
    private var pending: PendingBinaryOperationInfo?
    
    struct PendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var fistOpernd: Double
    }
    
    var result: Double {
        get {
            return accumulator
        }
    }
}
