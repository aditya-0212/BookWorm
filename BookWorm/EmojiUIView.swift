//
//  EmojiUIView.swift
//  BookWorm
//
//  Created by APPLE on 20/07/24.
//

import SwiftUI

struct EmojiUIView: View {
    var rating:Int
    var body: some View {
        switch rating {
        case 1:
          Text("☹️")
        case 2:
          Text("🙁")
        case 3:
          Text("😕")
        case 4:
          Text("😊")
        default:
            Text("🤯")
        }
    
    }
}

#Preview {
    EmojiUIView(rating:3)
}
