//
//  Modal.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 29.06.2021.
//

import SwiftUI

struct Modal<Content: View>: View {
    let content: Content
    let theme: ModalTheme
    let action: () -> Void
    
    init(action: @escaping () -> Void = {}, theme: ModalTheme, @ViewBuilder content: () -> Content) {
        self.action = action
        self.theme = theme
        self.content = content()
    }
    
    var body: some View {
        ScrollView {
            content
                .padding([.trailing, .leading], 12)
                .padding(.bottom, 35)
                .offset(y: 15)
        }
        .padding(.top, 40)
        .background(Modal)
        .padding([.trailing, .leading], 30)
    }
    
    var Modal: some View {
        VStack(spacing: 0) {
            ModalHeader
            ModalBody
        }
    }
    
    var ModalHeader: some View {
        HStack {
            Spacer()
            ModalHeaderButton
        }
        .background(ModalHeaderLine)
    }
    
    var ModalHeaderButton: some View {
        Button(action: action) {
            ZStack {
                Rectangle()
                    .fill(theme.button.background ?? Color.clear)
                    .frame(width: 40, height: 40)
                Text("x")
                    .foregroundColor(theme.button.color)
                    .font(Font.of(props: theme.button.font))
                    .onTapGesture {
                        action()
                    }
            }
        }
    }
    
    var ModalHeaderLine: some View {
        Rectangle()
            .fill(theme.header.background ?? Color.clear)
            .frame(height: 40)
    }
    
    var ModalBody: some View {
        Rectangle()
            .fill(theme.body.background ?? Color.clear)
    }
}
