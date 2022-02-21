//
//  CaloriesCircleView.swift
//  LifesumCodeChallenge
//
//  Created by Mohammed1 Shoeb on 20/02/22.
//

import UIKit

class CaloriesCircleView: UIView {
    @IBOutlet weak var circleView: GradientView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var calorieAmoountLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var detailsContainerView: UIView!
    @IBOutlet weak var carbsLabel: UILabel!
    @IBOutlet weak var carbsPercentageLabel: UILabel!
    @IBOutlet weak var protienLabel: UILabel!
    @IBOutlet weak var proteinPercentageLabel: UILabel!
    @IBOutlet weak var fatLabel: UILabel!
    @IBOutlet weak var fatPercentageLabel: UILabel!
    
    
    override init(frame: CGRect) {
            super.init(frame: frame)
        }

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }

    func updateFoodDetails(food: Food?) {
        self.productNameLabel.text = food?.title ?? ""
        self.calorieAmoountLabel.text = "\(food?.calories ?? 0)"
        self.descriptionLabel.text = food?.pcstext ?? ""
        self.carbsPercentageLabel.text = "\(food?.carbs ?? 0)%"
        self.proteinPercentageLabel.text = "\(food?.protein ?? 0.0)%"
        self.fatPercentageLabel.text = "\(food?.fat ?? 0.0)%"
    }
    
    func drawCircularView() {
        
        self.circleView.cornerRadius = self.circleView.frame.height/2
        self.circleView.shadowColor = Constant.circleShadowColor
        self.circleView.shadowOffset = CGSize(width: 0, height: 2)
        self.circleView.shadowRadius = 8
        self.circleView.shadowOpacity = 0.8
        self.circleView.gradientColors = [Constant.circleFirstColor, Constant.circleSecondColor]
        self.circleView.gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        self.circleView.gradientLayer.endPoint = CGPoint(x: 0.8, y: 0.9)
            
    }
}
extension UIView{
    func addGradientBackground(firstColor: UIColor, secondColor: UIColor){
        clipsToBounds = true
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.8, y: 0.9)
        print(gradientLayer.frame)
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
            layer.masksToBounds = false
            layer.shadowOffset = offset
            layer.shadowColor = color.cgColor
            layer.shadowRadius = radius
            layer.shadowOpacity = opacity

            let backgroundCGColor = backgroundColor?.cgColor
            backgroundColor = nil
            layer.backgroundColor =  backgroundCGColor
        }
}

