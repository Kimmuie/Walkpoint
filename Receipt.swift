//
//  Reciept.swift
//  Walkpoint
//
//  Created by Atichet Ekchiewchan on 13/3/2567 BE.
//

import SwiftUI

struct Receipt: View {
    @State var Used: Bool = true
    var body: some View {
        NavigationStack{
            ZStack{
                Color(yellow2)
                    .ignoresSafeArea(.all)
                VStack{
                    VStack{
                        Image("Transparent.logo")
                            .resizable()
                            .frame(width:200 ,height: 200)
                        Text("Walkpoint Receipt")
                            .foregroundStyle(yellow4)
                            .font(.system(size: 28))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .offset(y:-30)
                    }
                    Spacer()
                    Text("Bangkok Christian College")
                        .foregroundColor(yellow4)
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                    Spacer()
                    Text("- Bookstore -")
                        .foregroundColor(yellow4)
                        .font(.system(size: 24))
                        .fontWeight(.regular)
                    if Used == true{
                        Text("10% OFF")
                            .foregroundStyle(Color.red)
                            .font(.title2)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    } else {
                        Text("This receipt is already used.")
                            .foregroundStyle(Color.red)
                            .font(.title2)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    Spacer()
                    Button(action: useDiscount) {
                        Text("Use Discount")
                            .foregroundColor(.white) // Set text color
                            .font(.system(size: 24))
                            .fontWeight(.semibold)
                            .padding()
                            .frame(width: 280, height: 80)
                            .background(
                                RoundedRectangle(cornerRadius: 40, style: .continuous)
                                    .offset(x:4,y:4)
                                    .fill(yellow4)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 40, style: .continuous)
                                            .fill(yellow3)

                                    )
                        )
                    }
                    if Used == false{
                        Text("Thank you for using our service")
                                .foregroundColor(yellow4) // Foreground color for the inner text
                                .font(.system(size: 12))
                                .fontWeight(.bold)
                    }
                Spacer()
                }
            }
        }
    }
    func useDiscount() {
        Used = false
    }
}

#Preview {
    Receipt()
}
