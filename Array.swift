//
//  Contact.swift
//  my-contact
//
//  Created by Atichet Ekchiewchan on 12/3/2567 BE.
//

import Foundation

class Owned {
    var place: String
    var discount: Int
    var type: String
    var price: Int

    init(place: String, discount: Int, type: String, price: Int) {
        self.place = place
        self.discount = discount
        self.type = type
        self.price = price
    }
}

class Used {
    var place: String
    var discount: Int
    var type: String
    var price: Int

    init(place: String, discount: Int, type: String, price: Int) {
        self.place = place
        self.discount = discount
        self.type = type
        self.price = price
    }
}

class Earned {
    var place : String
    var cooldown: Int
    var token: Int

    
    init (place: String, cooldown: Int, token: Int){
        self.place = place
        self.cooldown = cooldown
        self.token = token
    }
}

class Shop {
    var place : String
    var discount: String

    
    init (place: String, discount: String){
        self.place = place
        self.discount = discount
    }
}

class Setting {
    var header : String
    var icon: String
    var navigate: String

    
    init (header: String, icon: String, navigate: String){
        self.header = header
        self.icon = icon
        self.navigate = navigate
    }
}

class Reward {
    var header : String
    var price: Int
    var discount: Int
    var type: String

    
    init (header: String, price: Int, discount: Int, type: String){
        self.header = header
        self.price = price
        self.discount = discount
        self.type = type
    }
}

class Group {
    var name : String
    var token: Int
    var usage: Bool
    var image: String

    
    init (name: String, token: Int, usage: Bool, image: String){
        self.name = name
        self.token = token
        self.usage = usage
        self.image = image
    }
}
