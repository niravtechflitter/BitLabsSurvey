//
//  Result.swift
//  BitLabs-Survey-Demo
//
//  Created by developer on 20/01/22.
//

import Foundation

public enum Result<T> {
  case success(T)
  case error(APIError?)
}

public enum APIError {
    case invalidURL
    case serverError(Error?)

    public var localizedDescription: String? {
        switch self {
        case .invalidURL:
            return "invalid URL"
        case .serverError( let error):
            return error?.localizedDescription
        }
    }
}
