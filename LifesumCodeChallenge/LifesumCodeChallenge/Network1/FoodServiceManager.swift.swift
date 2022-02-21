//
//  FoodServiceManager.swift.swift
//  LifesumCodeChallenge
//
//  Created by Mohammed1 Shoeb on 21/02/22.
//

import Foundation

class FoodServiceManager: APIClient {
    static let shared: FoodServiceManager = FoodServiceManager()
}
//extension FoodServiceManager {
//    
//    func getUsers(_ req: GetUsersReq, completion: ((GetUsersRes?, Error?)->Void)? = nil) {
//        self.loadData(endPoint: DataServiceEndpoint.getUsers, parameters: req.JSONRepresentation) { (result) in
//            switch result {
//            case .success(let data):
//                let res = data.getDecodedObject(from: GetUsersRes.self)
//                completion?(res, nil)
//            case .failure(let error):
//                completion?(nil, error)
//            }
//        }
//    }
//}
