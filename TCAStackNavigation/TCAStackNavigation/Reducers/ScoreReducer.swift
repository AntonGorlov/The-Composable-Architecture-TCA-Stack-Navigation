//
//  ScoreReducer.swift
//  TCAStackNavigation
//
//  Created by Anton Gorlov on 09.08.2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct ScoreReducer {
    
    @Dependency(\.dismiss) var dismissPlayerScreen
    
    @ObservableState
    struct State {
        var playerModel: PlayerModel
    }
    
    enum Action {
        case closeToRootAction
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .closeToRootAction:
                return .run { _ in
                    await dismissPlayerScreen()
                }
            }
        }
    }
}
