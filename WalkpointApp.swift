//
//  Login_FormApp.swift
//  Login Form
//
//  Created by Atichet Ekchiewchan on 12/3/2567 BE.
//

import SwiftUI
import SwiftData
import Modals

@main
struct WalkpointApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            AllView()
                .environmentObject(order)
                .preferredColorScheme(.light)
            }
        }
    }
