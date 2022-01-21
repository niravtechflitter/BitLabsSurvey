//
//  SurveyAvailable.swift
//  BitLabs-Survey-Demo
//
//  Created by developer on 20/01/22.
//

import Foundation

public struct SurveyAvailable: Codable {
    
    public var data: Data?
    public var error: Error?
    public var status: String?
    public var traceID: String?
    
    public var hasSurveys: Bool {
        return data?.hasSurveys ?? false
    }
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case error = "error"
        case status = "status"
        case traceID = "trace_id"
    }
    
    public struct Data: Codable {
        public var hasSurveys: Bool?
        
        enum CodingKeys: String, CodingKey {
            case hasSurveys = "has_surveys"
        }
    }
    
    public struct Error: Codable {
        var details: Details?
        
        enum CodingKeys: String, CodingKey {
            case details = "details"
        }
        
        struct Details: Codable {
            var http: String?
            var msg: String?
            
            enum CodingKeys: String, CodingKey {
                case http = "http"
                case msg = "msg"
            }
        }
    }
}
