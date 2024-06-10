import Foundation
import SwiftData

let settingList = [
    "Organization Mode",
    "Account",
    "Setting",
    "Rate Our App",
    "Help Center",
    "Log Out"
]

@Model
class User {
    
    @Attribute(.unique) var UserID: String
    var name: String
    var lname: String
    var tokenAmount: Int
    
    init(UserID: String, name: String, lname: String, tokenAmount: Int) {
        self.UserID = UserID
        self.name = name
        self.lname = lname
        self.tokenAmount = tokenAmount
    }
}

