//
//  BitLabsSurvey.swift
//  BitLabs-Survey-Demo
//
//  Created by developer on 20/01/22.
//

import Foundation
import UIKit

public class BitLabsSurvey {
    
    private let apiKey: String
    private let uid: String
    
    public init(apiKey: String, uid: String) {
        self.apiKey = apiKey
        self.uid = uid
    }
    
    public func checkForSurveys(completion: @escaping ((Result<SurveyAvailable>) -> Void)) {
        let networkManager = NetworkManager(apiKey: apiKey, uid: uid)
        networkManager.checkSurveyAvailable(completion: completion)
    }
    
    public func showSurvey(viewController: UIViewController) {
        let surveyVC = SurveyViewController()
        surveyVC.modalPresentationStyle = .fullScreen
        viewController.present(surveyVC, animated: true, completion: nil)
    }
}
