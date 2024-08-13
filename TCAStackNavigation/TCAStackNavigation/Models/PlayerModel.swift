//
//  PlayerModel.swift
//  TCAStackNavigation
//
//  Created by Anton Gorlov on 09.08.2024.
//

import Foundation

struct PlayerModel: Identifiable {
    let id: UUID
    let name: String
    let surname: String
    let age: Int
    let number: Int
    let position: PlayerPosition
    let score: ScoreModel
}
