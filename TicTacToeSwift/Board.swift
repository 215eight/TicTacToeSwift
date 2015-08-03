//
//  Board.swift
//  TicTacToeSwift
//
//  Created by eandrade21 on 8/2/15.
//  Copyright (c) 2015 eandrade21. All rights reserved.
//

import Foundation

struct Board {

    let size: Int
    let positions: Int
    var units = [Int]()

    var noughts: UInt16 = 0
//    var noughtsWinUnits: [Int]

    var crosses: UInt16 = 0
//    var crossesWinUnits: [Int]

    init(size: Int) {
        assert(size >= 3 && size <= 4, "Size must be greater than 3")
        self.size = size
        self.positions = size * size
        generateUnits()
    }

    mutating func generateUnits() {

        // Horizontal units
        var hUnit = 0
        for var i = 0; i < size; i++ {
            hUnit += pow(2, i)
        }

        for var i = 0; i < size; i++ {
            let unit = hUnit << (i * size)
            units.append(unit)
        }

        // Vertical units
        var vUnit = 0
        for var i = 0; i < positions; i++ {
            if i % size == 0 {
                vUnit += pow(2,i)
            }
        }

        for var i = 0; i < size; i++ {
            let unit = vUnit << i
            units.append(unit)
        }

        // Diagonal units
        var dUnit = 0
        var tRow = 0
        var tCol = 0
        for var i = 0; i < positions; i++ {
            if i / size == tRow && i % size == tCol {
                dUnit += pow(2,i)
                tRow++
                tCol++
            }
        }
        units.append(dUnit)

        dUnit = 0
        tRow = size - 1
        tCol = 0
        for var i = positions - 1; i >= 0; i-- {
            if i / size == tRow && i % size == tCol {
                dUnit += pow(2,i)
                tRow--
                tCol++
            }
        }
        units.append(dUnit)
    }

}