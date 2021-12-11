//
//  SettingsWorker.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 11/12/2021.
//  Copyright (c) 2021. All rights reserved.

import Foundation

protocol SettingsWorker {
    typealias SettingsResult = Result<Void, Error>
    typealias SettingsCompletion = Completion<SettingsResult>

    // TODO: Fill this with public worker methods
    func fetchSettings(completion: @escaping SettingsCompletion)
}

final class SettingsWorkerImpl {

    init () {

    }
}

extension SettingsWorkerImpl: SettingsWorker {

    // TODO: Fill this with public worker methods
    func fetchSettings(completion: @escaping SettingsCompletion) {
        completion(.success(()))
    }
}

private extension SettingsWorkerImpl {
    // TODO: Fill this with private worker methods
}
