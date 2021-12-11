//
//  HomeWorker.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 11/12/2021.
//  Copyright (c) 2021. All rights reserved.

import Foundation

protocol HomeWorker {
    typealias HomeResult = Result<Void, Error>
    typealias HomeCompletion = Completion<HomeResult>

    // TODO: Fill this with public worker methods
    func fetchHome(completion: @escaping HomeCompletion)
}

final class HomeWorkerImpl {

    init () {

    }
}

extension HomeWorkerImpl: HomeWorker {

    // TODO: Fill this with public worker methods
    func fetchHome(completion: @escaping HomeCompletion) {
        completion(.success(()))
    }
}

private extension HomeWorkerImpl {
    // TODO: Fill this with private worker methods
}
