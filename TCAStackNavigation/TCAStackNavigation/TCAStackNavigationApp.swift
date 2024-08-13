//
//  TCAStackNavigationApp.swift
//  TCAStackNavigation
//
//  Created by Anton Gorlov on 09.08.2024.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCAStackNavigationApp: App {
    var body: some Scene {
        WindowGroup {
            
            let player1 = PlayerModel(id: UUID(),
                                      name: "Edwin",
                                      surname: "Van Der Sar",
                                      age: 53,
                                      number: 1,
                                      position: .golkeeper, 
                                      score: ScoreModel(count: 2))
            
            let player2 = PlayerModel(id: UUID(),
                                      name: "Roberto",
                                      surname: "Carlos",
                                      age: 51,
                                      number: 3,
                                      position: .defender,
                                      score: ScoreModel(count: 32))
            
            let player3 = PlayerModel(id: UUID(),
                                      name: "Clarence",
                                      surname: "Seedorf",
                                      age: 48,
                                      number: 20,
                                      position: .midfield,
                                      score: ScoreModel(count: 214))
            
            let player4 = PlayerModel(id: UUID(),
                                      name: "Edson Arantis",
                                      surname: "Pele",
                                      age: 82,
                                      number: 10,
                                      position: .forward,
                                      score: ScoreModel(count: 754))
            
            let players = [player1, player2, player3, player4]
            
            
            MainView(store: 
                        Store(initialState: MainReducer.State(),
                              reducer: {
                MainReducer()
            }),
                     players: players)
        }
    }
}
