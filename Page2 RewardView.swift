

import SwiftUI

struct RewardView: View {
    @State private var showAlert = false
    @State private var showConfirm = false
    @Binding var name: String
    @State var searchText: String = ""
    @Binding var tokenAmount: Int
    var Shop: [Reward]{
        return rewardShop
    }
    var body: some View {
        ZStack{
            Color(.gray1)
                .ignoresSafeArea(.all)
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 50)
                        .frame(height:160)
                        .foregroundColor(.yellow2)
                        .ignoresSafeArea(.all)
                        .offset(y:50)
                    VStack{
                        HStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 50)
                                    .frame(width: 100 ,height:50)
                                    .foregroundColor(.yellow1)
                                HStack{
                                    Image("Token")
                                        .resizable()
                                        .frame(width:40 ,height: 40)
                                    Text("\(tokenAmount)")
                                        .foregroundColor(.yellow4)
                                        .fontWeight(.semibold)
                                }
                            }
                            Spacer()
                            Text(name)
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                            ZStack{
                                Circle()
                                    .fill(Color.white)
                                    .frame(height: 50)
                                Image(systemName: "person")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundStyle(.black)
                            }
                        }.padding(13)
                        ForEach(groupJoin.filter { $0.usage }, id: \.name) { group in
                            Text(group.name)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .padding(.top, 10)
                        }
                    }.offset(y: 60)
                }
                RoundedRectangle(cornerRadius: 50)
                    .frame(height:40)
                    .foregroundColor(.yellow1)
                    .offset(x:4 ,y:4)
                    .padding(15)
                    .overlay(
                        ZStack{
                            RoundedRectangle(cornerRadius: 50)
                                .frame(height:40)
                                .foregroundColor(.white)
                                .padding(15)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 50, style: .continuous)
                                        .stroke(.yellow2, lineWidth: 2)
                                        .frame(height:40)
                                        .padding(15)
                                )
                            TextField("Search...", text: $searchText)
                                .background(.white)
                                .cornerRadius(50)
                                .padding(25)
                        }
                    ).offset(y: 40)
                Spacer()
                ScrollView {
                    HStack{
                        List {
                            ForEach(evenRewards, id: \.header) { Reward in
                                VStack{
                                    Spacer()
                                    HStack{
                                        Spacer()
                                        Image("Token")
                                            .resizable()
                                            .frame(width:30 ,height: 30)
                                        Text("\(Reward.price) .-")
                                    }
                                    VStack {
                                        Text(Reward.header)
                                            .fontWeight(.bold)
                                            .foregroundStyle(yellow4)
                                        Spacer()
                                        Text("\(Reward.discount) \(Reward.type)")
                                            .fontWeight(.light)
                                            .foregroundStyle(Color.red)
                                        Button(action: Buy) {
                                            Text("Get Ticket")
                                                .foregroundColor(white)
                                                .padding()
                                                .frame(width: 132, height: 42)
                                                .fontWeight(.bold)
                                                .background(
                                                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                                                        .fill(yellow4)
                                                        .offset(x:2,y:2)
                                                        .overlay(
                                                            RoundedRectangle(cornerRadius: 17)
                                                                .frame(width: 130, height: 40)
                                                                .foregroundColor(yellow3)
                                                        )
                                                )
                                        }
                                        Spacer()
                                    }.padding(6)
                                }
                            }
                            .listRowBackground(yellow2)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(white)
                                    .frame(width:160, height: 210)
                                    .offset(x:-4,y: -4)
                            )
                        }
                        .listRowSpacing(15)
                        .listRowSeparator(.hidden)
                        .scrollContentBackground(.hidden)
                        List {
                            ForEach(oddRewards, id: \.header) { Reward in
                                VStack{
                                    Spacer()
                                    HStack{
                                        Spacer()
                                        Image("Token")
                                            .resizable()
                                            .frame(width:30 ,height: 30)
                                        Text("\(Reward.price) .-")
                                    }
                                    VStack {
                                        Text(Reward.header)
                                            .fontWeight(.bold)
                                            .foregroundStyle(yellow4)
                                        Spacer()
                                        Text("\(Reward.discount) \(Reward.type)")
                                            .fontWeight(.light)
                                            .foregroundStyle(Color.red)
                                        Button(action: Buy) {
                                            Text("Get Ticket")
                                                .foregroundColor(white)
                                                .padding()
                                                .frame(width: 132, height: 42)
                                                .fontWeight(.bold)
                                                .background(
                                                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                                                        .fill(yellow4)
                                                        .offset(x:2,y:2)
                                                        .overlay(
                                                            RoundedRectangle(cornerRadius: 17)
                                                                .frame(width: 130, height: 40)
                                                                .foregroundColor(yellow3)
                                                        )
                                                )
                                        }
                                        Spacer()
                                    }.padding(6)
                                }
                            }
                            .listRowBackground(yellow2)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(white)
                                    .frame(width:160, height: 210)
                                    .offset(x:-4,y: -4)
                            )
                        }
                        .frame(height: 500)
                        .listRowSpacing(15)
                        .listRowSeparator(.hidden)
                        .scrollContentBackground(.hidden)
                    }
                }.offset(y:30)
                .frame(height: 560)
                Spacer()
                RoundedRectangle(cornerRadius: 30)
                    .fill(.yellow2)
                    .ignoresSafeArea(.all)
                    .frame(height: 110)
                    .offset(y:-30)
            }    .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Failed"),
                    message: Text("Can't get a ticket because don't have enough tokens.")
                )
            }.alert("Confirmation", isPresented: $showConfirm) {
                Button("Cancel", role: .cancel){ }
                Button("Confirm"){
                    tokenAmount = tokenAmount - 5
                        historyOwned.insert(Owned(place: "Bookstore",discount: 10, type: "THB",price : 5), at: 0)
                }
            } message: {
                Text("Please click confirm if you assured using ticket")
            }
        }
    }
    func ScanNavi() {
        print("Sign in button tapped")
    }
    func Buy() {
        if tokenAmount < 5{
            showAlert = true
        }
        else{
            showConfirm = true
        }
    }
}

#Preview {
    RewardView(name: .constant("Pranchayut"), tokenAmount: .constant(0))
}
