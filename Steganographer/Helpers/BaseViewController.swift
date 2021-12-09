//
//  BaseViewController.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 09/12/2021.
//

import UIKit

class BaseViewController: UIViewController, BasePresentable {

    // workaround for viewContollers in UIPagedViewController
    // (setViewControllers() is setting 'isMovingFromParent' to 'true')
    var shouldCheckDeallocating: Bool = true

    @IBInspectable var keyboardAvoiding: Bool = true

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        #if DEBUG
        if isMovingFromParent && shouldCheckDeallocating {
            DispatchQueue.main.async { [weak self] in
                assert(self == nil, """
                    View: \(String(describing: self)) was popped, so it should be deallocated,
                    but it wasn't. Search for memory leaks / reference cycles
                    """)
            }
        }
        #endif
    }
}
