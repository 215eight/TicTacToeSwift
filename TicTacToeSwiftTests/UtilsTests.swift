//
//  UtilsTests.swift
//  TicTacToeSwift
//
//  Created by PartyMan on 8/3/15.
//  Copyright (c) 2015 eandrade21. All rights reserved.
//

import XCTest

class UtilsTests: XCTestCase {

    func testPopcount() {

        let n0: UInt16 = 0
        let n1: UInt16 = 1
        let n2: UInt16 = 2
        let n3: UInt16 = 3
        let n4: UInt16 = 4
        let n5: UInt16 = 5
        let n6: UInt16 = 6
        let n7: UInt16 = 7

        XCTAssertEqual(popcount(n0), 0, "")
        XCTAssertEqual(popcount(n1), 1, "")
        XCTAssertEqual(popcount(n2), 1, "")
        XCTAssertEqual(popcount(n3), 2, "")
        XCTAssertEqual(popcount(n4), 1, "")
        XCTAssertEqual(popcount(n5), 2, "")
        XCTAssertEqual(popcount(n6), 2, "")
        XCTAssertEqual(popcount(n7), 3, "")
    }

}
