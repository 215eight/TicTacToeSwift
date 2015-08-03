//
//  Board.swift
//  TicTacToeSwift
//
//  Created by eandrade21 on 8/2/15.
//  Copyright (c) 2015 eandrade21. All rights reserved.
//

import Foundation

typealias Unit = UInt

enum Mark: String {
    case O = "O"
    case X = "X"

    func inverse() -> Mark {
        if self == .O { return .X }
        else { return .O }
    }
}

struct Board {

    let size: Int
    let positions: Int
    var units = [Unit]()

    var noughts: UInt = 0
    var noughtsWinUnits = [[Unit]]()

    var crosses: UInt = 0
    var crossesWinUnits = [[Unit]]()

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
        var hUnit: UInt = 0
        for var i = 0; i < size; i++ {
            hUnit += UInt(pow(2, i))
        }

        for var i = 0; i < size; i++ {
            let unit = hUnit << UInt(i * size)
            units.append(unit)
        }
    }

    mutating func generateVerticalUnits() {
        var vUnit: UInt = 0
        for var i = 0; i < positions; i++ {
            if i % size == 0 {
                vUnit += UInt(pow(2,i))
            }
        }

        for var i = 0; i < size; i++ {
            let unit = vUnit << UInt(i)
            units.append(unit)
        }
    }

    mutating func generateDiagonalUnits() {
        var dUnit: UInt = 0
        var tRow = 0
        var tCol = 0
        for var i = 0; i < positions; i++ {
            if i / size == tRow && i % size == tCol {
                dUnit += UInt(pow(2,i))
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
                dUnit += UInt(pow(2,i))
                tRow--
                tCol++
            }
        }
        units.append(dUnit)
    }

    func unitsForPosition(position: Int) -> [Unit] {

        assert(position >= 0 && position < positions, "Position out of range")

        var res = [Unit]()

        var bPos = positionToBit(position)
        for unit in units {
            if unit & bPos > 0 { res.append(unit) }
        }

        return res
    }

    func winUnitsForPosition(position: Int, mark: Mark) -> [Unit] {

        var winUnits = [Unit]()

        var bMark = positionsForMark(mark.inverse())
        var units = unitsForPosition(position)

        for unit in units {
            var tmp = unit & bMark
            if tmp ^ unit == unit {
                winUnits.append(unit)
            }
        }

        return winUnits
    }

    mutating func calculateWinUnits() {

        for var i = 0; i < positions; i++ {
            let winUnitsForPos = unitsForPosition(i)
            crossesWinUnits.append(winUnitsForPos)
            noughtsWinUnits.append(winUnitsForPos)
        }
    }

    mutating func setMark(mark: Mark, atPosition position: Int) {

        validatePositionIsEmpty(mark, atPosition: position)

        var newMarkPositions = positionsForMark(mark)
        var bPos = positionToBit(position)

        newMarkPositions = newMarkPositions | bPos

        setPositionsForMark(mark, positions: newMarkPositions)

        var inverseMarkWinUnits = winUnitsForMark(mark.inverse())
        for var i = 0; i < positions; i++ {
            inverseMarkWinUnits[i] = winUnitsForPosition(i, mark: mark.inverse())
        }
        setWinUnitsForMark(mark.inverse(), units: inverseMarkWinUnits)

    }

    func validatePositionIsEmpty(mark: Mark, atPosition position: Int) {

        let markPositions = positionsForMark(mark)
        var bPos = positionsForMark(mark)

        if markPositions & bPos > 0 {
            assertionFailure("Position is already taken")
        }
    }

    func positionsForMark(mark: Mark) -> UInt {
        let markPositions: UInt

        switch mark {
        case .X:
            markPositions = crosses
        case .O:
            markPositions = noughts
        }

        return markPositions
    }

    func winUnitsForMark(mark: Mark) -> [[Unit]] {
        let winUnits: [[Unit]]
        switch mark {
        case .X:
            winUnits = crossesWinUnits
        case .O:
            winUnits = noughtsWinUnits
        }

        return winUnits
    }

    mutating func setWinUnitsForMark(mark: Mark, units: [[Unit]]) {
        switch mark {
        case .X:
            crossesWinUnits = units
        case .O:
            noughtsWinUnits = units
        }
    }

    mutating func setPositionsForMark(mark: Mark, positions: UInt) {
        switch mark {
        case .X:
            crosses = positions
        case .O:
            noughts = positions
        }
    }
    
    func positionToBit(position: Int) -> UInt {
        let pos = positions - position - 1
        return UInt(pow(2, pos))
    }
}