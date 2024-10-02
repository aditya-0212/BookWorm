//
//  BindingUIView.swift
//  BookWorm
//
//  Created by APPLE on 18/07/24.
//

import SwiftUI
struct PushButton:View {
    var text:String
    @Binding var isOn:Bool
    var onCollors = [Color.red,Color.blue]
    var ofCollors = [Color(white:0.6),Color(white:0.9)]
    var body: some View {
        VStack{
                   Button(text){
                    isOn.toggle()
                   }
                   .frame(width:100,height: 50)
                   .padding()
                   .background(LinearGradient(colors: isOn ? onCollors : ofCollors , startPoint: .top, endPoint: .bottom))
                   .clipShape(.capsule)
                   .foregroundStyle(isOn ? .yellow : .secondary)
                   .shadow(radius: isOn ? 0 : 5)
            }
    }
}

struct BindingUIView: View {
    @State private var rememberMe = false
    @AppStorage("text") private var text = ""
    var body: some View {
        NavigationStack {
//            Section{
//                Toggle("Remeber me",isOn: $rememberMe)
//                PushButton(text: "click me", isOn: $rememberMe)
//            }
            
                TextEditor(text: $text)
                    .textFieldStyle(.roundedBorder)
            
        }
        
    }
}

#Preview {
    BindingUIView()
}
