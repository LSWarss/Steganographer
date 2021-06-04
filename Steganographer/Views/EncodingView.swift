//
//  ContentView.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 29/05/2021.
//

import SwiftUI

struct EncodingView: View {
    
    @State private var image: Image?
    @State private var inputImage : UIImage?
    @State private var showingImagePicker = false
    @State private var message : String = "Message"
    
    var body: some View {
        ZStack {
            // All properties will be used on it only if not nil
            image?
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            if image != nil {
                VStack(spacing: 10)  {
                    Spacer()
                    Button(action: {
                        let imageSaver = ImageSaver()
                        imageSaver.writeToPhotoAlbum(image: self.inputImage!)
                        cleanData()
                    }, label: {
                        HStack {
                            Image(systemName: "photo")
                                .font(.system(size: 20))
                            Text("Save Encoded Photo")
                                .font(.headline)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    })
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
                .padding()
            } else {
                VStack(spacing: 10) {
                    Spacer()
                    ZStack {
                        Rectangle()
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                            .foregroundColor(.purple)
                            .cornerRadius(10)
                            .padding(.horizontal)
                        TextField("Enter message to hide:", text: $message)
                            .padding(.horizontal, 30.0)
                            .font(.headline)
                            .foregroundColor(.white)
                        
                    }
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
                    PhotoPicker(isPresented: $showingImagePicker, selectedImage: $inputImage, message: $message, visibleImage: $image)
                }
            .padding()
            }
        }
    }
    
    func cleanData() {
        self.image = nil
        self.inputImage = nil
    }
        
}



struct EncodingView_Previews: PreviewProvider {
    static var previews: some View {
        EncodingView()
    }
}
