//
//  APIClient.swift
//  LifesumCodeChallenge
//
//  Created by Mohammed1 Shoeb on 21/02/22.
//

import Foundation
import Alamofire

enum ErrorResult:Error {
    case network(string:String)
    case parser(string:String)
    case custom(string:String)
}
enum Result<T,E:Error> {
    case success(T)
    case failure(E)
}
class APIClient {
//    typealias completionBlockHandler = (Any, Result<Any>, HTTPURLResponse?) -> Void
//    typealias dataResponseCompletion = (DataResponse<Any>) -> Void
//    static var sessionManager = SessionManager()
    static var apiClient = APIClient()
    
    
    func loadData(endPoint: APIRouter, parameters: Dictionary<String,Any>? = nil, body: Dictionary<String,Any>? = nil, pathSuffix: String? = nil, completion:@escaping(Result<Data,ErrorResult>) -> ()) {
       
        // var request = request(parameters: parameters, body: body, pathSuffix: pathSuffix)
        let request = APIRouter.codetest(foodid: "1")
        if !Reachability.shared.isConnected {
            completion(.failure(.network(string: "no network" )))
            return
        }
       
        AF.request(request).response { (response) in
            if let requestError = response.error {
                completion(.failure(.network(string: "" + requestError.localizedDescription)))
                return
            }
            if let responseData = response.data, responseData.count > 0 {
                completion(.success(responseData))
            }
        }
    }
    /*
    
    
     typealias NetworkCompletionBlockHandler = (Any?, Result<Any>, HTTPURLResponse?) -> Void
     typealias AlgoliaResponseCompletion = (Any?) -> Void
     typealias DataResponseCompletion = (DataResponse<Any>) -> Void
     static var sessionManager = SessionManager()
     static var shoppingNetworkManager = MJioShoppingNetworkManager()
     
    
    func callCommonApiMethod(route: APIRouter, completionBlock: @escaping (completionBlockHandler))  {
        self.callAlmofireRequest(route: route) { (response) in
            self.parsingApiResponse(response: response, completionBlock: { (info, result, urlResponse) in
                completionBlock(info, result, urlResponse)
            })
        }
    }
    
    func callAlmofireRequest(route: APIRouter, completion: @escaping (dataResponseCompletion))  {
        APIClient.sessionManager.request(route).responseJSON { (response) in
            completion(response)
        }
    }
    
    
    func parsingApiResponse(response: DataResponse<Any>, completionBlock: @escaping (completionBlockHandler))  {
        if response.result.isSuccess {
            completionBlock(response.data as Any, response.result, response.response ?? nil)
        } else {
            completionBlock("nil", response.result, response.response ?? nil)
        }
    }*/
}
