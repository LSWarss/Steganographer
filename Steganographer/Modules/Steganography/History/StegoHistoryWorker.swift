//
//  StegoHistoryWorker.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 12/12/2021.
//  Copyright (c) 2021. All rights reserved.

import Foundation

protocol StegoHistoryWorker {
    typealias StegoHistoryResult = Result<Void, Error>
    typealias StegoHistoryCompletion = Completion<StegoHistoryResult>

    // TODO: Fill this with public worker methods
    func fetchStegoHistory(completion: @escaping StegoHistoryCompletion)
}

final class StegoHistoryWorkerImpl {

    init () {

    }
}

extension StegoHistoryWorkerImpl: StegoHistoryWorker {

    // TODO: Fill this with public worker methods
    func fetchStegoHistory(completion: @escaping StegoHistoryCompletion) {
        completion(.success(()))
    }
}

private extension StegoHistoryWorkerImpl {
    // TODO: Fill this with private worker methods
}
