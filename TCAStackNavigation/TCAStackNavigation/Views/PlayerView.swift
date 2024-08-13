//
//  PlayerView.swift
//  TCAStackNavigation
//
//  Created by Anton Gorlov on 09.08.2024.
//

import SwiftUI
import ComposableArchitecture

struct PlayerView: View {
    
    var store: StoreOf<PlayerReducer>
    
    var body: some View {
        
        VStack(alignment: .leading) {

            labelsView(store.playerModel)
            
            Button(action: {
                
                store.send(.openScoreAction(store.playerModel))
            }, label: {
                
                Text("Open score")
                    .foregroundStyle(.bar)
                    .frame(maxWidth: .infinity, maxHeight: 44)
            })
            .frame(maxWidth: .infinity, alignment: .bottom)
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.mint .opacity(0.7))
            
            Button(action: {
                
                store.send(.closeAction)
            }, label: {
                
                Text("Back")
                    .foregroundStyle(.bar)
                    .frame(maxWidth: .infinity, maxHeight: 44)
            })
            .frame(maxWidth: .infinity, alignment: .bottom)
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.mint .opacity(0.7))
            
            Button(action: {
                
                store.send(.closeToRootAction)
            }, label: {
                
                Text("Go to root")
                    .foregroundStyle(.bar)
                    .frame(maxWidth: .infinity, maxHeight: 44)
            })
            .frame(maxWidth: .infinity, alignment: .bottom)
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.mint .opacity(0.7))
        }
        .padding(16)
        .containerRelativeFrame([.horizontal, .vertical])
        .background(Gradient(colors: [.accentColor, .orange, .brown]).opacity(0.5))
        .navigationTitle(Text("Player info:"))
    }
    
    private func labelsView(_ model: PlayerModel) -> some View {
        
        VStack(spacing: 16) {
            
            cellView("Name:", subtitle: model.name)
            
            cellView("Surname:", subtitle: model.surname)
            
            cellView("Age:", subtitle: "\(model.age)")
            
            cellView("Position:", subtitle: model.position.description())
            
            cellView("Number:", subtitle: "\(model.number)")
        }
        .font(.title2)
        .foregroundStyle(.indigo .opacity(0.4))
        .frame(maxHeight: .infinity, alignment: .top)
    }
    
    private func cellView(_ title: String,
                 subtitle: String) -> some View {
        
        HStack {
            
            Text(title)
                .bold()

            Text(subtitle)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        
    }
}

#Preview {
    
    let player = PlayerModel(id: UUID(),
                             name: "Ronaldo de Assis Moreira,",
                             surname: "Ronaldinho",
                             age: 44,
                             number: 10,
                             position: .midfield,
                             score: ScoreModel(count: 254))
    
    let store = Store(initialState: PlayerReducer.State(playerModel: player)) {
        
        PlayerReducer()
    }
    
    return PlayerView(store: store)
}
