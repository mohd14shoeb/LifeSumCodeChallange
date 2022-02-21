//
//  FoodViewModel.swift
//  LifesumCodeChallenge
//
//  Created by Mohammed1 Shoeb on 21/02/22.
//

import Foundation


class FoodViewModel {
    var networkManager: NetworkManagerProtocol?
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func getNewFoodDetails(foodID: Int, completion: @escaping (_ food: Food?,_ error: String?)->()) {
        self.networkManager?.getNewFoodDetails(foodID: foodID, completion: { food, error in
            if error != nil {
                completion(nil, error)
            } else {
                completion(food, nil)
            }
        })
    }
}
    
