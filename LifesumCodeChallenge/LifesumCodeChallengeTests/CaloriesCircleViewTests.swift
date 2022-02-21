//
//  CaloriesCircleViewTests.swift
//  LifesumCodeChallengeTests
//
//  Created by Mohammed1 Shoeb on 21/02/22.
//

import XCTest
@testable import LifesumCodeChallenge

class CaloriesCircleViewTests: XCTestCase {
    private var circleView: CaloriesCircleView?
    
    override func setUpWithError() throws {
        let bundle = Bundle(for: CaloriesCircleView.self)
        guard let view = bundle.loadNibNamed("CaloriesCircleView", owner: nil)?.first as? UIView else {
            return XCTFail("CardView nib did not contain a View")
        }
        circleView = view as? CaloriesCircleView
    }

    override func tearDownWithError() throws {
        self.circleView = nil
    }
    func testDrawCircularView() {
        self.circleView?.drawCircularView()
        XCTAssertNotNil(self.circleView?.carbsLabel.text)
        XCTAssertEqual(self.circleView?.carbsLabel.text, "CARBS")
        XCTAssertNotNil(self.circleView?.protienLabel.text)
        XCTAssertEqual(self.circleView?.protienLabel.text, "PROTEIN")
        XCTAssertNotNil(self.circleView?.fatLabel.text)
        XCTAssertEqual(self.circleView?.fatLabel.text, "FAT")
        XCTAssertEqual(self.circleView?.circleView.gradientColors.count, 2)
        XCTAssertEqual(self.circleView?.circleView.shadowRadius, 8)
        XCTAssertEqual(self.circleView?.circleView.shadowOpacity, 0.8)
    }

    func testUpdateFoodDetails() throws {
        let model = self.mockFoodData()
        self.circleView?.updateFoodDetails(food: model)
        XCTAssertNotNil(self.circleView?.carbsPercentageLabel.text)
        XCTAssertNotNil(self.circleView?.proteinPercentageLabel.text)
        XCTAssertNotNil(self.circleView?.fatPercentageLabel.text)
        XCTAssertNotNil(self.circleView?.productNameLabel.text)
        XCTAssertNotNil(self.circleView?.calorieAmoountLabel.text)
        XCTAssertNotNil(self.circleView?.descriptionLabel.text)
    }
    func mockFoodData() -> Food? {
        let model = Food(title: "Ricotta cheese", calories: 174, carbs: 3.04, protein: 11.26, fat: 12.98, saturatedfat: 8.295, unsaturatedfat: 4.012, fiber: 0, cholesterol: 0.051, sugar: 0.27, sodium: 0.08400000000000001, potassium: 0.105, gramsperserving: 20, pcstext: "Whole cheese")
        return model
    }
  
}
