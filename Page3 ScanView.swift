import SwiftUI
import CodeScanner
import SwiftData

struct NoFadeButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 1.0 : 1.0) // Maintain the same scale
            .opacity(configuration.isPressed ? 1.0 : 1.0) // Maintain the same opacity
    }
}

struct ScanView: View {
    @Binding var name: String
    @Environment(\.modelContext) var modelContext
    @Binding var tokenAmount: Int
    @State  var isShowingScanner = false
        
    
     var codeGenerator : String = "011011110001"
     var tokenOne : Int = 1
    
    var body: some View {
        ZStack{
            Button(action: {
                isShowingScanner = true
            }) {
                Color(.gray1)
                .ignoresSafeArea(.all)
            }.buttonStyle(NoFadeButtonStyle())
            VStack {
                VStack {
                    ZStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 50)
                                .frame(height:160)
                                .foregroundColor(.yellow2)
                                .ignoresSafeArea(.all)
                            Rectangle()
                                .frame(height:50)
                                .foregroundColor(.yellow2)
                                .ignoresSafeArea(.all)
                                .offset(y:-80)
                        }
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
                            Text("Organization Name")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }.offset(y: -50)
                    }
                    Spacer()
                    Button(action: {
                        isShowingScanner = true
                    }) {
                        ZStack{
                            Rectangle()
                                .fill(.yellow2)
                                .ignoresSafeArea(.all)
                                .frame(width: 300 ,height: 300)
                            Rectangle()
                                .fill(.gray1)
                                .ignoresSafeArea(.all)
                                .frame(width: 290 ,height: 290)
                            Rectangle()
                                .fill(.gray1)
                                .ignoresSafeArea(.all)
                                .frame(width: 300 ,height: 180)
                            Rectangle()
                                .fill(.gray1)
                                .ignoresSafeArea(.all)
                                .frame(width: 180 ,height: 300)
                            Text("Click anywhere to open Scanner")
                                .foregroundStyle(yellow4)
                                .fontWeight(.bold)
                        }.offset(y: -50)
                    }.buttonStyle(NoFadeButtonStyle())
                    Spacer()
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.yellow2)
                        .ignoresSafeArea(.all)
                        .frame(height: 30)
                    
                }
            }
            
            .sheet(isPresented: $isShowingScanner) {
                CodeScannerView(codeTypes: [.qr], simulatedData: "Some simulated data", completion: handleScan)
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
    ScanView(name: .constant("Pranchayut"), tokenAmount: .constant(0))
}
