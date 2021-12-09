//
//  Logger.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 09/12/2021.
//

import IteoLogger

public func log(_ level: IteoLoggerLevel, _ module: IteoLoggerModule, _ value: String) {
    Logger.shared.logger.log(level, module, value)
}

final class Logger {

    static let shared = Logger()

    static let loggerDirectoryName = "Logs"

    let logger = IteoLogger(consumers: [IteoLoggerConsoleItemConsumer(),
                                        IteoLoggerStorageItemConsumer(logsDirectoryName: loggerDirectoryName)])

    func displayLogs() {
        logger.displayLogs(logsDirectoryName: Logger.loggerDirectoryName)
    }

}
