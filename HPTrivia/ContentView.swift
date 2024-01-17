//
//  ContentView.swift
//  HPTrivia
//
//  Created by Agata Porwit on 1/16/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("hogwarts")
                    .resizable()
                    .frame(width: geo.size.width * 3, height: geo.size.height)
                    .padding(.top, 3)
                    .opacity(0.7)
                
                VStack {
                    Image(systemName: "bolt.fill")
                        .font(.largeTitle)
                        .imageScale(.large)
                    
                    Text("HP")
                        .font(.custom(Constants.hpFont, size: 80))
                        .padding(.bottom, -50)
                    
                    Text("Trivia")
                        .font(.custom(Constants.hpFont, size: 60))
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
    }
}


struct ContentView_Priviews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
