//
//  DismissView.swift
//  Cuspide
//
//  Created by Hugo Martinez on 21/04/23.
//

import SwiftUI

struct DismissView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        HStack {
            Spacer()
            Button("Close") {
                dismiss()
            }
            .background(Color.blue)
            .cornerRadius(10)
            .tint(.black)
            .padding(.trailing, 12)
            .foregroundColor(.white)
            .padding()
            
            
        }
        .buttonStyle(.bordered)
    }
}
struct DismissView_Previews: PreviewProvider {
    static var previews: some View {
        DismissView()
    }
}
