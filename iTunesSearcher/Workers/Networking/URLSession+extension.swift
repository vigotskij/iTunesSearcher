//
//  URLSession+extension.swift
//  foodRecipesSearcher
//
//  Created by Boris Sortino on 17/05/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

import Foundation
extension URLSession {
    func retrieveData<DecodableType: Decodable>(with url: URL,
                                                interceptor: RequestInterceptor? = nil,
                                                completionHandler: @escaping (DecodableType?, Bool, Error?) -> Void) {
        if let interceptor = interceptor {
            interceptor.intercept(request: url) { request in
                guard let interceptedRequestUrl = request?.url else {
                    completionHandler(nil, false, nil)
                    return
                }
                self.retrieveDataTask(with: interceptedRequestUrl,
                                      completionHandler: completionHandler)
                    .resume()
            }
        } else {
            retrieveDataTask(with: url,
                         completionHandler: completionHandler)
            .resume()
        }
    }
    private func retrieveDataTask<DecodableType: Decodable>(
        with url: URL,
        completionHandler: @escaping (DecodableType?, Bool, Error?) -> Void) -> URLSessionDataTask {
        self.dataTask(with: url) { data, response, error in
            guard
                let response = response as? HTTPURLResponse else {
                    completionHandler(nil, false, error)
                    return
            }
            if (200...299).contains(response.statusCode) {
                #if !DEBUG
                do {
                    let decodedData = try JSONDecoder().decode(DecodableType.self,
                                                               from: data ?? Data())
                    completionHandler(decodedData, nil)
                } catch {
                    completionHandler(nil, error)
                }
                #else
                do {
                    let decodedData = try JSONDecoder().decode(DecodableType.self,
                                                               from: data ?? Data())
                    completionHandler(decodedData, false, nil)
                } catch let DecodingError.dataCorrupted(context) {
                    print(context)
                } catch let DecodingError.keyNotFound(key, context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.valueNotFound(value, context) {
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.typeMismatch(type, context) {
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch {
                    print("error: ", error)
                }
                #endif
            } else if (500...599).contains(response.statusCode) {
                completionHandler(nil, true, nil)
            }
        }
    }
}
