//
//  Protocols.swift
//  Mercadolibre
//
//  Created by Asesoftware on 8/05/22.
//

import Foundation
import UIKit

protocol ViewToPresentMLProtocol:AnyObject{
    
    var view: PresenterToViewMLProtocol? {get set}
    var interactor: PresenterToInteractorMLProtocol? {get set}
    var router: PresenterToRouterMLProtocol? {get set}
    
    func startFetchingML(itemSearchV:String)
    
}

protocol PresenterToViewMLProtocol:AnyObject{
    func dataSuccessML(dataSuccessP:[DataItemsModel])
    func dataErrorML()
}

protocol PresenterToRouterMLProtocol:AnyObject{
    
    static func createMLModule() -> ViewController
}

protocol PresenterToInteractorMLProtocol:AnyObject{
    var presenter:InteractorToPresenterMLProtocol? {get set}
    func fetchML(itemSearch:String)
}

protocol InteractorToPresenterMLProtocol:AnyObject{
    func mLSuccess(dataSuccess:[DataItemsModel])
    func mLError()
    
}
