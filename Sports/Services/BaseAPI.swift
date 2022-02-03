//
//  BaseAPI.swift
//  Sports
//
//  Created by Ahmed on 1/31/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import Foundation
import Alamofire

class BaseAPI<T: TargetType> {
    
    func fetchData<M: Decodable>(target: T, responseClass: M.Type, completionHandler: @escaping (Swift.Result<M?, NSError>) -> Void) {
        guard let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue) else { return }
        let headers = target.headers
        let params = bulidParams(task: target.task)
        
        print("\(target.baseURL)\(target.path)\(params.0)")
        
        Alamofire.request(target.baseURL + target.path, method:method, parameters: params.0, encoding: params.1, headers: headers).responseJSON { (response) in
            guard let statusCode = response.response?.statusCode else {
                // Add Custom Error
                let error = NSError(domain: target.baseURL, code: 0, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.statusCodeError])
                completionHandler(.failure(error))
                return
            }
            if statusCode == APIConstants.SUCCESS_RESPONSE {
                //Successful request
                 guard let jsonResponse = try? response.result.value else {
                    // Add Custom Error
                     let error = NSError(domain: target.baseURL, code: 0, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.resultValueError])
                    print(response.result.value as Any)
                     completionHandler(.failure(error))
                     return
                 }
                guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonResponse, options: []) else {
                    // Add Custom Error
                    let error = NSError(domain: target.baseURL, code: 0, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.jsonSerializationError])
                    completionHandler(.failure(error))
                    return
                }
                guard let responseObject = try? JSONDecoder().decode(M.self, from: jsonData) else {
                    // Add Custom Error
                    let error = NSError(domain: target.baseURL, code: 0, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.jsonDecoderError])
                    completionHandler(.failure(error))
                    return
                }
                completionHandler(.success(responseObject))
            } else {
                // add custom error based on status code (404 - 401 - 500)
                // Error parsing for the error message from the backend API
                let errorMessage = "Error msg parsed and returned from backend"
                let error = NSError(domain: target.baseURL, code: statusCode, userInfo: [NSLocalizedDescriptionKey: errorMessage])
                completionHandler(.failure(error))
            }
        }
    }
    
    private func bulidParams(task:Task) -> ([String:Any], ParameterEncoding) {
        switch task {
        case .requestPlain:
            return([:], URLEncoding.default)
        case .requestParameters(let parameters, let encoding):
            return (parameters, encoding)
        }
    }
}
