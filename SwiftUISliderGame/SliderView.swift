//
//  SwiftUIView.swift
//  SwiftUISliderGame
//
//  Created by Юрий Скворцов on 08.05.2022.
//

import SwiftUI

struct SliderView: UIViewRepresentable {
    @Binding var value: Double
    let alpha: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderMoved),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = .red.withAlphaComponent(CGFloat(alpha) / 100)
        uiView.value = Float(value)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension SliderView {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func sliderMoved(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(value: .constant(10), alpha: 100)
    }
}
