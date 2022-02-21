//
//  ViewControllerTests.swift
//  LifesumCodeChallengeTests
//
//  Created by Mohammed1 Shoeb on 21/02/22.
//

import XCTest
@testable import LifesumCodeChallenge

class ViewControllerTests: XCTestCase {

    var mainViewController: ViewController?

    override func setUpWithError() throws {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let viewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        else {
            return
        }
        mainViewController = viewController
        mainViewController?.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        self.mainViewController = nil
    }

    func testAwakeFromNib() throws {
        self.mainViewController?.awakeFromNib()
    }

}
