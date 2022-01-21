//
//  NetworkManager.swift
//  BitLabs-Survey-Demo
//
//  Created by developer on 20/01/22.
//

import Foundation

struct NetworkManager {
    private static let baseURL = "https://api.bitlabs.ai/v1/client/check?platform=MOBILE&uid=1"
    private let apiKey: String
    private let uid: String
    
    struct Constant {
        static let headerKeyName = "X-Api-Token"
        static let paramPlatformKey = "platform"
        static let paramUidKey = "uid"
    }
    
    init(apiKey: String, uid: String) {
        self.apiKey = apiKey
        self.uid = uid
    }
    
    private func createRelURL() -> URL? {
        guard var urlComponents = URLComponents(string: NetworkManager.baseURL) else {
            return nil
        }
        let queryParam = [URLQueryItem(name: NetworkManager.Constant.paramPlatformKey, value: "MOBILE"),
                          URLQueryItem(name: NetworkManager.Constant.paramUidKey, value: uid)]
        
        urlComponents.queryItems = queryParam
        return urlComponents.url
    }
    
    func checkSurveyAvailable(completion: @escaping ((Result<SurveyAvailable>) -> Void)) {
        
        guard let url = createRelURL() else {
            completion(Result.error(.invalidURL))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(apiKey, forHTTPHeaderField: NetworkManager.Constant.headerKeyName)

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                completion(Result.error(.serverError(error)))
                return
             }
            do {
                let decoder = JSONDecoder()
                let surveyAvailable = try decoder.decode(SurveyAvailable.self, from: data)
                completion(Result.success(surveyAvailable))
            } catch let error {
                completion(Result.error((.serverError(error))))
                print(error.localizedDescription)
            }
        }.resume()
        
    }
}
