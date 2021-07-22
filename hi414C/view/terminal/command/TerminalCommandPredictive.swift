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
    
    @State var filtered: [String]?
    @State var predictions: [Prediction]?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                if filtered == .none {
                    ForEach(chatVM.current.replies.map { Item($0) }) { item in
                        Text(item.content)
                            .onTapGesture {
                                keyboardVM.set(item.content + " ")
                            }
                    }
                    ForEach(chatVM.root.replies.map { Item($0) }) { item in
                        Text(item.content)
                            .onTapGesture {
                                keyboardVM.set(item.content + " ")
                            }
                    }
                } else {
                    ForEach(filtered!.map { Item($0) }) { item in
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
                        self.filtered = .none
                    }
                } else {
                    DispatchQueue.global().async {
                        // filter possible replies
                        let filtered = chatVM.allReplies.filter { $0.starts(with: input) }
                        print("filtered: ", filtered)
                        
                        // prediction index
                        let tokenizedInput = input.tokenize()
                        let endsWithSpace = input.hasSuffix(" ")
                        let endIndex = tokenizedInput.endIndex
                        let index = endsWithSpace ? endIndex : endIndex - 1
                        
                        //
                        let tokenizedFilter = filtered.map { $0.tokenize() }
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
                        
                        /*
                        DispatchQueue.main.async {
                            withAnimation {
                                self.filtered = filtered

                            }
                        }
                        */
                    }
                }

                //reader.scrollTo(input)
            }
        }
        .frame(height: SegueViewModel.header.height)
        .background(themeVM.terminal.cli.view.background)
    }
}
