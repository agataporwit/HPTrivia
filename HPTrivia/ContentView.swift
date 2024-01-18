//
//  ContentView.swift
//  HPTrivia
//
//  Created by Agata Porwit on 1/16/24.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @State private var audioPlayer: AVAudioPlayer!
    @State private var scalePlayButton = false
    @State private var moveBackgroundImage = false
    @State private var animateViewsIn = false
    
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("hogwarts")
                    .resizable()
                    .frame(width: geo.size.width * 3, height: geo.size.height)
                    .padding(.top, 3)
                    .opacity(1)
                    .offset(x: moveBackgroundImage ? geo.size.width/1.1 : -geo.size.width/1.1)
                    .onAppear() {
                        withAnimation(.linear(duration: 60).repeatForever()) {
                            moveBackgroundImage.toggle()
                        }
                    }
                
                VStack {
                    VStack {
                        if animateViewsIn {
                            VStack {
                                Image(systemName: "bolt.fill")
                                    .font(.largeTitle)
                                    .imageScale(.large)
                                    .padding(.top, 10)
                                    .shadow(color: .red, radius: 3)
                                
                                
                                Text(" * Harry Potter * ")
                                    .font(.custom(Constants.hpFont, size: 60))
                                    .padding(.bottom, -50)
                                    .shadow(color: .yellow, radius: 6)
                                
                                Text("Trivia")
                                    .font(.custom(Constants.hpFont, size: 50))
                                    .shadow(color: .yellow, radius: 6)
                            }
                            
                            .padding(.top, 70)
                            .transition(.move(edge: .top))
                        }
                    }
                    .animation(.easeOut(duration: 0.7).delay(2.7),value: animateViewsIn)
                    
                    Spacer()
                    
                    VStack {
                        if animateViewsIn {
                            VStack {
                                
                                Text("Recent Scores")
                                    .font(.custom(Constants.hpFont, size: 50))
                                
                                
                                
                                Text("33")
                                Text("27")
                                Text("16")
                            }
                            .font(.custom(Constants.hpFont, size: 35))
                            .padding(.top, 20)
                            .padding(.horizontal)
                            .foregroundColor(.white)
                            .background(.white.opacity(0.2))
                            .shadow(color: .black, radius: 6)
                            .cornerRadius(10)
                            .transition(.opacity)
                            
                        }
                    }
                    .animation(.linear(duration: 1).delay(4), value: animateViewsIn)
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        VStack {
                            if animateViewsIn {
                                Button {
                                } label: {
                                    Image(systemName: "info.circle.fill")
                                        .font(.custom(Constants.hpFont, size: 35))
                                        .foregroundColor(.black)
                                        .shadow(color: .white ,radius: 10)
                                        .opacity(0.5)
                                    
                                }
                                .transition(.offset(x: -geo.size.width/4))
                            }
                        }
                        .animation(.easeOut(duration: 0.7).delay(2.7), value: animateViewsIn )
                        
                        Spacer()
                        
                        VStack {
                            if animateViewsIn {
                                Button() {
                                    
                                } label: {
                                    Text("Play")
                                        .font(.custom(Constants.hpFont, size: 50))
                                        .foregroundColor(.white)
                                        .padding(.top)
                                        .padding(.vertical, 7)
                                        .padding(.horizontal, 50)
                                        .background(.white.opacity(0.2))
                                        .shadow(color: .black, radius: 6)
                                        .cornerRadius(10)
                                    
                                }
                                .scaleEffect(scalePlayButton ? 1.2 : 1)
                                .onAppear {
                                    withAnimation(.easeInOut(duration: 1.3).repeatForever()) {
                                        scalePlayButton.toggle()
                                    }
                                }
                                .transition(.offset(y: geo.size.height/3))
                            }
                        }
                        .animation(.easeOut(duration: 0.7).delay(2.7),value: animateViewsIn)
                        
                        
                        Spacer()
                        
                        VStack {
                            if animateViewsIn {
                                Button {
                                } label: {
                                    Image(systemName: "gearshape.fill")
                                        .font(.largeTitle)
                                        .foregroundColor(.black)
                                        .shadow( color:.white, radius: 10).opacity(0.5)
                                }
                                
                                .transition(.offset(x: geo.size.width/4))
                            }
                        }
                        .animation(.easeOut(duration: 0.7).delay(2.7),value: animateViewsIn)
                        
                        Spacer()
                    }
                    .frame(width: geo.size.width)
                    
                    Spacer()
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
            
        }
        .ignoresSafeArea()
        .onAppear {
            animateViewsIn = true
            //dont forget to remove comment to play audio
            // playAudio()
        }
    }
    
    private func playAudio() {
        let sound = Bundle.main.path(forResource: "magic-in-the-air", ofType: "mp3")
        audioPlayer = try! AVAudioPlayer(contentsOf: URL(filePath: sound!))
        audioPlayer.numberOfLoops = -1
        audioPlayer.play()
    }
}
struct ContentView_Priviews: PreviewProvider {
    static var previews: some View {
        VStack {
            ContentView()
        }
    }
}

//Vstack in preview is just for animation preview as there is a bug in swift
