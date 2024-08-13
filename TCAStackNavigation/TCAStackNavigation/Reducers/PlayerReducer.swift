//
//  PlayerReducer.swift
//  TCAStackNavigation
//
//  Created by Anton Gorlov on 09.08.2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct PlayerReducer {
    
    @Dependency(\.dismiss) var dismissPlayerScreen
    
    @ObservableState
    struct State {
        var playerModel: PlayerModel
    }
    
    enum Action {
        case openScoreAction(PlayerModel)
        case closeAction
        case closeToRootAction
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .closeAction:
                
                return .run { _ in
                    await dismissPlayerScreen()
                }
            case .closeToRootAction:
                return .none
            case .openScoreAction:
                return .none
            }
        }
    }
}
