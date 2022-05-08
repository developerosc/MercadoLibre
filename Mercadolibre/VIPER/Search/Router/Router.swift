//
//  Router.swift
//  Mercadolibre
//
//  Created by Asesoftware on 8/05/22.
//

import Foundation
import UIKit

class MercadoLRouter: PresenterToRouterMLProtocol{
    
    
    static func createMLModule() -> ViewController {
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: "myViewController")
        as! ViewController
        
        
        let presenter: ViewToPresentMLProtocol & InteractorToPresenterMLProtocol = MercadoLPresenter()
        let interactor: PresenterToInteractorMLProtocol = MercadoLInteractor()
        let router: PresenterToRouterMLProtocol = MercadoLRouter()
        
        
        view.MercadoLPresenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        
        return view
        
        
        
    }
    
    
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
}
