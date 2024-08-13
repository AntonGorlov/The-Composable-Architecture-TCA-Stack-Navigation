//
//  PlayerPosition.swift
//  TCAStackNavigation
//
//  Created by Anton Gorlov on 09.08.2024.
//

import Foundation

enum PlayerPosition: String {
    case golkeeper
    case defender
    case midfield
    case forward

    func description() -> String {
        switch self {
        case .golkeeper:
            return "Golkeeper"
        case .defender:
            return "Defender"
        case .midfield:
            return "Midfield"
        case .forward:
            return "Forward"
        }
    }
}
