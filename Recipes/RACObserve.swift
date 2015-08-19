//
//  RACObserve.swift
//
//  Created by Colin Eberhardt on 15/07/2014.
//  Copyright (c) 2014 Colin Eberhardt. All rights reserved.
//

import Foundation
import ReactiveCocoa

// replaces the RACObserve macro
extension NSObject {
  func RACObserve(target: NSObject!,_ keyPath: String) -> RACSignal {
    return target.rac_valuesForKeyPath(keyPath, observer: self)
  }
}