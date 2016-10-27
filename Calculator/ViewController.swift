//
//  ViewController.swift
//  Calculator
//
//  Created by Vasyl Melnychuk on 10/27/16.
//  Copyright © 2016 Magenta Margin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        print("touched \(digit) digit")
    }
}

