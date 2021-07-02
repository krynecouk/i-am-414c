//
//  IntroVideo.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 01.07.2021.
//

import SwiftUI
import AVFoundation

struct IntroVideo: View {
    @EnvironmentObject var playerVM: PlayerViewModel
    @EnvironmentObject var uiVM: UIViewModel
    
    @State var textOpacity: Double = 0
    
    var body: some View {
        ZStack(alignment: .top) {
            PlayerContainerView(player: playerVM.player, gravity: .aspectFill)
                .onAppear {
                    self.playerVM.onFinish {
                        skip()
                    }
                    self.playerVM.isPlaying = true
                    
                    let now = DispatchTime.now()
                    
                    DispatchQueue.main.asyncAfter(deadline: now + 0.6) {
                        if playerVM.isPlaying {
                            withAnimation(.default.speed(0.2)) {
                                self.textOpacity = 1
                            }
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: now + 4) {
                        if playerVM.isPlaying {
                            withAnimation(.default.speed(0.2)) {
                                self.textOpacity = 0
                            }
                        }
                    }
                }
            
            I_AM_414C_OVERLAY(opacity: self.textOpacity) {
                TapToSkip()
            }

        }
        .edgesIgnoringSafeArea(.all)
        .statusBar(hidden: true)
        .onTapGesture {
            if playerVM.isPlaying {
                skip()
            }
        }
    }
    
    func TapToSkip() -> some View {
        Text("tap to skip")
            .font(Font.of(name: .proggyTiny, size: 30))
            .foregroundColor(Color.gray.opacity(0.5))
    }
    
    func skip() {
        self.playerVM.isPlaying = false
        uiVM.video = nil
        uiVM.isIntro = true
    }
}

struct I_AM_414C_OVERLAY<Footer: View>: View {
    
    let opacity: Double
    let footer: Footer?
    
    init(opacity: Double = 1, @ViewBuilder footer: () -> Footer? = { .none }) {
        self.opacity = opacity
        self.footer = footer()
    }
    
    var body: some View {
        VStack {
            I_AM_414C()
                .frame(width: 300)
                .offset(y: 50)
                .opacity(self.opacity)
            Spacer()
            if let footer = self.footer {
                footer
                    .offset(y: -50)
                    .opacity(self.opacity)
            }
        }
    }
}

struct I_AM_414C: View {
    var body: some View {
        VStack {
            HStack {
                MainText("I")
                Spacer()
                MainText("AM")
                    .offset(x: 18)
            }
            HStack {
                MainText("4")
                Spacer()
                MainText("1")
                Spacer()
                MainText("4")
                Spacer()
                MainText("C")
            }
        }
    }
    
    func MainText(_ text: String) -> some View {
        Text(text)
            .font(Font.of(name: .ansiRegular, size: 100))
            .foregroundColor(Color("WhiteOrange"))
    }
}
