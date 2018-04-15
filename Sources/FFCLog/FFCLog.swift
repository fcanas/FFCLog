//
//  FFCLog.swift
//  FFCLog
//
//  Created by Fabian Canas on 4/15/18.
//  Copyright © 2018 Fabián Cañas. All rights reserved.
//

import Foundation

public enum Level: Comparable {

    public static func < (lhs: Level, rhs: Level) -> Bool {
        return lhs.value < rhs.value
    }

    case all
    case debug
    case error
    case fatal
    case info
    case off

    public static var global: Level = .off

    private var value: UInt {
        get {
            switch self {

            case .all:
                return 0
            case .debug:
                return 1
            case .error:
                return 2
            case .fatal:
                return 3
            case .info:
                return 4
            case .off:
                return UInt.max
            }
        }
    }
}

public func log(_ string: String, level: Level = .info) {
    if level >= Level.global {
        print(string)
    }
}
