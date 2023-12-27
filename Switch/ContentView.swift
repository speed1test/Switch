//
//  ContentView.swift
//  Switch
//
//  Created by elsalvador on 25/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var value: Int = 4
    @State private var isToggleOn = true

    var body: some View {
        VStack {
            Text("Selección: \(value)")
                .multilineTextAlignment(.center)
                .bold()

            HStack {
                Stepper(value: $value, in: isToggleOn ? 0...0 : 1...10) {
                    Text("")
                }
                .padding(.horizontal, 100.0)

                Spacer()
            }
            .padding()

            Toggle(isOn: $isToggleOn) {
                Text("Desactivar Selección")
            }
            .toggleStyle(SwitchToggleStyle(tint: .yellow))
            .padding(.horizontal, 20.0)
            .onChange(of: isToggleOn) { newValue in
                // Resetear el valor del Stepper a cero cuando se activa el Toggle
                if newValue {
                    value = 0
                }
            }

            Button(action: {
                // Resetear el valor del Stepper a un valor inicial (por ejemplo, 4)
                value = isToggleOn ? 0 : value
            }) {
                Text("Reset")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(8)
            }
            .buttonStyle(DefaultButtonStyle())
            .padding(.top, 20.0)
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
