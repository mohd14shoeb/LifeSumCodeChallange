//
//  Router.swift
//  LifesumCodeChallenge
//
//  Created by Mohammed1 Shoeb on 21/02/22.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()

protocol NetworkRouter: AnyObject {
    associatedtype EndPoint: EndPointType
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}

class Router<EndPoint: EndPointType>: NetworkRouter {
    private var task: URLSessionTask?
    
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion) {
        let session = URLSession.shared
        do {
            let request = try self.buildRequest(from: route)
            NetworkLogger.log(request: request)
            task = session.dataTask(with: request, completionHandler: { data, response, error in
                completion(data, response, error)
            })
        }catch {
            completion(nil, nil, error)
        }
        self.task?.resume()
    }
    
    func cancel() {
        self.task?.cancel()
    }
    
    fileprivate func buildRequest(from route: EndPoint) throws -> URLRequest {
    
       // var request = URLRequest(url: NSURL(string: "https://api.lifesum.com/v2/foodipedia/codetest?foodid=20") as! URL)
     //   let string = NSString(string: percentString).removingPercentEncoding!
        let urlString: String = (route.baseURL.appendingPathComponent(route.version).appendingPathComponent(route.path)).absoluteString
       // var urlRequest = URLRequest(url: route.baseURL.appendingPathComponent(route.version).appendingPathComponent(route.path))
        let completePath = urlString.replacingOccurrences(of: "%[0-9a-fA-F]{2}",
                                                         with: "?",
                                                         options: .regularExpression,
                                                         range: nil)
        let urlPathStrin = NSURL(string: completePath)
        var request = URLRequest(url: urlPathStrin! as URL,
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 10.0)
        
        
        request.httpMethod = route.httpMethod.rawValue
        do {
            switch route.task {
            case .request(let additionalHeaders):
                //request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                self.addAdditionalHeaders(additionalHeaders, request: &request)
            case .requestParameters(let bodyParameters,
                                    let bodyEncoding,
                                    let urlParameters):
                
                try self.configureParameters(bodyParameters: bodyParameters,
                                             bodyEncoding: bodyEncoding,
                                             urlParameters: urlParameters,
                                             request: &request)
                
            case .requestParametersAndHeaders(let bodyParameters,
                                              let bodyEncoding,
                                              let urlParameters,
                                              let additionalHeaders):
                
                self.addAdditionalHeaders(additionalHeaders, request: &request)
                try self.configureParameters(bodyParameters: bodyParameters,
                                             bodyEncoding: bodyEncoding,
                                             urlParameters: urlParameters,
                                             request: &request)
            }
            return request
        } catch {
            throw error
        }
    }
    
    fileprivate func configureParameters(bodyParameters: Parameters?,
                                         bodyEncoding: ParameterEncoding,
                                         urlParameters: Parameters?,
                                         request: inout URLRequest) throws {
        do {
            try bodyEncoding.encode(urlRequest: &request,
                                    bodyParameters: bodyParameters, urlParameters: urlParameters)
        } catch {
            throw error
        }
    }
    
    fileprivate func addAdditionalHeaders(_ additionalHeaders: HTTPHeaders?, request: inout URLRequest) {
        guard let headers = additionalHeaders else { return }
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
    
}

