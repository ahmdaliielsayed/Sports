//
//  SportsTests.swift
//  SportsTests
//
//  Created by Ahmed on 2/3/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import XCTest
@testable import Sports

class SportsTests: XCTestCase {

    private let sportsAPI: SportsAPIProtocol = SportAPI()
    private let leaguesAPI: LeaguesAPIProtocol = LeagueAPI()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /*func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }*/

    func testSportAPI() {
        
        let expect = expectation(description: "waiting for Sport API...")
        
        sportsAPI.getSports { (result) in
            switch result {
            case .success(let response):
                guard let sportResult = response else { return }
                XCTAssertEqual(sportResult.sports.count, 31, "Sport API Failed!")
                expect.fulfill()
            case .failure(let error):
                print("error: \(error)")
                XCTFail()
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testLeaguesAPI() {
        
        let expect = expectation(description: "waiting for Leagues API...")
        
        leaguesAPI.getLeagues(sportName: "Soccer") { (result) in
            switch result {
            case .success(let response):
                guard let leagueResult = response else { return }
                XCTAssertEqual(leagueResult.countrys.count, 10, "League API Failed!")
                expect.fulfill()
            case .failure(let error):
                print("error: \(error)")
                XCTFail()
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
