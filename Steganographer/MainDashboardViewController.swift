//
//  ViewController.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 18/10/2021.
//

import UIKit

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
        button.addTarget(self, action: #selector(onDecodePress), for: .touchUpInside)
        button.setAccessibiltyWithIdentifier("decodeButton")
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

       var pixelRBGValues = getRGBValuesWithPosionFromImage(image: image)
       var iterator = 0
       let encodedTextBitsArray = text.uint8Array()
//       let encodedBitsLen = text.count * 8

       for letter in encodedTextBitsArray {
          for index in 0..<7 {
             switch index {
             case 0:
                print("letter: \(pad(string: String(letter, radix: 2), toSize: 8))")
                changeLSB(letterBit: letter.b7, pixelsArray: &pixelRBGValues, positionX: iterator, positionY: 0)
                iterator += 1
             case 1:
                print("letter: \(pad(string: String(letter, radix: 2), toSize: 8))")
                changeLSB(letterBit: letter.b6, pixelsArray: &pixelRBGValues, positionX: iterator, positionY: 0)
                iterator += 1
             case 2:
                print("letter: \(pad(string: String(letter, radix: 2), toSize: 8))")
                changeLSB(letterBit: letter.b5, pixelsArray: &pixelRBGValues, positionX: iterator, positionY: 0)
                iterator += 1
             case 3:
                print("letter: \(pad(string: String(letter, radix: 2), toSize: 8))")
                changeLSB(letterBit: letter.b4, pixelsArray: &pixelRBGValues, positionX: iterator, positionY: 0)
                iterator += 1
             case 4:
                print("letter: \(pad(string: String(letter, radix: 2), toSize: 8))")
                changeLSB(letterBit: letter.b3, pixelsArray: &pixelRBGValues, positionX: iterator, positionY: 0)
                iterator += 1
             case 5:
                print("letter: \(pad(string: String(letter, radix: 2), toSize: 8))")
                changeLSB(letterBit: letter.b2, pixelsArray: &pixelRBGValues, positionX: iterator, positionY: 0)
                iterator += 1
             case 6:
                print("letter: \(pad(string: String(letter, radix: 2), toSize: 8))")
                changeLSB(letterBit: letter.b1, pixelsArray: &pixelRBGValues, positionX: iterator, positionY: 0)
                iterator += 1
             case 7:
                print("letter: \(pad(string: String(letter, radix: 2), toSize: 8))")
                changeLSB(letterBit: letter.b0, pixelsArray: &pixelRBGValues, positionX: iterator, positionY: 0)
                iterator += 1
             default:
                break
             }
          }
          print("\nIterator: \(iterator)")
       }

       return ImageModifier().applyModifier(.stego, to: image, rgbValues: pixelRBGValues)
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
          newPixel.red = pixelsArray[pixelPos].red.setb0(letterBit)
          after = newPixel.red
          pixelsArray[pixelPos] = newPixel
       }

       let strBef = pad(string: String(before, radix: 2), toSize: 8)
       let strAft = pad(string: String(after, radix: 2), toSize: 8)
       print("before 0 bit change: \(strBef) and after: \(strAft) ")
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
//       let data = imageView.image?.pngData()
//       var bytes = getArrayOfBytesFromImage(imageData: data! as NSData)
//
//       for i in 0..<bytes.count {
//          let before = bytes[i]
//          bytes[i] = bytes[i].setb0(0)
//          let after = bytes[i]
//          let strBef = pad(string: String(before, radix: 2), toSize: 8)
//          let strAft = pad(string: String(after, radix: 2), toSize: 8)
//          print("\(i) byte before 0 bit change: \(strBef) and after: \(strAft) ")
//       }

       let encodeText = "ZIOBRO"
       let pixelRBGValuesBefore = getRGBValuesWithPosionFromImage(image: imageView.image!)
       imageView.image = encodeTextInImage(with: encodeText, image: imageView.image)
       let pixelRBGValuesAfter = getRGBValuesWithPosionFromImage(image: imageView.image!)

       for i in 0..<pixelRBGValuesAfter.count {
           // swiftlint:disable line_length
           print("Pixel (\(pixelRBGValuesAfter[i].x),\(pixelRBGValuesAfter[i].y)) RGB value before: (r:\(pad(string: String(pixelRBGValuesBefore[i].red, radix: 2), toSize: 8)), g: \(pad(string: String(pixelRBGValuesBefore[i].green, radix: 2), toSize: 8)), b:\(pad(string: String(pixelRBGValuesBefore[i].blue, radix: 2), toSize: 8))) after: (r:\(pad(string: String(pixelRBGValuesAfter[i].red, radix: 2), toSize: 8)), g: \(pad(string: String(pixelRBGValuesAfter[i].green, radix: 2), toSize: 8)), b:\(pad(string: String(pixelRBGValuesAfter[i].blue, radix: 2), toSize: 8)))")
       }

//       let datos: NSData = NSData(bytes: bytes, length: bytes.count)
//       let newImage = UIImage(data: datos as Data) // Note it's optional. Don't force unwrap!!!
//       imageView.image = newImage

    }
}
