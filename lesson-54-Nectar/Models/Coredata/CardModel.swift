//
//  CardModel.swift
//  lesson-54-Nectar
//
//  Created by JAHONGIR on 30/10/23.
//

import Foundation
import CoreData

class CardModel: NSManagedObject {
    @NSManaged var count: Int
    @NSManaged var title: String
    @NSManaged var productId: Int
    @NSManaged var desc: String
    @NSManaged var imgUrl: String
      
    @NSManaged var finalPrice: Int
    
}

