//
//  ProfileWorker.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 11/12/2021.
//  Copyright (c) 2021. All rights reserved.

import Foundation

protocol ProfileWorker {
    typealias ProfileResult = Result<Void, Error>
    typealias ProfileCompletion = Completion<ProfileResult>

    // TODO: Fill this with public worker methods
    func fetchProfile(completion: @escaping ProfileCompletion)
}

final class ProfileWorkerImpl {

    init () {

    }
}

extension ProfileWorkerImpl: ProfileWorker {

    // TODO: Fill this with public worker methods
    func fetchProfile(completion: @escaping ProfileCompletion) {
        completion(.success(()))
    }
}

private extension ProfileWorkerImpl {
    // TODO: Fill this with private worker methods
}
