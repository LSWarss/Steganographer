//
//  StegoEncodingChosenWorker.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 12/01/2022.
//  Copyright (c) 2022. All rights reserved.

import Foundation

protocol StegoEncodingChosenWorker {
    typealias StegoEncodingChosenResult = Result<Void, Error>
    typealias StegoEncodingChosenCompletion = Completion<StegoEncodingChosenResult>

    func fetchStegoEncodingChosen(completion: @escaping StegoEncodingChosenCompletion)
}

final class StegoEncodingChosenWorkerImpl {

    init () {

    }
}

extension StegoEncodingChosenWorkerImpl: StegoEncodingChosenWorker {

    func fetchStegoEncodingChosen(completion: @escaping StegoEncodingChosenCompletion) {
        completion(.success(()))
    }
}
