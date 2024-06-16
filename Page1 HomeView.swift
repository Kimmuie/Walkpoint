

import SwiftUI

struct HomeView: View {
    @State private var showAlert = false
    @State private var showConfirm = false
    @Binding var name: String
    @State var searchText: String = ""
    @Binding var tokenAmount: Int
    var Home: [Group]{
        return groupJoin
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
                        .offset(y: 20)
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
                    }.offset(y: 30)
                }
                RoundedRectangle(cornerRadius: 50)
                    .frame(height:40)
                    .foregroundColor(.yellow1)
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
                            HStack{
                                TextField("Enter Joining Code...", text: $searchText)
                                    .background(.white)
                                    .cornerRadius(50)
                                    .padding(25)
                                Button(action: Enter) {
                                    Text("Send Request")
                                        .frame(width:140, height: 25)
                                        .foregroundStyle(white)
                                        .fontWeight(.semibold)
                                        .background(
                                            RoundedRectangle(cornerRadius: 50, style: .continuous)
                                                .fill(yellow3)
                                                .frame(width: 140, height: 32)
                                        )
                                }.offset(x:-20)
                            }
                        }
                    ).offset(y:10)
                Spacer()
                List {
                    ForEach(groupJoin, id: \.name) { Group in
                        HStack{
                            Image(Group.image)
                                .resizable()
                                .frame(width:80 ,height: 100)
                                .cornerRadius(10)
                                .background(
                                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                                        .fill(yellow3)
                                        .frame(width:85, height: 105)
                                )
                            VStack{
                                HStack{
                                    Spacer()
                                        .frame(width: 5)
                                    Text(Group.name)
                                        .fontWeight(.bold)
                                        .foregroundStyle(yellow4)
                                        .padding(6)
                                    Spacer()
                                }
                                HStack{
                                    Spacer()
                                    Text("Token : \(Group.token)")
                                        .fontWeight(.regular)
                                        .foregroundStyle(yellow4)
                                    Spacer()
                                }
                            }
                            Spacer()
                            VStack{
                                Spacer()
                                Button(action: Enter) {
                                    Image(systemName: "figure.walk")
                                        .resizable()
                                        .frame(width:20, height: 30)
                                        .foregroundStyle(white)
                                        .fontWeight(.bold)
                                        .background(
                                            RoundedRectangle(cornerRadius: 50, style: .continuous)
                                                .fill(yellow4)
                                                .offset(x:2,y:2)
                                                .frame(width: 50, height: 50)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 50)
                                                        .frame(width: 48, height: 48)
                                                        .foregroundColor(yellow3)
                                                )
                                        )
                                }.offset(x:-10,y: -20)
                            }
                        }
                    }
                    .listRowBackground(yellow2)
                    .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(white)
                            .frame(width:351, height: 125)
                            .offset(x:-4,y: -4)
                    )
                }
                    .frame(height: 500)
                    .listRowSpacing(15)
                    .listRowSeparator(.hidden)
                    .scrollContentBackground(.hidden)
                Spacer()
                RoundedRectangle(cornerRadius: 30)
                    .fill(.yellow2)
                    .ignoresSafeArea(.all)
                    .frame(height: 110)
            }    .alert("Confirmation", isPresented: $showConfirm) {
                Button("Cancel", role: .cancel){ }
                Button("Confirm"){
                    tokenAmount = tokenAmount - 5
                        historyOwned.insert(Owned(place: "Bookstore",discount: 10, type: "THB",price : 5), at: 0)
                }
            } message: {
                Text("Please click confirm if you want to switch groups")
            }
        }
    }
    func ScanNavi() {
        print("Sign in button tapped")
    }
    func Enter() {
        showConfirm = true
    }
}

#Preview {
    HomeView(name: .constant("Pranchayut"), tokenAmount: .constant(0))
}
