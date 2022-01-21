//
//  NetworkManager.swift
//  BitLabs-Survey-Demo
//
//  Created by developer on 20/01/22.
//

//import Foundation
//
//struct NetworkManager {
//    static let baseURL = "https://api.bitlabs.ai/v1/client/check?platform=MOBILE&uid=1"
//    
//    public func checkSurveyAvailable(userID: String) {
//
//        guard let url = URL(string: "https://api.bitlabs.ai/v1/client/check?platform=MOBILE&uid=\(userID)") else { return }
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        request.setValue(apiKey, forHTTPHeaderField: BitLabsSurvey.Constant.headerKeyName)
//
//
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//            print(response)
//            print(data)
//        }.resume()
//        
//    }
//}
