//
//  Presenter.swift
//  Mercadolibre
//
//  Created by Asesoftware on 8/05/22.
//

import Foundation

class MercadoLPresenter:ViewToPresentMLProtocol{

    
    var view: PresenterToViewMLProtocol?
    
    var interactor: PresenterToInteractorMLProtocol?
    
    var router: PresenterToRouterMLProtocol?
    
    func startFetchingML(itemSearchV: String) {
        
        interactor?.fetchML(itemSearch: itemSearchV)
        
    }
    
    
    
}


extension MercadoLPresenter:InteractorToPresenterMLProtocol{
    func mLSuccess(dataSuccess: [DataItemsModel]) {
        view?.dataSuccessML(dataSuccessP: dataSuccess)
    }
    
    
    func mLError() {
        view?.dataErrorML()
    }
    
    
    
}
