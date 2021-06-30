//
//  types.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 04.06.2021.
//

// Nodes
typealias ROOT = RootNode
typealias R = TestNode
typealias EITHER = EitherNode
typealias RUNTIME = RuntimeNode
typealias UPGRADE = UpgradeNode
typealias DEAD = DeadNode
typealias FINISH = FinishNode
typealias PANIC414C = PanicNode414C
typealias PANIC = PanicNode
typealias WARN = WarnNode
typealias ECHO = EchoNode
typealias YELL = YellNode
typealias SHAKE = ShakeNode
typealias RND_NUM = RndNumNode
typealias RND_WORD = RndWordNode
typealias DICE = DiceNode
typealias COIN = CoinNode
typealias CMD = CmdNode
typealias DANCE = DanceNode
typealias MUSIC = MusicNode
typealias MATH = MathNode
typealias RADIX = RadixNode

// Edges
typealias AL = TestEdge
typealias TRAVERSE_ALL = TraverseAllEdge
typealias TRAVERSE_IF = TraverseIfEdge
typealias HELP = HelpEdge

// Graphs
typealias BIN = BinGraph
typealias HEX = HexGraph
typealias COMMON = CommonGraph
typealias DAMAGES = CommonGraph.Damages
typealias GENERIC = CommonGraph.Generic
typealias SETTINGS = CommonGraph.Settings
typealias FATALITY = CommonGraph.Fatality
typealias EMOTION = CommonGraph.Emotion
typealias DATETIME = CommonGraph.DateTime
typealias CALCULATE = CommonGraph.Math
typealias INTERACTIVE = CommonGraph.Interactive
