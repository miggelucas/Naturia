//
//  DoneButton.swift
//  Naturia
//
//  Created by ditthales on 28/03/23.
//

import Foundation
import SwiftUI

struct DoneButton: View {
    var body: some View {
        Button(action: {}) {
            HStack(spacing: 10) {
                Image(systemName: "checkmark")
                    .foregroundColor(.white)
                Text("Concluído")
                    .foregroundColor(.white)
            }
            .padding()
            .background(Color.green)
            .cornerRadius(10)
        }
    }
}
