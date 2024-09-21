//
//  APINetwork.swift
//  Marvel
//
//  Created by iOSLab on 27/07/24.
//

import Foundation

enum APIError {
    case endpointError
    case requestError
    case parseError
    
}

class APINetwork{
    private let config = HeroApiConfig()
    
    func getData(path: URL?, completion: @escaping (Data) -> Void, onError: @escaping (APIError) -> Void) {
        guard let url = path else {
            onError(.endpointError)
            return
        }
        URLSession.shared.configuration.timeoutIntervalForRequest = 300
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data,
                  let response,
                  error == nil,
                  let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                onError(.requestError)
                return
            }
            
            
            completion(data)
        }
        task.resume()
    }
    
    func getHeroes(completion: @escaping ([Hero]) -> Void, onError: @escaping (APIError) -> Void) {
        getData(path: config.url) { data in
            do{
                let apiResult = try JSONDecoder().decode(APIModel.self, from: data)
                completion(apiResult.data.results)
            } catch {
                onError(.parseError)
            }
        } onError: { error in
            onError(error)
        }

    }
}


