//
//  FoodEndPoint.swift
//  LifesumCodeChallenge
//
//  Created by Mohammed1 Shoeb on 21/02/22.
//

import Foundation

enum NetworkEnvironment {
    case qa
    case production
    case staging
}
enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}
//// MARK: - Header Values
enum HeaderContentType: String {
    case json = "Application/json"
    case authKey = "23863708:465c0554fd00da006338c72e282e939fe6576a25fd00c776c0fbe898c47c9876"
}
enum Version: String {
    case V1 = "/v2"
}
public enum FoodApi {
    case newfood(foodID: Int)
}

extension FoodApi: EndPointType {
    // https://api.lifesum.com/v2/foodipedia/codetest?foodid=1
    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .production: return "https://api.lifesum.com"
        case .qa: return "https://api.lifesum.com"
        case .staging: return "https://api.lifesum.com"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    // MARK: - Get Version for Api
    var version: String {
        switch self {
        case .newfood:
            return Version.V1.rawValue
        }
    }
    var path: String {
        switch self {
        case .newfood(let foodID):
           return "/foodipedia/codetest?foodid=\(foodID)"
          //  return getPathString(path: "/codetest?foodid=%d", args: foodID)
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .newfood(_):
            return .request(additionalHeaders: headers)
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .newfood(_):
             return [HTTPHeaderField.contentType.rawValue: HeaderContentType.json.rawValue, HTTPHeaderField.authentication.rawValue: HeaderContentType.authKey.rawValue]
        }
    }
    func getPathString(path: String, args: String?...) -> String {
        let pathString = String(format: path, arguments: args as? [CVarArg] ?? [""])
        return pathString
    }

}
