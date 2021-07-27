//
//  KeyboardPrediction.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 21.07.2021.
//

import SwiftUI

typealias Prediction = (label: String, value: String)

struct KeyboardPrediction: View {
    @EnvironmentObject var keyboardVM: KeyboardViewModel
    @EnvironmentObject var graphVM: GraphViewModel
    @EnvironmentObject var chatVM: ChatViewModel
    @EnvironmentObject var themeVM: ThemeViewModel
    @EnvironmentObject var asciiVM: ASCIIViewModel
    
    @State var predictions: [Prediction]?
    @State var uuid: UUID = UUID()
    
    var body: some View {
        let isEmpty = keyboardVM.input.isEmpty && chatVM.current.replies.isEmpty
        let isRoot = graphVM.current is RootNode
        let isStartOfGame = !asciiVM.symbols.contains(.A)
        
        if (!isRoot && isEmpty) || (isRoot && !isStartOfGame && isEmpty) {
            PlaceholderPanel()
        } else {
            PredictionPanel()
        }
    }
    
    func PlaceholderPanel() -> some View {
        ZStack {
            Rectangle()
                .fill(themeVM.terminal.cli.view.background ?? Color.clear)
            Text("start typing...")
                .font(Font.of(props: FontProps(.proggyTiny, 35)))
                .foregroundColor(themeVM.terminal.cathode.background.opacity(0.9))
        }
        .frame(height: KeyboardViewModel.prediction.height)
    }
    
    func PredictionPanel() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                if !keyboardVM.input.isEmpty && keyboardVM.input.last != " " {
                    if let lastWord = keyboardVM.input.lastWord() {
                        PredictionButton(("\"\(lastWord)\"", keyboardVM.input))
                    }
                }
                
                if let predictions = self.predictions {
                    ForEach(predictions.map { Item($0) }) { item in
                        PredictionButton(item.content)
                    }
                } else {
                    if graphVM.current is RootNode {
                        ForEach(["HI", "I?"].map { Item($0) }) { item in
                            PredictionButton((item.content, item.content))
                        }
                    } else {
                        ForEach(chatVM.current.replies.map { Item($0) }) { item in
                            PredictionButton((item.content, item.content))
                        }
                    }
                }
            }
            .padding([.leading, .trailing], 15)
            .onAppear {
                initPredictions(with: keyboardVM.input)
            }
            .onChange(of: keyboardVM.input) { input in
                initPredictions(with: input)
            }
        }
        .frame(height: KeyboardViewModel.prediction.height)
        .background(themeVM.terminal.cli.view.background)
    }
    
    func initPredictions(with input: String) {
        if input.isEmpty {
            withAnimation {
                self.predictions = .none
            }
        } else {
            DispatchQueue.global().async {
                // filter possible replies
                let filtered = chatVM.allReplies.filter { $0.starts(with: input) }
                
                // prediction index
                //let tokenizedInput = input.tokenize(omitPunctuation: false) // punctuation??
                let tokenizedInput = input.trim().components(separatedBy: " ")
                let endsWithSpace = input.hasSuffix(" ")
                let endIndex = tokenizedInput.endIndex
                let index = endsWithSpace ? endIndex : endIndex - 1
                
                // create predictions
                //let tokenizedFilter = filtered.map { $0.tokenize(omitPunctuation: false) } // punctuation?
                let tokenizedFilter = filtered.map { $0.trim().components(separatedBy: " ") }
                let tokenizedPredictions = tokenizedFilter.filter { $0.count >= index + 1 }
                var predictions: [Prediction] = []
                let keyboardLastWord = keyboardVM.input.lastWord()
                for tokenizedPrediction in tokenizedPredictions {
                    guard let label = tokenizedPrediction[safe: index] else {
                        continue
                    }
                    if keyboardLastWord == label {
                        continue
                    }
                    
                    if !predictions.contains(where: { $0.label == label }) {
                        let value = tokenizedPrediction[...index].joined(separator: " ")
                        predictions.append((label, value))
                    }
                }
                
                DispatchQueue.main.async {
                    self.predictions = predictions
                }
            }
        }
    }
}

struct PredictionButton: View {
    @EnvironmentObject var keyboardVM: KeyboardViewModel
    @EnvironmentObject var themeVM: ThemeViewModel
    
    let active: Bool
    let click: Sound = Sound.of(.click)
    let prediction: Prediction
    
    init(_ prediction: Prediction, active: Bool = false) {
        self.active = active
        self.prediction = prediction
    }
    
    var body: some View {
        PredictionLabel(prediction.label, theme: themeVM.keyboard.prediction)
            .background(RoundedBackground(color: themeVM.keyboard.prediction.background))
            .onTapGesture {
                click.play()
                keyboardVM.set(prediction.value + " ")
            }
    }
    
    func PredictionLabel(_ text: String, theme: ViewTheme) -> some View {
        Text(text)
            .allowsTightening(true)
            .minimumScaleFactor(0.1)
            .multilineTextAlignment(.center)
            .font(Font.of(props: theme.font))
            .foregroundColor(theme.color)
            .offset(x: 2, y: 3.5)
            .padding([.top, .bottom], 13)
            .padding([.trailing, .leading], 25)
    }
}

struct RoundedBackground: View {
    let color: Color?
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(self.color ?? Color.clear)
            //.padding([.leading, .trailing], 5)
            .padding([.trailing], 3)
        
    }
}
