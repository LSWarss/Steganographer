//
//  ViewController.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 18/10/2021.
//

import UIKit
import DisguisedSwiftly

final class MainDashboardViewController: UIViewController {

    lazy var headerView: UIView = {
        let headerView = UIView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()

    lazy var headerTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Steganographer"
        title.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        return title
    }()

    lazy var infoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.init(systemName: "info.circle.fill"), for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(onInfoPress), for: .touchUpInside)
        return button
    }()

    lazy var bodyContainer: UIView = {
        let bodyView = UIView()
        bodyView.translatesAutoresizingMaskIntoConstraints = false
        return bodyView
    }()

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "mona")
        return imageView
    }()

    lazy var encodeButton: UIButton = {
        let button = RoundedButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.selectedText = "Encode"
        button.addTarget(self, action: #selector(self.handleTap(_:)), for: .touchUpInside)
        return button
    }()

    lazy var decodeButton: UIButton = {
        let button = RoundedButton()
        button.selectedText = "Decode"
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.handleDecode(_:)), for: .touchUpInside)
        button.setAccessibiltyWithIdentifier(with: "decodeButton")
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }

    @objc func onEncodePress() {
        print("Encode Button Pressed from Main")
        let encodingViewController = EncodingViewController()

        self.navigationController?.pushViewController(encodingViewController, animated: true)
    }

    @objc func onDecodePress() {
        print("Decode Button Pressed from Main")
        let decodingViewController = DecodingViewController()

        self.navigationController?.pushViewController(decodingViewController, animated: true)
    }

    @objc func onInfoPress() {
        print("Info Button Pressed from Main")
    }

    /// Simple function for setting up constraints, anchors etc.
    private func setupLayout() {

        // MARK: Header initalization
        view.addSubview(headerView)
        headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16).isActive = true
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        headerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true

        headerView.addSubview(headerTitle)
        headerView.addSubview(infoButton)

        infoButton.centerYAnchor.constraint(equalTo: headerTitle.centerYAnchor).isActive = true
        infoButton.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 32).isActive = true
        infoButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        infoButton.widthAnchor.constraint(equalToConstant: 32).isActive = true

        headerTitle.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 16).isActive = true
        headerTitle.leftAnchor.constraint(equalTo: infoButton.rightAnchor, constant: 16).isActive = true

        // MARK: Main UI initalization
        view.addSubview(bodyContainer)

        bodyContainer.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 16).isActive = true
        bodyContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bodyContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bodyContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7).isActive = true

        bodyContainer.addSubview(imageView)
        bodyContainer.addSubview(encodeButton)
        bodyContainer.addSubview(decodeButton)

        imageView.centerXAnchor.constraint(equalTo: bodyContainer.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: bodyContainer.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: bodyContainer.heightAnchor, multiplier: 0.5).isActive = true
        imageView.widthAnchor.constraint(equalTo: bodyContainer.widthAnchor, multiplier: 0.5).isActive = true

        encodeButton.centerXAnchor.constraint(equalTo: bodyContainer.centerXAnchor).isActive = true
        encodeButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32).isActive = true
        encodeButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        decodeButton.topAnchor.constraint(equalTo: encodeButton.bottomAnchor, constant: 16).isActive = true
        decodeButton.centerXAnchor.constraint(equalTo: bodyContainer.centerXAnchor).isActive = true
        decodeButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }

}

// MARK: Image Encoding
extension MainDashboardViewController {
    func encodeTextInImage(with text: String, image: UIImage?) -> UIImage? {

        guard let image = imageView.image else {
            return nil
        }

        var imageRGBPixelValues = getRGBValuesWithPosionFromImage(image: image)
        var iteratorX = 0
        var iteratorY = 0
        let encodedTextBitsArray = text.uint8Array()
        let maxes = (len: imageRGBPixelValues.last?.x, height: imageRGBPixelValues.last?.y)

        for letter in encodedTextBitsArray {
            print("letter: \(pad(string: String(letter, radix: 2), toSize: 8))")
            for index in 0..<letter.bitWidth {
                switch index {
                case 0:
                    changeLSB(letterBit: letter.b7, pixelsArray: &imageRGBPixelValues, positionX: iteratorX, positionY: iteratorY)
                    if iteratorX == maxes.len {
                        iteratorY += 1
                        iteratorX = 0
                    } else {
                        iteratorX += 1
                    }
                case 1:
                    changeLSB(letterBit: letter.b6, pixelsArray: &imageRGBPixelValues, positionX: iteratorX, positionY: iteratorY)
                    if iteratorX == maxes.len {
                        iteratorY += 1
                        iteratorX = 0
                    } else {
                        iteratorX += 1
                    }
                case 2:
                    changeLSB(letterBit: letter.b5, pixelsArray: &imageRGBPixelValues, positionX: iteratorX, positionY: iteratorY)
                    if iteratorX == maxes.len {
                        iteratorY += 1
                        iteratorX = 0
                    } else {
                        iteratorX += 1
                    }
                case 3:
                    changeLSB(letterBit: letter.b4, pixelsArray: &imageRGBPixelValues, positionX: iteratorX, positionY: iteratorY)
                    if iteratorX == maxes.len {
                        iteratorY += 1
                        iteratorX = 0
                    } else {
                        iteratorX += 1
                    }
                case 4:
                    changeLSB(letterBit: letter.b3, pixelsArray: &imageRGBPixelValues, positionX: iteratorX, positionY: iteratorY)
                    if iteratorX == maxes.len {
                        iteratorY += 1
                        iteratorX = 0
                    } else {
                        iteratorX += 1
                    }
                case 5:
                    changeLSB(letterBit: letter.b2, pixelsArray: &imageRGBPixelValues, positionX: iteratorX, positionY: iteratorY)
                    if iteratorX == maxes.len {
                        iteratorY += 1
                        iteratorX = 0
                    } else {
                        iteratorX += 1
                    }
                case 6:
                    changeLSB(letterBit: letter.b1, pixelsArray: &imageRGBPixelValues, positionX: iteratorX, positionY: iteratorY)
                    if iteratorX == maxes.len {
                        iteratorY += 1
                        iteratorX = 0
                    } else {
                        iteratorX += 1
                    }
                case 7:
                    changeLSB(letterBit: letter.b0, pixelsArray: &imageRGBPixelValues, positionX: iteratorX, positionY: iteratorY)
                    if iteratorX == maxes.len {
                        iteratorY += 1
                        iteratorX = 0
                    } else {
                        iteratorX += 1
                    }
                default:
                    break
                }
            }
        }

        return ImageModifier().applyModifier(.stego, to: image, rgbValues: imageRGBPixelValues)
    }

    func getRGBValuesWithPosionFromImage(image: UIImage) -> [PixelWithPosition] {
       let heightInPoints = image.size.height
       let heightInPixels = heightInPoints * image.scale

       let widthInPoints = image.size.width
       let widthInPixels = widthInPoints * image.scale

       var pixelRBGValues: [PixelWithPosition] = []
        // swiftlint:disable identifier_name
       for y in 0..<Int(heightInPixels) {
           // swiftlint:disable identifier_name
          for x in 0..<Int(widthInPixels) {
             if let cgImage = image.cgImage, let
                    rgbValue = cgImage.rgbValuesForPixel(posY: y, posX: x) {
                let pixelWithRgb = PixelWithPosition(x: x, y: y, red: rgbValue.r, green: rgbValue.g, blue: rgbValue.b)
                pixelRBGValues.append(pixelWithRgb)
             }
          }
       }

       return pixelRBGValues
    }

    func changeLSB(letterBit: UInt8, pixelsArray: inout [PixelWithPosition], positionX: Int, positionY: Int) {
       var before: UInt8 = 1
       var after: UInt8 = 1

       if let pixelPos = pixelsArray.firstIndex(where: { $0.x == positionX && $0.y == positionY}) {
          var newPixel = pixelsArray[pixelPos]
          before = newPixel.red
          newPixel.red.setb0(letterBit)
          after = newPixel.red
          pixelsArray[pixelPos] = newPixel
       }

        let strBef = pad(string: String(before, radix: 2), toSize: 8)
        let lastBef = strBef.last!
        let strAft = pad(string: String(after, radix: 2), toSize: 8)
        let lastAft = strAft.last!
//        print("before 0 bit change RED value: \(strBef) ➡️\(lastBef)⬅️ and after: \(strAft) ➡️\(lastAft)⬅️")
    }

    func getArrayOfBytesFromImage(imageData: NSData) -> [UInt8] {

       // the number of elements:
       let count = imageData.length / MemoryLayout<Int8>.size

       // create array of appropriate length:
       var bytes = [UInt8](repeating: 0, count: count)

       // copy bytes into array
       imageData.getBytes(&bytes, length: count * MemoryLayout<Int8>.size)

       var byteArray: Array = [UInt8]()

       for index in 0 ..< count {
          byteArray.append(bytes[index])
       }

       return byteArray
    }

    func pad(string: String, toSize: Int) -> String {
       var padded = string
       for _ in 0..<(toSize - string.count) {
          padded = "0" + padded
       }
       return padded
    }
}

// MARK: Gesture recogniser
extension MainDashboardViewController {

    @objc func handleTap(_ sender: UITapGestureRecognizer) {
    // swiftlint:disable line_length
       let encodeText = """
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.|
"""
       imageView.image = encodeTextInImage(with: encodeText, image: imageView.image)
    }

    @objc func handleDecode(_ sender: UITapGestureRecognizer) {
        let pixelRBGValues = getRGBValuesWithPosionFromImage(image: imageView.image!)
        var decodedText = ""
        var iterator = 0
        var bytesArray: [UInt8] = []
        var placeholder: UInt8 = 0b00000000
        for pixel in pixelRBGValues {
            if decodedText.contains("|") {
                break
            }

            if iterator == 7 {
                switchByIndex(index: iterator, byte: &placeholder, to: pixel.red.b0)
                print("➡️" + String(placeholder, radix: 2))
                bytesArray.append(placeholder)
                decodedText = String(decoding: bytesArray, as: UTF8.self)
                iterator = 0
                placeholder = 0b00000000
                print("___")
            } else {
                switchByIndex(index: iterator, byte: &placeholder, to: pixel.red.b0)
                iterator += 1
            }

        }

        self.decodeButton.setTitle(decodedText, for: .normal)
    }

    func switchByIndex(index: Int, byte: inout UInt8, to: UInt8) {
        switch index {
        case 0:
            byte.setb7(to)
        case 1:
            byte.setb6(to)
        case 2:
            byte.setb5(to)
        case 3:
            byte.setb4(to)
        case 4:
            byte.setb3(to)
        case 5:
            byte.setb2(to)
        case 6:
            byte.setb1(to)
        case 7:
            byte.setb0(to)
        default:
            break
        }
    }
}
