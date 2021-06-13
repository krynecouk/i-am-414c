//
//  CmdNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 13.06.2021.
//

class CmdNode: TestNode {
    init(@EdgeBuilder _ edges: () -> [Edge] = {[]}) {
        super.init("cmd", edges)
    }
    
    override func onEnter(ctx: GraphContext, toolkit: GraphToolkit) {
        let cmd: String = CmdDao.find() ?? createCmd(from: toolkit.asciiVM.symbols)
        self.name = cmd
        super.onEnter(ctx: ctx, toolkit: toolkit)
        CmdDao.store(cmd)
    }
    
    func createCmd(from symbols: Set<ASCIISymbol>) -> String {
        "INIT \(randomString(from: symbols.map { $0.rawValue }.joined(), length: 5))"
    }
    
    func randomString(from letters: String, length: Int) -> String {
        String((0..<length).map{ _ in letters.randomElement()! })
    }
}
