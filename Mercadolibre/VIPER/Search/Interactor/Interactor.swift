//
//  Interactor.swift
//  Mercadolibre
//
//  Created by Asesoftware on 8/05/22.
//

import Foundation
import RxSwift
import Alamofire

class MercadoLInteractor:PresenterToInteractorMLProtocol{

    var presenter: InteractorToPresenterMLProtocol?
    
    var dataLocalInteractor:[DataItemsModel]?
    private var disposeBag = DisposeBag()
    
    func fetchML(itemSearch: String) {
       
        getItemsMercadoLibre(filterItem: itemSearch)
            .observe(on: MainScheduler.instance)
            .subscribe { response in
                self.dataLocalInteractor = response
            } onError: { error in
                print("ERROR: \(error.localizedDescription)")
                self.presenter?.mLError()
            } onCompleted: {
                print("response onComplete::")
                self.presenter?.mLSuccess(dataSuccess: self.dataLocalInteractor!)
            }.disposed(by: disposeBag)
        
    }
    
    func getItemsMercadoLibre(filterItem:String) -> Observable<[DataItemsModel]> {
        
        let param = filterItem.replacingOccurrences(of: " ", with: "%20")
        
        let url = "https://api.mercadolibre.com/sites/MLA/search?q=\(param)"
        
        //debugPrint("PARAMETERS: \(parameters)")
        return Observable.create { observer -> Disposable in
            AF.request(url, method: .get, interceptor: nil)
                .validate()
                    .responseJSON { response in
                        //debugPrint(response)
                        switch response.result {
                        case .success:
                            print("✅ statusCode: \(String(describing: response.response?.statusCode)) service: \(String(describing: response.request?.urlRequest)) response: \(response.description)")
                            guard let data = response.data else { return }
                            do {
                                guard let apiResultJson = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any] else{ return }
                                let apiResult = ApiResult(json: apiResultJson)
                                if(!apiResult.site_id.isEmpty){
                                    let data = try JSONDecoder().decode([DataItemsModel].self, from: JSONSerialization.data(withJSONObject: apiResult.results!))
                                    observer.onNext(data)
                                }else{
                                    let userInfo =
                                        [
                                            NSLocalizedDescriptionKey :  NSLocalizedString("Exception", value: apiResult.site_id, comment: "")
                                        ]
                                    let err = NSError(domain: "", code: response.response!.statusCode, userInfo: userInfo)
                                    observer.onError(err)
                                }
                            }catch {
                                observer.onError(error)
                            }
                        case .failure(let error):
                            observer.onError(error)
                        }
                        observer.onCompleted()
                    }
         
                return Disposables.create()
            }
        
    }
    
    
    
}
