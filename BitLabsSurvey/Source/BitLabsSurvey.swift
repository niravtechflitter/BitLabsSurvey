//
//  BitLabsSurvey.swift
//  BitLabs-Survey-Demo
//
//  Created by developer on 20/01/22.
//

import Foundation

public class BitLabsSurvey {
    
    private let apiKey: String
    private let uid: String
    struct Constant {
        static let headerKeyName = "X-Api-Token"
    }
    
    public init(apiKey: String, uid: String) {
        self.apiKey = apiKey
        self.uid = uid
    }
    
    public func checkForSurveys(completion: @escaping ((Result<SurveyAvailable>) -> Void)) {

        guard let url = URL(string: "https://api.bitlabs.ai/v1/client/check?platform=MOBILE&uid=\(uid)") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(apiKey, forHTTPHeaderField: BitLabsSurvey.Constant.headerKeyName)

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                completion(Result.error(error))
                return
             }
            do {
                let decoder = JSONDecoder()
                let surveyAvailable = try decoder.decode(SurveyAvailable.self, from: data)
                completion(Result.success(surveyAvailable))
            } catch let error {
                completion(Result.error(error))
                print(error.localizedDescription)
            }
        }.resume()
        
    }
}
