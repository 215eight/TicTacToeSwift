//
//  Utils.swift
//  TicTacToeSwift
//
//  Created by eandrade21 on 8/2/15.
//  Copyright (c) 2015 eandrade21. All rights reserved.
//

import Foundation

func pow(num: Int, power: Int) -> Int {
    return Int(pow(Double(num), Double(power)))
}

func popcount(num: UInt16) -> Int {
    let mask1: UInt16 = 0b01010101
    let mask2: UInt16 = 0b00110011
    let mask3: UInt16 = 0b00001111

    var x = num
    x = (x & mask1) + ((x >> 1) & mask1)
    x = (x & mask2) + ((x >> 2) & mask2)
    x = (x & mask3) + ((x >> 3) & mask3)
    return Int(x)
}