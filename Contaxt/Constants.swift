//
//  Constants.swift
//  Contaxt
//
//  Created by Alex Waldron on 2/8/22.
//

import SwiftUI
struct K{
    struct userDefaultKeys{
        static let userData = "userData"
    }
    struct colors{
        static let brandBlue = Color("BrandColor")
    }
    static var dateFormatter: DateFormatter{
        let df = DateFormatter()
        df.timeStyle = .medium
        df.dateStyle = .short
        return df
    }
}
