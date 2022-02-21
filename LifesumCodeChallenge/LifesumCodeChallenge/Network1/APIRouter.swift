//
//  APIRouter.swift
//  LifesumCodeChallenge
//
//  Created by Mohammed1 Shoeb on 21/02/22.
//

import Foundation
import Alamofire

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}
// MARK: - Header Values
enum HeaderContentType: String {
    case json = "Application/json"
    case authKey = "23863708:465c0554fd00da006338c72e282e939fe6576a25fd00c776c0fbe898c47c9876"
}
enum Version: String {
    case V1 = "/v2"
}
enum APIRouter: URLRequestConvertible {
 
    // https://api.lifesum.com/v2/foodipedia/codetest?foodid=1
    case codetest(foodid:String)
    
    var serverAddress: String {
        switch self {
        case .codetest:
            return "https://api.lifesum.com"
        default:
            return ""
        }
    }
    // MARK: - Get Version for Api
    var version: String {
        switch self {
        case .codetest:
            return Version.V1.rawValue
        }
    }
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .codetest:
            return .post
        default:
            return .get
        }
    }
    
    // MARK: - Path
     var path: String {
        switch self {
        case .codetest(let foodID):
            return  getPathString(path: "/codetest?foodid=%@", args: foodID)
        }
    }
    var contextPath: String {
        switch self {
        case .codetest:
            return "/foodipedia"
        default:
            return ""
        }
    }
    var headers: HTTPHeaders? {
        switch self {
        case .codetest:
            return [HTTPHeaderField.contentType.rawValue: HeaderContentType.json.rawValue, HTTPHeaderField.authentication.rawValue: HeaderContentType.authKey.rawValue]
        }
    }
    
    // MARK: - Parameters
     var parameters: Parameters? {
        switch self {
        default:
            return nil
        }
    }
    var body: Data? {
        switch self {
        default:
            return nil
        }
    }
    var encoding: ParameterEncoding {
        switch self {
        default:
            return JSONEncoding.default
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let completePath = serverAddress + version + contextPath  + path
        let urlString = try completePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)?.asURL()
        var urlRequest = URLRequest(url: urlString!)
        urlRequest.httpMethod = method.rawValue
        // Common Headers
        urlRequest.setValue(HTTPHeaderField.contentType.rawValue, forHTTPHeaderField: HeaderContentType.json.rawValue)
        urlRequest.setValue(HTTPHeaderField.authentication.rawValue, forHTTPHeaderField: HeaderContentType.authKey.rawValue)
        
       // urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpBody = body
        return try encoding.encode(urlRequest, with: parameters)
    }
    
//    func asURLRequest() throws -> URLRequest {
//      //  let url = try K.ProductionServer.baseURL.asURL()
//        let completePath = serverAddress + version + contextPath  + path
//        let urlString = try completePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)?.asURL()
//        var urlRequest = URLRequest(url: urlString!)
//
//       // var urlRequest = URLRequest(url: url.appendingPathComponent(path))
//
//        // HTTP Method
//        urlRequest.httpMethod = method.rawValue
//
//        // Common Headers
//        urlRequest.setValue(HTTPHeaderField.contentType.rawValue, forHTTPHeaderField: HeaderContentType.json.rawValue)
//        urlRequest.setValue(HTTPHeaderField.authentication.rawValue, forHTTPHeaderField: HeaderContentType.authKey.rawValue)
//
//
//        // Parameters
//        if let parameters = parameters {
//            do {
//                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
//            } catch {
//                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
//            }
//        }
//
//        return urlRequest
//    }
    func getPathString(path: String, args: String?...) -> String {
        let pathString = String(format: path, arguments: args as? [CVarArg] ?? [""])
        return pathString
    }
}
