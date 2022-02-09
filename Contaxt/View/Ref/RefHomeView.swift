//
//  RefHomeView.swift
//  Contaxt
//
//  Created by Alex Waldron on 2/8/22.
//

import SwiftUI

struct RefHomeView: View {
    var body: some View {
        RecentDataListView().navigationBarBackButtonHidden(true)
    }
}

struct RefHomeView_Previews: PreviewProvider {
    static var previews: some View {
        RefHomeView()
    }
}
