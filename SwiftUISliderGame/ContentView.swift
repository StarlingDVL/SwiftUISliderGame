//
//  ContentView.swift
//  SwiftUISliderGame
//
//  Created by Юрий Скворцов on 08.05.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValue = Double.random(in: 0...100)
    @State private var targetValue = Int.random(in: 0...100)
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер как можно ближе к: \(targetValue)")
                .padding()
            HStack {
                Text("0")
                SliderView(value: $sliderValue, alpha: computeScore())
                Text("100")
            }
            .padding(.bottom, 30)
            Button("Проверь меня!") {
                showAlert =  true
            }
            .alert("Your score", isPresented: $showAlert, actions: {}) {
                Text("\(computeScore())")
            }
            .padding(.bottom, 30)
            Button("Начать заново") {
                targetValue = Int.random(in: 0...100)
            }
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(sliderValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
