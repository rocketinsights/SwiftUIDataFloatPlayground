import SwiftUI
import PlaygroundSupport

struct ProgressIndicator: View {
    let progress: Double
    
    var body: some View {
        HStack {
            ProgressView(value: progress)
            Text("\(Int(progress * 100))%")
        }
    }
}

struct ToggleButton: View {
    @Binding var flag: Bool
    
    var body: some View {
        Button("Toggle \(flag ? "Off" : "On")") {
            flag.toggle()
        }
    }
}

struct TapView: View {
    @State var taps = 0
    
    var body: some View {
        Text("Taps \(taps)")
            .frame(width: 300, height: 300)
            .background(Color.red)
            .cornerRadius(10)
            .onTapGesture {
                taps += 1
            }
    }
}

struct ContentView: View {
    
    @State var isOn = false
    
    var body: some View {
        VStack(spacing: 40) {
            ProgressIndicator(progress: 0.21)
            ToggleButton(flag: $isOn)
            TapView()
        }
            .padding()
    }
}

PlaygroundPage.current.setLiveView(ContentView().frame(width: 375, height: 812))
