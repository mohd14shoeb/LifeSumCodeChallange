//
//  Reachability.swift
//  LifesumCodeChallenge
//
//  Created by Mohammed1 Shoeb on 21/02/22.
//

import Foundation
import Alamofire

class Reachability: NSObject {
    static let shared = Reachability()
    private var manager: NetworkReachabilityManager
    
    private override init() {
        self.manager = NetworkReachabilityManager()!
        super.init()
        
    }
    
    var isConnected: Bool {
        return manager.isReachable
    }
    
}
