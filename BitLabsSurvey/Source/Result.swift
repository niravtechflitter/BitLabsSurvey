//
//  Result.swift
//  BitLabs-Survey-Demo
//
//  Created by developer on 20/01/22.
//

import Foundation

public enum Result<T> {
  case success(T)
  case error(Error?)
}
