//
//  StegoDecodingWorker.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 12/12/2021.
//  Copyright (c) 2021. All rights reserved.

import Foundation

protocol StegoDecodingWorker {
    typealias StegoDecodingResult = Result<Void, Error>
    typealias StegoDecodingCompletion = Completion<StegoDecodingResult>

    // TODO: Fill this with public worker methods
    func fetchStegoDecoding(completion: @escaping StegoDecodingCompletion)
}

final class StegoDecodingWorkerImpl {

    init () {

    }
}

extension StegoDecodingWorkerImpl: StegoDecodingWorker {

    // TODO: Fill this with public worker methods
    func fetchStegoDecoding(completion: @escaping StegoDecodingCompletion) {
        completion(.success(()))
    }
}

private extension StegoDecodingWorkerImpl {
    // TODO: Fill this with private worker methods
}
