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

//    func testWinnigUnits() {
//
//        XCTAssertEqual(board.noughtsWinUnits.count, board.positions, "One value for each position")
//        XCTAssertEqual(board.crossesWinUnits.count, board.positions, "One value for each position")
//
//    }

}
