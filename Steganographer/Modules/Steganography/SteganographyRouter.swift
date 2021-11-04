//
//  SteganographyRouter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 04/11/2021.
//

import Foundation
import UIKit

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entry: EntryPoint? { get }

    static func start() -> AnyRouter
}

class UserRouter: AnyRouter {
    var entry: EntryPoint?

    static func start() -> AnyRouter {
        return UserRouter()
    }

}
