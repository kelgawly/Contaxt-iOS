//
//  FanHomeView.swift
//  Contaxt
//
//  Created by Alex Waldron on 2/8/22.
//

import SwiftUI

struct FanHomeView: View {
    var body: some View {
        RecentDataListView().navigationBarBackButtonHidden(true)
    }
}

struct FanHomeView_Previews: PreviewProvider {
    static var previews: some View {
        FanHomeView()
    }
}
