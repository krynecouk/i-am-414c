//
//  MathNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 20.06.2021.
//

import Expression
import Foundation

class MathNode: TestNode {
    init(@EdgeBuilder _ edges: () -> [Edge] = {[]}) {
        super.init("math", edges)
    }
    
    override func onEnter(ctx: GraphContext, toolkit: GraphToolkit) {
        let expression = getExpression(from: ctx.input)
        let result = try? expression.evaluate()
        if let result = result {
            self.name = getSafeStringResult(from: result, symbols: toolkit.asciiVM.symbols)
        } else {
            self.name = "ERROR"
        }
        super.onEnter(ctx: ctx, toolkit: toolkit)
    }
    
    override func onExit(ctx: GraphContext, toolkit: GraphToolkit) {
        Expression.clearCache()
        super.onExit(ctx: ctx, toolkit: toolkit)
    }
    
    private func getExpression(from input: String) -> Expression {
        if input.contains("^") {
            return Expression(input, symbols: [
                .infix("^"): { args in
                    pow(args[0], args[1])
                }
            ])
        }
        return Expression(input)
    }
    
    private func getSafeStringResult(from result: Double, symbols: Set<ASCIISymbol>) -> String {
        let symbols = symbols.map { $0.rawValue }
        let stringResult = getStringResult(from: result)
        for char in stringResult {
            if !symbols.contains(String(char)) {
                return "ERROR"
            }
        }
        return stringResult
    }
    
    private func getStringResult(from result: Double) -> String {
        switch result {
        case let result where result.isInfinite:
            return String("INFINITE")
        case let result where result.isNaN:
            return String("NOT A NUMBER")
        case let result where String(result).contains("e+"):
            return String(result).replacingOccurrences(of: "e+", with: "^")
        case let result where result.isFinite:
            return String(result)
        default:
            return "ERROR"
        }
    }
}
