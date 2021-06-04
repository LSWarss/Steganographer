//
//  MainView.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 04/06/2021.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: EncodingView()) {
                    ZStack {
                        Rectangle()
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                            .foregroundColor(.purple)
                            .cornerRadius(10)
                            .padding(.horizontal)
                        Text("Hide text in Image")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                }
                NavigationLink(destination: DecodingView()) {
                    ZStack {
                        Rectangle()
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                            .foregroundColor(.purple)
                            .cornerRadius(10)
                            .padding(.horizontal)
                        Text("Get text from the Image")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                }
                
            }
            .navigationTitle("Steganographer")
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
