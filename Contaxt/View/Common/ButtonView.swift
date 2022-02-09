//
//  ButtonView.swift
//  Contaxt
//
//  Created by Alex Waldron on 2/8/22.
//

import SwiftUI

struct ButtonView: View {
    let buttonTitle: String
    let buttonType: ButtonType
    var body: some View {
        switch buttonType {
        case .normal:
            Text(buttonTitle)
                .font(.title2)
                .bold()
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(K.colors.brandBlue))
        case .fullWidth:
            Text(buttonTitle)
                .font(.title2)
                .bold()
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth:.infinity, alignment: .center)
                .background(RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(K.colors.brandBlue))
        }
        
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(buttonTitle: "Login", buttonType: .fullWidth).previewLayout(.sizeThatFits)
    }
}
