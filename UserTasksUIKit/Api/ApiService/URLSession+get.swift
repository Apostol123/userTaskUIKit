//
//  URLSession+get.swift
//  UserTasksUIKit
//
//  Created by Apostol, Alexandru on 15/02/2021.
//  Copyright © 2021 Apostol, Alexandru. All rights reserved.
//

import Foundation

extension URLSession {
    
    func get<T:Codable>(_ builder: RequestBuilder, type: T.Type, callback: @escaping(Result<T?,ApiError>) -> Void) {
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let dataTask = self.dataTask(with: builder.urlRequest) { data, response, error in
            if let error = error {
                print("Error in api service: \(error.localizedDescription)")
                DispatchQueue.main.sync {
                    callback(.failure(.apiServiceError))
                }
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("Invalid Response in api service")
                DispatchQueue.main.sync {
                    callback(.failure(.invalidResponse))
                }
                return
            }
            switch response.statusCode {
            case 200:
                do {
                    guard let newData = data else {
                        print("Decoding Error")
                        DispatchQueue.main.sync {
                            callback(.failure(ApiError.decodingError))
                        }
                        return
                    }
                    let result =  try decoder.decode(type, from: newData)
                    DispatchQueue.main.sync {
                        callback(.success(result))
                    }
                    
                } catch {
                    print(error)
                }
            case 400:
                print("Resource not found \(builder.urlRequest.description)")
                DispatchQueue.main.async {
                    callback(.failure(.urlNotFound))
                }
            default:
                print("Undefinied Error")
                DispatchQueue.main.async {
                    callback(.failure(.unknown))
                }
            
            }
        }
        dataTask.resume()
    }
}
