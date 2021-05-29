//
//  ContentView.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 29/05/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var showPhotoLibrary = false
    @State var image : Image?
    
    var body: some View {
        ZStack {
            // All properties will be used on it only if not nil
            image?
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Button(action: {
                    showPhotoLibrary.toggle()
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
                    .padding()
                })
            }.sheet(isPresented: $showPhotoLibrary) {
                PhotoPicker(isPresented: $showPhotoLibrary, selectedImage: $image)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
