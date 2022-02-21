//
//  HTTPTask.swift
//  LifesumCodeChallenge
//
//  Created by Mohammed1 Shoeb on 21/02/22.
//

import Foundation

public typealias HTTPHeaders = [String:String]

public enum HTTPTask {
    case request(additionalHeaders: HTTPHeaders?)
    
    case requestParameters(bodyParameters: Parameters?,
        bodyEncoding: ParameterEncoding,
        urlParameters: Parameters?)
    
    case requestParametersAndHeaders(bodyParameters: Parameters?,
        bodyEncoding: ParameterEncoding,
        urlParameters: Parameters?,
        additionHeaders: HTTPHeaders?)
    
    // case download, upload...etc
}
