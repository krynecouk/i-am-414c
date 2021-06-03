//
//  FinishedGameScreen.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 03.06.2021.
//

import SwiftUI

struct FinishedGameScreen: View {
    @EnvironmentObject var uiVM: UIViewModel
    @EnvironmentObject var themeVM: ThemeViewModel
    
    let text = "Congratulations!\nYou have finished the main story.\n\nContinue finding missing letters or start again at a different difficulty.\n\nThank you for playing!"
    
    var body: some View {
        Modal(
            action: {
                withAnimation {
                    uiVM.isFinishedGame = false
                }
            },
            theme: themeVM.intro.finish) {
            Text(text)
                .lineSpacing(10)
                .font(Font.of(props: themeVM.intro.finish.body.font))
                .multilineTextAlignment(.center)
                .foregroundColor(themeVM.intro.finish.body.color)
        }
    }
    
}

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
        content
            .padding(.top, 60)
            .padding([.bottom], 20)
            .padding([.trailing, .leading], 10)
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

struct FinishedGameScreen_Previews: PreviewProvider {
    static var previews: some View {
        CathodeView {
            FinishedGameScreen()
        }
        .withEnvironment()
        
    }
}
