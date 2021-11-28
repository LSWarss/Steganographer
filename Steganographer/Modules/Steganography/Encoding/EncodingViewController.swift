//
//  SteganographyEncodingViewController.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 22/11/2021.
//

import UIKit
import PhotosUI

protocol SteganographyEncodingView {
    var presenter: EncodingPresenter? { get set }

    func updateImage(with image: UIImage, and url: URL)
    func updateImage(with error: String)
    func updateText(with text: String)
}

final class SteganographyEncodingViewController: UIViewController, SteganographyEncodingView {

    var presenter: EncodingPresenter?

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        tableView.register(StegoHeaderCell.self, forCellReuseIdentifier: "header")
        tableView.register(RoundedButtonPickerCell.self, forCellReuseIdentifier: "roundedButtonPickerCell")
        tableView.register(MessageTextFieldCell.self, forCellReuseIdentifier: "messageCell")
        tableView.register(RoundedButtonCell.self, forCellReuseIdentifier: "roundedButtonCell")

        // register for notifications when the keyboard appears:
        NotificationCenter.default.addObserver( self,
                                                selector: #selector(keyboardWillShow), name:
        UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }

    private func setupLayout() {
        tableView.delegate = self
        tableView.dataSource = self

        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

    func updateImage(with image: UIImage, and url: URL) {

    }

    func updateImage(with error: String) {

    }

    func updateText(with text: String) {

    }

}

extension SteganographyEncodingViewController: UITableViewDelegate, UITableViewDataSource, PHPickerViewControllerDelegate {

    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "header", for: indexPath) as? StegoHeaderCell
            cell?.selectionStyle = .none
            cell?.welcomeMessageLabel.attributedText = NSMutableAttributedString()
                .bold("Here you can ")
                .mainGreenHighlightBold("hide ")
                .bold("your message in\nthe image, right from your photos\nlibrary or camera :)")

            guard let cell = cell else { return UITableViewCell() }

            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "roundedButtonPickerCell",
                                                     for: indexPath) as? RoundedButtonPickerCell
            cell?.selectionStyle = .none
            cell?.label.attributedText = NSMutableAttributedString()
                .normalGrey("Click here to pick an image from\n")
                .mainGreenHighlightRegular("Photos")
                .normalGrey(" or ")
                .mainGreenHighlightRegular("Files")

            guard let cell = cell else { return UITableViewCell() }

            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "roundedButtonPickerCell",
                                                     for: indexPath) as? RoundedButtonPickerCell
            cell?.selectionStyle = .none
            cell?.label.attributedText = NSMutableAttributedString()
                .normalGrey("Click here to make a photo with\n")
                .mainGreenHighlightRegular("Camera")

            guard let cell = cell else { return UITableViewCell() }

            return cell
        case 3:

            let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell",
                                                     for: indexPath) as? MessageTextFieldCell
            cell?.selectionStyle = .none
            cell?.label.text = "Text to hide"

            guard let cell = cell else { return UITableViewCell() }

            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "roundedButtonCell",
                                                     for: indexPath) as? RoundedButtonCell
            cell?.selectionStyle = .none
            cell?.label.text = "HIDE"

            guard let cell = cell else { return UITableViewCell() }

            return cell
        default:
            let cell = UITableViewCell()
            cell.selectionStyle = .none
            return cell
        }

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       // Make the first row larger to accommodate a custom cell.
        switch indexPath.row {
        case 3:
            return 200
        default:
            return 100
        }

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1:
            let bottomPicker = BottomPickerViewController()
//            let picket = PHPickerViewController(configuration: .init())
//            picket.delegate = self
            if let sheet = bottomPicker.sheetPresentationController {
                sheet.detents = [.medium()]
                sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
            }
            present(bottomPicker, animated: true)

        default:
            break
        }
    }

    // Handle keyboard frame changes here.
    // Use the CGRect stored in the notification to determine what part of the screen the keyboard will cover.
    // Adjust our table view's contentInset and scrollIndicatorInsets properties so
    // that the table view content avoids the part of the screen covered by the keyboard
    @objc func keyboardWillShow( note: NSNotification ) {
        // read the CGRect from the notification (if any)
        if let newFrame = (note.userInfo?[ UIResponder.keyboardFrameEndUserInfoKey ] as? NSValue)?.cgRectValue {
            let insets = UIEdgeInsets( top: 0, left: 0, bottom: newFrame.height, right: 0 )
            tableView.contentInset = insets
            tableView.scrollIndicatorInsets = insets
        }
    }

}
