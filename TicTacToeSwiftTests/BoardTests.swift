//
//  BoardTests.swift
//  TicTacToeSwift
//
//  Created by eandrade21 on 8/2/15.
//  Copyright (c) 2015 eandrade21. All rights reserved.
//

import XCTest

class BoardTests: XCTestCase {

    var board: Board!

    override func setUp() {
        super.setUp()

        board = Board(size: 3)

    }

    func testInitsEmpty() {

        XCTAssertEqual(board.noughts, 0, "No noughts")
        XCTAssertEqual(board.crosses, 0, "No crosses")
        XCTAssertEqual(board.positions, 9, "3 x 3")
    }

    func testInitUnits() {

        XCTAssertEqual(board.units.count, 8, "2N + 2")
        XCTAssertEqual(board.units[0], 0b000000111, "Last Row")
        XCTAssertEqual(board.units[1], 0b000111000, "Middle Row")
        XCTAssertEqual(board.units[2], 0b111000000, "Top Row")
        XCTAssertEqual(board.units[3], 0b001001001, "Last Col")
        XCTAssertEqual(board.units[4], 0b010010010, "Middle Col")
        XCTAssertEqual(board.units[5], 0b100100100, "First Col")
        XCTAssertEqual(board.units[6], 0b100010001, "Diagonal")
        XCTAssertEqual(board.units[7], 0b001010100, "Diagonal")
    }

    func testUnitsForPosition() {

        XCTAssertEqual(board.unitsForPosition(0).count, 3, "1H, 1V, 1D")
        XCTAssertEqual(board.unitsForPosition(0)[0], 0b111000000, "")
        XCTAssertEqual(board.unitsForPosition(0)[1], 0b100100100, "")
        XCTAssertEqual(board.unitsForPosition(0)[2], 0b100010001, "")

        XCTAssertEqual(board.unitsForPosition(3).count, 2, "1H, 1V")
        XCTAssertEqual(board.unitsForPosition(3)[0], 0b000111000, "")
        XCTAssertEqual(board.unitsForPosition(3)[1], 0b100100100, "")

        XCTAssertEqual(board.unitsForPosition(4).count, 4, "1H, 1V, 2D")
        XCTAssertEqual(board.unitsForPosition(4)[0], 0b000111000, "")
        XCTAssertEqual(board.unitsForPosition(4)[1], 0b010010010, "")
        XCTAssertEqual(board.unitsForPosition(4)[2], 0b100010001, "")
        XCTAssertEqual(board.unitsForPosition(4)[3], 0b001010100, "")
    }

    func testWinnigUnits() {

        XCTAssertEqual(board.noughtsWinUnits.count, board.positions, "One value for each position")
        XCTAssertEqual(board.noughtsWinUnits[0], 3, "1H, 1V, 1D")
        XCTAssertEqual(board.noughtsWinUnits[1], 2, "1H, 1V, 1D")
        XCTAssertEqual(board.noughtsWinUnits[2], 3, "1H, 1V, 1D")
        XCTAssertEqual(board.noughtsWinUnits[3], 2, "1H, 1V, 1D")
        XCTAssertEqual(board.noughtsWinUnits[4], 4, "1H, 1V, 2D")
        XCTAssertEqual(board.noughtsWinUnits[5], 2, "1H, 1V, 1D")
        XCTAssertEqual(board.noughtsWinUnits[6], 3, "1H, 1V, 1D")
        XCTAssertEqual(board.noughtsWinUnits[7], 2, "1H, 1V, 1D")
        XCTAssertEqual(board.noughtsWinUnits[8], 3, "1H, 1V, 1D")

        XCTAssertEqual(board.crossesWinUnits.count, board.positions, "One value for each position")

    }

}
