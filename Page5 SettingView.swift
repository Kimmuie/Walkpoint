import SwiftUI
import CodeScanner
import SwiftData

struct SettingView: View {
    @Binding var name: String
    @Binding var lname: String
    @Environment(\.modelContext) var modelContext
    @Binding var tokenAmount: Int
    @State  var isShowingScanner = false
    let groupAmount = groupJoin.count
    var codeGenerator : String = "011011110001"
    var tokenOne : Int = 1
    var Menu: [Setting]{
        return settingMenu
    }
    var body: some View {
        NavigationStack {
            ZStack{
                VStack {
                    VStack {
                        ZStack{
                            Rectangle()
                                .frame(height:250)
                                .foregroundColor(.yellow2)
                                .ignoresSafeArea(.all)
                            VStack{
                                NavigationLink(destination: YourProfile()){
                                    ZStack{
                                        Rectangle()
                                            .frame(height:100)
                                            .foregroundColor(.yellow2)
                                        HStack{
                                            ZStack{
                                                Circle()
                                                    .fill(Color.white)
                                                    .frame(height: 100)
                                                Image(systemName: "person")
                                                    .resizable()
                                                    .frame(width: 50, height: 50)
                                                    .foregroundStyle(.black)
                                            }
                                            VStack{
                                                Text("\(name) \(lname)")
                                                    .foregroundColor(.white)
                                                    .fontWeight(.bold)
                                                    .font(.system(size: 20))
                                                HStack{
                                                    RoundedRectangle(cornerRadius: 50, style: .continuous)
                                                        .foregroundColor(.yellow3)
                                                        .frame(width: 120, height:22)
                                                        .overlay(
                                                            Text("@kimmuie")
                                                                .foregroundColor(.white)
                                                                .fontWeight(.bold)
                                                                .font(.system(size: 15))
                                                        )
                                                }
                                            }
                                            Image(systemName: "pencil.circle.fill")
                                                .resizable()
                                                .frame(width: 25, height: 25)
                                                .foregroundStyle(.white)
                                        }
                                    }
                                }
                                Text("\(groupAmount) Groups | \(tokenAmount) Scanned")
                                    .foregroundColor(.white)
                                    .fontWeight(.medium)
                                    .font(.system(size: 15))
                                    .offset(x:30,y:20)
                            }.offset(y:-20)
                        }
                        ZStack{
                            Rectangle()
                                .frame(height:500)
                                .foregroundColor(.gray2)
                                .ignoresSafeArea(.all)
                                .offset(y:-15)
                            VStack{
                            NavigationView {
                                List {
                                    ForEach(settingMenu, id: \.header) { setting in
                                        NavigationLink(destination: Text(setting.header)) {
                                            HStack {
                                                Image(systemName: setting.icon)
                                                Text(setting.header)
                                            }.padding(6)
                                        }
                                    }
                                }
                            }.frame(height: 430).offset(y:-50)
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(.yellow2)
                                    .ignoresSafeArea(.all)
                                    .frame(height: 47)
                            }
                        }
                        
                    }
                }
            }
        }
    }
    func handleScan(result: Result<ScanResult, ScanError>) {
        // Handle the scan result here
        switch result {
        case .success(let scanResult):
            checkToken(result: scanResult.string)
        case .failure(let error):
            print("Scanning failed with error: \(error)")
        }
        isShowingScanner = false
        
    }
    func checkToken(result: String) {
        if codeGenerator == result {
            tokenAmount = tokenAmount + 1
            historyEarned.insert(Earned(place: "chulalongkorn university",cooldown: 8 ,token: 1), at: 0)
        }
    }
}

#Preview {
    SettingView(name: .constant("Pranchayut"), lname: .constant("Netsawang"), tokenAmount: .constant(0))
}
