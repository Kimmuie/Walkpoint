import SwiftUI


struct HistoryView: View {
    @Binding var name: String
    @State var searchText: String = ""
    @State var showSheet: Bool = false
    @State var swapHistory: String
    @State var selectedOption: String = "clock.arrow.circlepath"
    @Binding var tokenAmount: Int
    
    var filteredHistoryOwned: [Owned] {
        if searchText.isEmpty {
            return historyOwned
        } else {
            return historyOwned.filter { $0.place.lowercased().contains(searchText.lowercased()) }
        }
    }

    var filteredHistoryUsed: [Used] {
        if searchText.isEmpty {
            return historyUsed
        } else {
            return historyUsed.filter { $0.place.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var filteredHistoryEarned: [Earned] {
        if searchText.isEmpty {
            return historyEarned
        } else {
            return historyEarned.filter { $0.place.lowercased().contains(searchText.lowercased()) }
        }
    }

    var body: some View {
        NavigationStack {
            ZStack{
                Color(.gray1)
                    .ignoresSafeArea(.all)
                VStack{
                    ZStack{
                    RoundedRectangle(cornerRadius: 50)
                        .frame(height:160)
                        .foregroundColor(.yellow2)
                        .ignoresSafeArea(.all)
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
                                Button(action: ScanNavi){
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
                                }
                            }.padding(13).offset(y:7)

                            HStack{
                                Button(action: owned) {
                                    Text("Owned")
                                        .foregroundColor(swapHistory == "owned" ? .white : .yellow4)
                                        .padding()
                                        .frame(width: 110, height: 40)
                                        .fontWeight(.bold)
                                        .background(
                                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                                            .fill(swapHistory == "owned" ? .yellow3 : .yellow1)
                                        )
                                }
                                Button(action: used) {
                                    Text("Used")
                                        .foregroundColor(swapHistory == "used" ? .white : .yellow4)
                                        .padding()
                                        .frame(width: 110, height: 40)
                                        .fontWeight(.bold)
                                        .background(
                                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                                            .fill(swapHistory == "used" ? .yellow3 : .yellow1)
                                    )
                                }
                                Button(action: earned) {
                                    Text("Earned")
                                        .foregroundColor(swapHistory == "earned" ? .white : .yellow4)
                                        .padding()
                                        .frame(width: 110, height: 40)
                                        .fontWeight(.bold)
                                        .background(
                                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                                            .fill(swapHistory == "earned" ? .yellow3 : .yellow1)
                                    )
                                }
                            }
                        }.offset(y:-50)
                        HStack{
                            Spacer()
                            RoundedRectangle(cornerRadius: 50)
                                .frame(width:250, height:40)
                                .foregroundColor(.yellow1)
                                .offset(x:4 ,y:64)
                                .overlay(
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 50)
                                            .frame(height:40)
                                            .foregroundColor(.white)
                                            .offset(y:60)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 50, style: .continuous)
                                                    .stroke(.yellow2, lineWidth: 2)
                                                    .frame(height:40)
                                                    .offset(y:60)
                                            )
                                        TextField("Search...", text: $searchText)
                                            .background(.white)
                                            .frame(height:40)
                                            .cornerRadius(50)
                                            .offset(y: 60)
                                            .padding(10)
                                    }
                                )
                            RoundedRectangle(cornerRadius: 50)
                                .frame(width:60,height:40)
                                .foregroundColor(.yellow1)
                                .offset(x:4 ,y:64)
                                .overlay(
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 50)
                                            .frame(height:40)
                                            .foregroundColor(.white)
                                            .offset(y:60)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 50, style: .continuous)
                                                    .stroke(.yellow2, lineWidth: 2)
                                                    .frame(height:40)
                                                    .offset(y:60)
                                            )
                                        Menu {
                                            Button(action: {
                                                selectedOption = "clock.arrow.circlepath"
                                            }) {
                                                Text("Latest")
                                            }
                                            
                                            Button(action: {
                                                selectedOption = "character"
                                            }) {
                                                Text("A-Z")
                                            }

                                            Button(action: {
                                                selectedOption = "percent"
                                            }) {
                                                Text("Discount by percent")
                                            }
                                            
                                            Button(action: {
                                                selectedOption = "coloncurrencysign"
                                            }) {
                                                Text("Discount by currency")
                                            }
                                        }label: {
                                            HStack{
                                                Image(systemName: selectedOption)
                                                    .foregroundStyle(.black)
                                                Image(systemName: "chevron.down")
                                                    .resizable()
                                                    .frame(width: 10, height: 5)
                                                    .foregroundStyle(.black)
                                            }
                                        }.offset(y:60)
                                    }
                                )
                            Spacer()
                        }
                    }
                    VStack {
                         if swapHistory == "owned" {
                            List(filteredHistoryOwned, id: \.place) { owned in
                                HStack(alignment: .top){
                                    VStack(alignment: .leading) {
                                        Text(owned.place)
                                            .font(.headline)
                                        Text("\(owned.discount) \(owned.type)")
                                            .fontWeight(.light)
                                            .foregroundStyle(Color.red)
                                        
                                        NavigationLink("Use Discount", destination: Receipt())
                                    }
                                    
                                    HStack(alignment: .top){
                                        Spacer()
                                            Image("Token")
                                                .resizable()
                                                .frame(width:25 ,height: 25)
                                            Text("-\(owned.price)")

                                    }
                                    
                                }
                            }
                                .listStyle(.plain)
                        } else if swapHistory == "used" {
                            List(filteredHistoryUsed, id: \.place) { used in
                                HStack(alignment: .top){
                                    VStack(alignment: .leading) {
                                        Text(used.place)
                                            .font(.headline)
                                        Text("\(used.discount) \(used.type)")
                                            .fontWeight(.light)
                                            .foregroundStyle(Color.red)
                                        
                                            NavigationLink("Check Receipt", destination: Receipt())
                                    }
                                    
                                    HStack(alignment: .top){
                                        Spacer()
                                            Image("Token")
                                                .resizable()
                                                .frame(width:25 ,height: 25)
                                            Text("-\(used.price)")

                                    }
                                    
                                }
                            }
                                .listStyle(.plain)
                        }

                        else if swapHistory == "earned" {
                            List(filteredHistoryEarned, id: \.place) { earned in
                                HStack(alignment: .top){
                                    VStack(alignment: .leading) {
                                        Text(earned.place)
                                            .font(.headline)
                                        Text("Cooldown \(earned.cooldown) Hr")
                                            .fontWeight(.light)
                                            .foregroundStyle(Color.red)
                                    }
                                    
                                    HStack(alignment: .top){
                                        Spacer()
                                        Image("Token")
                                            .resizable()
                                            .frame(width:25 ,height: 25)
                                        Text("+\(earned.token)")
                                    }
                                }
                            }
                                .listStyle(.plain)
                        }
                        Spacer()
                            RoundedRectangle(cornerRadius: 30)
                                .fill(.yellow2)
                                .ignoresSafeArea(.all)
                                .frame(height: 30)
                        }
                    }
                }
            }
        }
    func owned() {
        swapHistory = "owned"
        searchText = ""
    }
    
    func used() {
        swapHistory = "used"
        searchText = ""
    }
    
    func earned() {
        swapHistory = "earned"
        searchText = ""
    }
    
    func UserNavi() {
        print("Invalid username or password")
    }
    
    func RewardNavi() {
        print("Invalid username or password")
    }
    
    func ScanNavi() {
        print("Sign in button tapped")
    }
    func HistoryNavi() {
        print("Sign in button tapped")
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff
        )
    }
}

#Preview {
    HistoryView(name: .constant("Pranchayut"), swapHistory: "owned", tokenAmount: .constant(0))
}
