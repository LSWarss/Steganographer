//
//  DecodingView.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 04/06/2021.
//

import SwiftUI

struct DecodingView: View {
    @State private var image: Image?
    @State private var inputImage : UIImage?
    @State private var showingImagePicker = false
    @State private var message : String = ""
    
    var body: some View {
        VStack(spacing: 10) {
            if message != "" {
                VStack {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.purple)
                            .cornerRadius(10)
                            .padding()
                    image?
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 280)
                    }
                    ZStack {
                    Rectangle()
                        .foregroundColor(.purple)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    Text(message)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                        .foregroundColor(.black)
                    }
                    Button(action: {
                        cleanData()
                    }, label: {
                        HStack {
                            Image(systemName: "xmark.bin")
                                .font(.system(size: 20))
                            Text("Cancel")
                                .font(.headline)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    })
                }
            } else {
                Spacer()
                VStack(spacing: 10) {
                    Button(action: {
                        self.showingImagePicker.toggle()
                    }, label: {
                        HStack {
                            Image(systemName: "photo")
                                .font(.system(size: 20))
                            Text("Choose Photo")
                                .font(.headline)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    })
                }.sheet(isPresented: $showingImagePicker) {
                    PhotoPicker(isPresented: $showingImagePicker, selectedImage: $inputImage, message: $message, visibleImage: $image, option: .decoding)
                }
            }
            
        }.navigationTitle("Decoding")
        
    }
    
    private func cleanData() {
        self.image = nil
        self.inputImage = nil
        self.message = ""
    }
}

struct DecodingView_Previews: PreviewProvider {
    static var previews: some View {
        DecodingView()
    }
}
