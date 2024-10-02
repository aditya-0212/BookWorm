//
//  ReviewUIView.swift
//  BookWorm
//
//  Created by APPLE on 20/07/24.
//

import SwiftUI

struct ReviewUIView: View {
    @Binding  var rating: Int
    var maxRating = 5
     var offImage: Image?
     var onImage = Image(systemName: "star.fill")
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack{
            ForEach(1..<maxRating+1, id: \.self){ number in
                Button{
                    rating = number
                } label: {
                    image(number)
                        .foregroundStyle(number > rating ? offColor: onColor)
                }
            }
        }
        .buttonStyle(.plain)
    }
    func image(_ number:Int) -> Image{
        if number > rating{
            offImage ?? onImage
        }else{
            onImage
        }
    }
}

#Preview {
    ReviewUIView(rating: .constant(3))
}
