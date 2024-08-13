//
//  MainReducer.swift
//  TCAStackNavigation
//
//  Created by Anton Gorlov on 09.08.2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct MainReducer {
    
    @ObservableState
    struct State {
        var stackState = StackState<NavigationRoute.State>()
    }
    
    enum Action {
        case navigationAction(StackActionOf<NavigationRoute>)
    }
    
    // Here we need to indicate the reducers that will be in our stack
    // @Reducer generates State as an enum that has states for playerDescription and scoreStatistics. And the same Actions
    
    @Reducer
    enum NavigationRoute {
        case playerDescription(PlayerReducer)
        case scoreStatistics(ScoreReducer)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .navigationAction(.element(id: _,
                                            action: .playerDescription(.closeToRootAction))):
                state.stackState.removeAll()
                return .none
            case .navigationAction(.element(id: _,
                                            action: .scoreStatistics(.closeToRootAction))):
                state.stackState.removeAll()
                return .none
            case .navigationAction(.element(id: _,
                                            action: .playerDescription(.openScoreAction(let playerModel)))):
                state.stackState.append(
                    NavigationRoute.State.scoreStatistics(
                        ScoreReducer.State(
                            playerModel: playerModel
                        )
                    )
                )
                return .none
            default:
                return .none
            }
        }
        .forEach(\.stackState, action: \.navigationAction)
       
    }
}

// forEach - For each navigationAction, you need to look in the stackState to see if there is a Reducer that can process the current action, if so, then this navigationAction is passed to that Reducer
