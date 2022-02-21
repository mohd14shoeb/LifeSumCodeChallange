//
//  ViewController.swift
//  LifesumCodeChallenge
//
//  Created by Mohammed1 Shoeb on 19/02/22.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    @IBOutlet weak var caloriesCircleView: UIView!
    @IBOutlet weak var buttonShadowView: UIView!
    @IBOutlet weak var moreInfoButton: UIButton!
    var foodservice: FoodViewModel?
    weak var circleView: CaloriesCircleView?
    var errorShow = true
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.becomeFirstResponder()
        self.loadCaloriesCircleView(isViewHidden: errorShow)
        self.designButtonCurve(isButtonHidden: errorShow)
        foodservice = FoodViewModel()
        self.loadNewFoodDetails(foodID: 1)
    }
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    
    func loadNewFoodDetails(foodID: Int) {
        let loader =  self.loader()
        foodservice?.getNewFoodDetails(foodID: foodID, completion: { [weak self] food, error in
            if error != nil {
                self?.errorShow = true
            } else {
                self?.errorShow = false
            }
            DispatchQueue.main.async {
                self?.stopLoader(loader: loader)
                self?.caloriesCircleView.isHidden =  self?.errorShow ?? true
                self?.moreInfoButton.isHidden = self?.errorShow ?? true
                self?.buttonShadowView.isHidden = self?.errorShow ?? true
                self?.updateFoodDetails(food: food)
            }
            
        })
    }
    
    func updateFoodDetails(food: Food?) {
        self.circleView?.updateFoodDetails(food: food)
    }
    
    func designButtonCurve(isButtonHidden: Bool) {
        self.moreInfoButton.isHidden = isButtonHidden
        self.buttonShadowView.isHidden = isButtonHidden
        self.moreInfoButton.layer.cornerRadius = self.moreInfoButton.frame.height/2
        self.moreInfoButton.addGradientBackground(firstColor: Constant.firstColor, secondColor: Constant.secondColor)
        self.moreInfoButton.clipsToBounds = true
        self.buttonShadowView.layer.cornerRadius =  self.buttonShadowView.frame.height / 2
        self.buttonShadowView.addShadow(offset: CGSize.init(width: 3, height: 4), color: Constant.shadowColor, radius: 6.0, opacity: 0.8)
    }
    @IBAction func moreInfo(_ sender: UIButton) {
        print("more info")
    }
    func loadCaloriesCircleView(isViewHidden: Bool) {
        let customView = UINib(nibName:"CaloriesCircleView",bundle:.main).instantiate(withOwner: nil, options: nil).first as? CaloriesCircleView
        customView?.frame = caloriesCircleView.bounds
        self.caloriesCircleView.isHidden = isViewHidden
        customView?.drawCircularView()
        self.circleView = customView
        self.caloriesCircleView.addSubview(customView ?? UIView())
    }
}
extension ViewController {
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            let randomNumber = Int.random(in: 1..<100)
            self.loadNewFoodDetails(foodID: randomNumber)
        }
    }
}
extension ViewController {
    func loader() -> UIAlertController {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.large
        loadingIndicator.startAnimating()
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
        return alert
    }
    
    func stopLoader(loader : UIAlertController) {
        DispatchQueue.main.async {
            loader.dismiss(animated: true, completion: nil)
        }
    }
}

