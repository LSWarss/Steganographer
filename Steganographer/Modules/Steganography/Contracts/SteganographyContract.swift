//
//  SteganographyContract.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 22/11/2021.
//

import Foundation
import UIKit

// MARK: Encoding View Output (Presenter -> View)
protocol PresenterToEncodingViewProtocol: AnyObject {
    func updateImageView(with image: UIImage, and url: URL)
    func showError(with error: Error)
    func showLoadingIndicator()
    func dismissLoadingIndicator()
}

// MARK: View Input (View -> Presenter)
protocol EncodingViewToPresenterQuotesProtocol: AnyObject {
    
    var view: PresenterToEncodingViewProtocol? { get set }
    var interactor: PresenterToInteractorQuotesProtocol? { get set }
    var router: PresenterToRouterQuotesProtocol? { get set }
    
    func viewDidLoad()
    
    func numberOfRowsInSection() -> Int
    func textLabelText(indexPath: IndexPath) -> String?
    
    func didSelectRowAt(index: Int)
    func deselectRowAt(index: Int)

}



// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterSteganographyProtocol : AnyObject {
    
    static func createModule() -> UINavigationController
    func pushToEncoding(on view: PresenterToEncodingViewProtocol)
    func pushToDecoding(on view: DecodingView)
    func pushToInfo(on view: InfoView)
    func pushToHistory(on view: HistoryView)
}
