//
//  ScoreView.swift
//  TCAStackNavigation
//
//  Created by Anton Gorlov on 09.08.2024.
//

import SwiftUI
import ComposableArchitecture

struct ScoreView: View {
    
    var store: StoreOf<ScoreReducer>
    
    var body: some View {
        
        VStack {
         
            Text("\(store.playerModel.score.count) goals")
                .font(.system(size: 60))
                .foregroundStyle(.indigo .opacity(0.4))
               
            Button(action: {
                
                store.send(.closeToRootAction)
            }, label: {
                
                Text("Go to root")
                    .foregroundStyle(.bar)
                    .frame(maxWidth: .infinity, maxHeight: 44)
            })
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .bottom)
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.mint .opacity(0.7))
        }
        .containerRelativeFrame([.horizontal, .vertical])
        .background(Gradient(colors: [.accentColor, .orange, .brown]).opacity(0.5))
        .navigationTitle(Text("Score for \(store.playerModel.name) \( store.playerModel.surname)"))
    }
}

#Preview {
    
    let player = PlayerModel(id: UUID(),
                             name: "Roberto",
                             surname: "Baggio",
                             age: 57,
                             number: 10,
                             position: .forward,
                             score: ScoreModel(count: 401))
    
    return ScoreView(store: Store(initialState: ScoreReducer.State(playerModel: player), reducer: {
        ScoreReducer()
    }))
}
