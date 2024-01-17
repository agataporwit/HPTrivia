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
                    .opacity(1)
                
                VStack {
                    VStack {
                        Image(systemName: "bolt.fill")
                            .font(.largeTitle)
                            .imageScale(.large)
                            .padding(.top, 10)
                        
                        Text(" * Harry Potter * ")
                            .font(.custom(Constants.hpFont, size: 70))
                            .padding(.bottom, -50)
                            .foregroundColor(.white)
                            .shadow(color: .purple, radius: 20)
                        
                        Text("Trivia")
                            .font(.custom(Constants.hpFont, size: 60))
                            .foregroundColor(.white)
                    }
                    .background(.black)
                    .cornerRadius(10)
                    .opacity(0.7)
                    .shadow(color: .yellow, radius: 5)
                    .padding(.top, 70)
                    
                    Spacer()
                    
                    VStack {
                        Text("Recent Scores")
                            .font(.custom(Constants.hpFont, size: 50))
                        
                        
                        
                        Text("33")
                        Text("27")
                        Text("16")
                    }
                    .font(.custom(Constants.hpFont, size: 40))
                    .padding(.top, 20)
                    .padding(.horizontal)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.7))
                    .shadow(color: .yellow, radius: 20)
                    .cornerRadius(10)
                    
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        Button {
                        } label: {
                            Image(systemName: "info.circle.fill")
                                .font(.custom(Constants.hpFont, size: 35))
                                .foregroundColor(.black)
                                .shadow(color: .white ,radius: 10)
                                .opacity(0.5)
                            
                        }
                        
                        Spacer()
                        
                        Button() {
                            
                        } label: {
                            Text("Play")
                                .font(.custom(Constants.hpFont, size: 50))
                                .foregroundColor(.white)
                                .padding(.top)
                                .padding(.vertical, 7)
                                .padding(.horizontal, 50)
                                .background(.black)
                                .cornerRadius(10)
                                .shadow(color: .yellow, radius: 5)
                                .opacity(0.7)
                        }
                        
                        Spacer()
                        
                        Button {
                        } label: {
                            Image(systemName: "gearshape.fill")
                                .font(.largeTitle)
                                .foregroundColor(.black)
                                .shadow( color:.white, radius: 10).opacity(0.5)
                            
                        }
                        
                        Spacer()
                    }
                    .frame(width: geo.size.width)
                    
                    Spacer()
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
