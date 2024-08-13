//
//  MainView.swift
//  TCAStackNavigation
//
//  Created by Anton Gorlov on 09.08.2024.
//

import SwiftUI
import ComposableArchitecture

struct MainView: View {
    
    @Bindable var store: StoreOf<MainReducer>
    var players: [PlayerModel]
    
    var body: some View {
        
        NavigationStack( // or NavigationStackStore
            path: $store.scope(state: \.stackState, action: \.navigationAction)
//            store.scope(state: \.stackState, action: \.navigationAction)
        ) {
            
            VStack(alignment: .leading, spacing: 16) {
                
                ForEach(players) { cell in
                    
                    NavigationLink(
                        state: MainReducer.NavigationRoute.State.playerDescription(
                            PlayerReducer.State(playerModel: cell)
                        ),
                        label: {
                            
                            HStack {
                                
                                Text(cell.name)
                                
                                Text(cell.surname)
                            }
                            .font(.title2)
                            .foregroundStyle(.indigo .opacity(0.7))
                        })
                    
                    Divider()
                }
            }
            .padding(16)
            .containerRelativeFrame([.horizontal, .vertical])
            .background(Gradient(colors: [.accentColor, .orange, .brown]).opacity(0.5))
          
        } destination: { destinationStore in
            switch destinationStore.case {
            case .playerDescription(let playerStore):
                PlayerView(store: playerStore)
            case .scoreStatistics(let scoreStore):
                ScoreView(store: scoreStore)
            }
        }
       
    }
}

#Preview {
    
    let player1 = PlayerModel(id: UUID(),
                              name: "Toni",
                              surname: "Croos",
                              age: 25,
                              number: 8,
                              position: .midfield,
                              score: ScoreModel(count: 170))
    
    
    
    let player2 = PlayerModel(id: UUID(),
                              name: "Fernando",
                              surname: "Torres",
                              age: 40,
                              number: 9,
                              position: .forward,
                              score: ScoreModel(count: 375))
    
    let player3 = PlayerModel(id: UUID(),
                              name: "Gianluigi",
                              surname: "Buffon",
                              age: 46,
                              number: 1,
                              position: .golkeeper,
                              score: ScoreModel(count: 3))
    
    let player4 = PlayerModel(id: UUID(),
                              name: "Francesco",
                              surname: "Totti",
                              age: 47,
                              number: 10,
                              position: .forward,
                              score: ScoreModel(count: 284))
    
    let player5 = PlayerModel(id: UUID(),
                              name: "Marcos",
                              surname: "Cafu",
                              age: 54,
                              number: 2,
                              position: .defender,
                              score: ScoreModel(count: 39))
    
    
    
    let players = [player1, player2, player3, player4, player5]
    
    let store = Store(initialState: MainReducer.State()) {
        
        MainReducer()
    }
    
    return MainView(store: store, players: players)
}
