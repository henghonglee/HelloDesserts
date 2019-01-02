//
//  DataModel.swift
//  DonutShopApp
//
//  Created by Lee Heng Hong on 31/12/18.
//  Copyright © 2018 Heng Hong Lee. All rights reserved.
//

import Foundation
import UIKit

struct Doughnut {
  enum DoughnutTopping {
    case sprinkles
    case fudge
    case strawberryFudge
    case cinnamonSugar
  }
  var topping: DoughnutTopping?
}

struct Cake {
  enum CakeType {
    case pound
    case sponge
    case angel
    case chiffon
  }
  let type: CakeType
}

struct CookieIceCream {
  let iceCream: IceCream
  let cookie: Cookie
}

struct Cookie {
  enum Filling {
    case chocolateChips
    case marshmallow
  }
  var filling: Filling?
}

struct IceCream {
  enum Flavor {
    case vanilla
    case chocolate
    case strawberry
  }
  let flavor: Flavor
}

struct Dessert {
  enum DessertType {
    case doughnut(Doughnut)
    case cake(Cake)
    case cookie(Cookie)
    case icecream(IceCream)
    case cookieIceCream(CookieIceCream)
    case pastry
    case pudding
    case candy
  }
  let price: Double
  let calories: Double
  let type: DessertType
}

// Test Code

func printDessert(_ dessert: Dessert) {
  dessert.type.match(doughnut: { doughnut in
    print("doughnut")
    doughnut.topping?.match(sprinkles: {
      print("sprinkles")
    }, fudge: {
      print("fudge")
    }, strawberryFudge: {
      print("strawberryFudge")
    }, cinnamonSugar: {
      print("cinnamonSugar")
    })
  }, cake: { cake in
    print("cake")
    cake.type.match(pound: {
      print("pound")
    }, sponge: {
      print("sponge")
    }, angel: {
      print("angel")
    }, chiffon: {
      print("chiffon")
    })
  }, cookie: { cookie in
    print("cookie")
    cookie.filling?.match(chocolateChips: {
      print("chocolateChips")
    }, marshmallow: {
      print("marshmallow")
    })
  }, icecream: { icecream in
    print("icecream")
    icecream.flavor.match(vanilla: {
      print("vanilla")
    }, chocolate: {
      print("chocolate")
    }, strawberry: {
      print("strawberry")
    })
  }, cookieIceCream: { cookieIcecream in
    print(cookieIcecream)
  }, pastry: {
    print("pastry")
  }, pudding: {
    print("pudding")
  }, candy: {
    print("candy")
  })
  
  /*
   let cookieIceCream = CookieIceCream(iceCream: IceCream(flavor: .vanilla), cookie: Cookie(filling: .chocolateChips))
   let cookieIcecreamDessert = Dessert.init(price: 4, calories: 1500, type: .cookieIceCream(cookieIceCream))
   
   cookieIcecreamDessert.type.match(
   doughnut: { (Doughnut) in
   
   }, cake: { (Cake) in
   
   }, cookie: { (Cookie) in
   
   }, icecream: { (IceCream) in
   
   }, cookieIceCream: { (CookieIceCream) in
   
   }, pastry: {
   }, pudding: {
   }, candy: {
   })
   */
}
