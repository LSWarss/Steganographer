//
//  StegoInformationWorker.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 12/12/2021.
//  Copyright (c) 2021. All rights reserved.

import Foundation

protocol StegoInformationWorker {
    typealias StegoInformationResult = Result<Void, Error>
    typealias StegoInformationCompletion = Completion<StegoInformationResult>

    // TODO: Fill this with public worker methods
    func fetchStegoInformation(completion: @escaping StegoInformationCompletion)
}

final class StegoInformationWorkerImpl {

    init () {

    }
}

extension StegoInformationWorkerImpl: StegoInformationWorker {

    // TODO: Fill this with public worker methods
    func fetchStegoInformation(completion: @escaping StegoInformationCompletion) {
        completion(.success(()))
    }
}

private extension StegoInformationWorkerImpl {
    // TODO: Fill this with private worker methods
}
