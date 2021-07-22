//
//  TerminalCommandPredictive.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 21.07.2021.
//

import SwiftUI

typealias Prediction = (label: String, value: String)

struct TerminalCommandPredictive: View {
    @EnvironmentObject var keyboardVM: KeyboardViewModel
    @EnvironmentObject var chatVM: ChatViewModel
    @EnvironmentObject var themeVM: ThemeViewModel
    
    @State var predictions: [Prediction]?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                if let predictions = self.predictions {
                    ForEach(predictions.map { Item($0) }) { item in
                        Text(item.content.label)
                            .onTapGesture {
                                keyboardVM.set(item.content.value + " ")
                            }
                    }
                } else {
                    ForEach(chatVM.current.replies.map { Item($0) }) { item in
                        Text("> " + item.content)
                            .onTapGesture {
                                keyboardVM.set(item.content + " ")
                            }
                    }
                    let rootReplies = Set(chatVM.root.replies.map { $0.components(separatedBy: " ").first! })
                    ForEach(rootReplies.map { Item($0) }) { item in
                        Text(item.content)
                            .onTapGesture {
                                keyboardVM.set(item.content + " ")
                            }
                    }
                }
            }
            .onChange(of: keyboardVM.input) { input in
                if input.isEmpty {
                    withAnimation {
                        self.predictions = .none
                    }
                } else {
                    DispatchQueue.global().async {
                        // filter possible replies
                        let filtered = chatVM.allReplies.filter { $0.starts(with: input) }
                        print("filtered: ", filtered)
                        
                        // prediction index
                        let tokenizedInput = input.tokenize() // punctuation??
                        let endsWithSpace = input.hasSuffix(" ")
                        let endIndex = tokenizedInput.endIndex
                        let index = endsWithSpace ? endIndex : endIndex - 1
                        
                        // create predictions
                        let tokenizedFilter = filtered.map { $0.tokenize() } // punctuation?
                        print("tokenized filter: ", tokenizedFilter)
                        let tokenizedPredictions = tokenizedFilter.filter { $0.count >= index + 1 }
                        var predictions: [Prediction] = []
                        for tokenizedPrediction in tokenizedPredictions {
                            let label = tokenizedPrediction[index]
                            if !predictions.contains(where: { $0.label == label }) {
                                let value = tokenizedPrediction[...index].joined(separator: " ")
                                predictions.append((label, value))
                            }
                        }
                        print(predictions)
                        
                        
                        DispatchQueue.main.async {
                            withAnimation {
                                self.predictions = predictions

                            }
                        }
                        
                    }
                }

                //reader.scrollTo(input)
            }
        }
        .frame(height: SegueViewModel.header.height)
        .background(themeVM.terminal.cli.view.background)
    }
}
