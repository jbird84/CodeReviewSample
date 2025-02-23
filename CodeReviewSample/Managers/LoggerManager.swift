//
//  LoggerManager.swift
//  CodeReviewSample
//
//  Created by Kinney Kare on 2/23/25.
//

import OSLog


class Logger {
    static let shared = Logger()
    
    private init() {}
    
    func logEvent(_ message: String, withCategory category: String, andType type: OSLogType) {
        let log = OSLog(subsystem: Bundle.main.bundleIdentifier ?? K.SystemItem.bundleIdentifier, category: category)
        os_log("%{PUBLIC}@", log: log, type: type, message)
    }
}
