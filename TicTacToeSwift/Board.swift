//
//  Board.swift
//  TicTacToeSwift
//
//  Created by eandrade21 on 8/2/15.
//  Copyright (c) 2015 eandrade21. All rights reserved.
//

import Foundation

typealias Unit = Int

struct Board {

    let size: Int
    let positions: Int
    var units = [Unit]()

    var noughts: UInt16 = 0
    var noughtsWinUnits = [Unit]()

    var crosses: UInt16 = 0
    var crossesWinUnits = [Unit]()

    init(size: Int) {
        assert(size >= 3 && size <= 4, "Size must be greater than 3")
        self.size = size
        self.positions = size * size

        generateUnits()

        calculateWinUnits()
    }

    mutating func generateUnits() {

        generateHorizontalUnits()
        generateVerticalUnits()
        generateDiagonalUnits()
    }

    mutating func generateHorizontalUnits() {
        var hUnit = 0
        for var i = 0; i < size; i++ {
            hUnit += pow(2, i)
        }

        for var i = 0; i < size; i++ {
            let unit = hUnit << (i * size)
            units.append(unit)
        }
    }

    mutating func generateVerticalUnits() {
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
    }

    mutating func generateDiagonalUnits() {
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

    func unitsForPosition(position: Int) -> [Unit] {

        assert(position >= 0 && position < positions, "Position out of range")

        var res = [Unit]()

        var bPos = 1
        bPos =  bPos << (positions - position - 1)
        for unit in units {
            if unit & bPos > 0 { res.append(unit) }
        }

        return res
    }

    mutating func calculateWinUnits() {

        for var i = 0; i < positions; i++ {
            let winUnitsForPos = unitsForPosition(i)
            crossesWinUnits.append(winUnitsForPos.count)
            noughtsWinUnits.append(winUnitsForPos.count)
        }
    }
}