//
//  ReviewView.swift
//  Naturia
//
//  Created by ditthales on 30/03/23.
//  
//

import SwiftUI

struct ReviewView: View {

    @ObservedObject private var viewModel = ReviewViewModel()
       
    var body: some View {
        VStack (spacing: 37){
            HStack{
                Spacer()
                SaveButton()
            }
            HStack {
                Image("plantinha")
                    .resizable()
                    .frame(width: 362, height: 430)
                Spacer()
                Text(">")
                    .font(.system(size: 100))
                Spacer()
                Image("plantinha")
                    .resizable()
                    .frame(width: 362, height: 430)
            }
            TextAndConfirmationButtons()
                .padding(.top, 19)
        }
        .frame(width: 874)
    }

}

struct Review_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
