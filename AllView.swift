//
//  AllView.swift
//  Login Form
//
//  Created by Atichet Ekchiewchan on 13/3/2567 BE.
//

import SwiftUI
import CodeScanner
import SwiftData

let white = Color(hex: "ffffff")
let gray = Color(hex: "EAEBEE")
let creamBrown = Color(hex: "B0A695")
let cream = Color(hex: "F3EEEA")
let yellow2 = Color(hex: "FFB534")
let yellow3 = Color(hex: "D48700")
let yellow1 = Color(hex: "FFC96A")
let yellow4 = Color(hex: "9F6500")

var historyOwned: [Owned] = [
    Owned(place:"Bookstore",discount: 10,type: "% OFF", price: 5),
    Owned(place:"BCC Canteen 17th",discount: 20,type: "THB", price: 5),
    Owned(place:"Water Shop",discount: 10, type: "THB", price: 5),
    Owned(place:"Water Shop",discount: 10, type: "THB", price: 5),
    Owned(place:"Water Shop",discount: 10, type: "THB", price: 5)
]

var historyUsed: [Used] = [
    Used(place:"Bookstore",discount: 10,type: "% OFF", price: 5),
    Used(place:"BCC Canteen 17th",discount: 20,type: "THB", price: 5),
    Used(place:"Water Shop",discount: 10, type: "THB", price: 5),
    Used(place:"Water Shop",discount: 10, type: "THB", price: 5),
    Used(place:"Water Shop",discount: 10, type: "THB", price: 5)
]

var historyEarned: [Earned] = [
    Earned(place:"Sirinat 5F",cooldown: 6 ,token: 1),
    Earned(place:"Sirinat 3F",cooldown: 6 ,token: 1),
    Earned(place:"150th Building 3F",cooldown: 6 ,token: 1),
    Earned(place:"150th Building 5F",cooldown: 6 ,token: 1)
]

var settingMenu: [Setting] = [
    Setting(header:"Organization Mode",icon: "building.2", navigate: "hi"),
    Setting(header:"Account",icon: "person", navigate: "hi"),
    Setting(header:"Setting",icon: "gearshape", navigate: "hi"),
    Setting(header:"Rate Our App",icon: "star", navigate: "hi"),
    Setting(header:"Help Center",icon: "questionmark.circle", navigate: "hi"),
    Setting(header:"Log Out",icon: "rectangle.portrait.and.arrow.right", navigate: "hi"),
]

var rewardShop: [Reward] = [
    Reward(header:"Bookstore",price: 5, discount: 10, type: "% OFF"),
    Reward(header:"Canteen 17th",price: 10, discount: 20, type: "THB"),
    Reward(header:"Water Shop",price: 5, discount: 5, type: "THB")
]

var oddRewards: [Reward] {
    return rewardShop.enumerated().compactMap { index, reward in
        index % 2 != 0 ? reward : nil
    }
}

var evenRewards: [Reward] {
    return rewardShop.enumerated().compactMap { index, reward in
        index % 2 == 0 ? reward : nil
    }
}
var groupJoin: [Group] = [
    Group(name:"Bangkok Christian College",token: 5, usage: true, image: "img.BCC"),
    Group(name:"Siam Paragon",token: 32, usage: false, image: "img.SIAM"),
]
struct AllView: View {
    @State var tokenAmount: Int = 5
    @State var name: String = "Pranchayut"
    @State var lname: String = "Netsawang"
    var body: some View {
        TabView(selection: .constant(2)){
            HomeView(name: $name, tokenAmount: $tokenAmount)
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)
            RewardView(name: $name, tokenAmount: $tokenAmount)
                .tabItem(){
                    Label("Reward", systemImage: "cart.fill")
                }
                .tag(1)
            ScanView(name: $name, tokenAmount: $tokenAmount)
                .tabItem{
                    Label("Scanner", systemImage: "qrcode.viewfinder")
                }
                .tag(2)
            HistoryView(name: $name, swapHistory: "owned", tokenAmount: $tokenAmount)
                .tabItem{
                    Label("History", systemImage: "list.bullet.clipboard.fill")
                }
                .tag(3)
            SettingView(name: $name, lname: $lname, tokenAmount: $tokenAmount)
                .tabItem{
                    Label("Setting", systemImage: "gearshape.fill")
                }
                .tag(4)
        }
    }
}

#Preview{
    AllView()
}
