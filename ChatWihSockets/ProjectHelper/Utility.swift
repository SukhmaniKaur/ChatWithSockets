//
//  Utility.swift
//  Shoal
//
//  Created by MACBOOK on 16/06/20.
//  Copyright © 2020 Rohit Saini. All rights reserved.
//

import Foundation
import UIKit
import SainiUtils
//import SDWebImage
import CoreLocation
import Toaster

//MARK:- Toast
func displayToast(_ message:String)
{
    let toast = Toast(text: NSLocalizedString(message, comment: ""))
    toast.show()
}

//MARK:- UICollectionView
extension UICollectionView {
   //MARK:- setEmptyMessage
   public func sainiSetEmptyMessageCV(_ message: String) {
       let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
       messageLabel.text = message
       messageLabel.textColor = .black
       messageLabel.numberOfLines = 0;
       messageLabel.textAlignment = .center;
       messageLabel.font = UIFont(name: "TrebuchetMS", size: 15)
       messageLabel.sizeToFit()
       self.backgroundView = messageLabel;
    
   }
   //MARK:- sainiRestore
   public func restore() {
       self.backgroundView = nil
       
   }
}

//MARK: - height of a label
extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstraintedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
    
    //MARK: - isValidEmail
    var isValidEmail: Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}

//MARK: - UIViewController
extension UIViewController {
    
    func scrollToTop() {
     func scrollToTop(view: UIView?) {
       guard let view = view else { return }
       switch view {
       case let scrollView as UIScrollView:
        if scrollView.scrollsToTop == true {
          scrollView.setContentOffset(CGPoint(x: 0.0, y: -scrollView.contentInset.top), animated: true)
          return
        }
       default:
        break
       }
       for subView in view.subviews {
        scrollToTop(view: subView)
       }
     }
     scrollToTop(view: view)
    }
    var isScrolledToTop: Bool {
     for subView in view.subviews {
       if let scrollView = subView as? UIScrollView {
        return (scrollView.contentOffset.y == 0)
       }
     }
     return true
    }
    
    
    
    
    static var top: UIViewController? {
        get {
            return topViewController()
        }
    }
    
    static var root: UIViewController? {
        get {
            return UIApplication.shared.windows.first?.rootViewController
        }
    }
    
    static func topViewController(from viewController: UIViewController? = UIViewController.root) -> UIViewController? {
        if let tabBarViewController = viewController as? UITabBarController {
            return topViewController(from: tabBarViewController.selectedViewController)
        } else if let navigationController = viewController as? UINavigationController {
            return topViewController(from: navigationController.visibleViewController)
        } else if let presentedViewController = viewController?.presentedViewController {
            return topViewController(from: presentedViewController)
        } else {
            return viewController
        }
    }
}

//MARK:- toJson
func toJson(_ dict:[String:Any]) -> String{
    let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: [])
    let jsonString = String(data: jsonData!, encoding: .utf8)
    return jsonString!
}

//MARK: - getCurrentTimeStampValue
func getCurrentTimeStampValue() -> String
{
    return String(format: "%0.0f", Date().timeIntervalSince1970*1000)
}

//MARK: - DataExtension
extension Data {
    var prettyPrintedJSONString: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }

        return prettyPrintedString
    }

}

//MARK:- Loader
func showLoader()
{
    AppDelegate().sharedDelegate().showLoader()
}
// MARK: - removeLoader
func removeLoader()
{
    AppDelegate().sharedDelegate().removeLoader()
}

//MARK: - CalculateGender
func CalculateGender(gender: Int) -> String{
    if gender == 1{
        return GENDER.Male.rawValue
    }
    else if gender == 2{
        return GENDER.Female.rawValue
    }
    else if gender == 3{
       return GENDER.Other.rawValue
    }
    else {
        return GENDER.Select.rawValue
    }
}

//MARK: - getZodiacString
func getZodiacString(from: Int) -> String{
    switch from {
    case 1:
        return ZODIAC_TYPE.Aries.rawValue
    case 2:
        return ZODIAC_TYPE.Taurus.rawValue
    case 3:
        return ZODIAC_TYPE.Gemini.rawValue
    case 4:
        return ZODIAC_TYPE.Cancer.rawValue
    case 5:
        return ZODIAC_TYPE.Leo.rawValue
    case 6:
        return ZODIAC_TYPE.Virgo.rawValue
    case 7:
        return ZODIAC_TYPE.Libra.rawValue
    case 8:
        return ZODIAC_TYPE.Scorpio.rawValue
    case 9:
        return ZODIAC_TYPE.Sagittarius.rawValue
    case 10:
        return ZODIAC_TYPE.Capricorn.rawValue
    case 11:
        return ZODIAC_TYPE.Aquarius.rawValue
    case 12:
        return ZODIAC_TYPE.Pisces.rawValue
    default:
        return ZODIAC_TYPE.Select.rawValue
    }
}

//MARK: - getRelationshipStatusString
func getRelationshipStatusString(type: Int) -> String{
    switch type {
    case 1:
        return RELATIONSHIP_STATUS.Single.rawValue
    case 2:
        return RELATIONSHIP_STATUS.InARelationship.rawValue
    case 3:
        return RELATIONSHIP_STATUS.Complicated.rawValue
    default:
        return ZODIAC_TYPE.Select.rawValue
    }
}

//MARK: - getMoodTypeString
func getMoodTypeString(type: Int) -> String {
    switch type {
    case 1:
        return "Drinking Buddy"
    case 2:
        return "Don’t Bother Me"
    case 3:
        return "Making Friends"
    case 4:
        return "Dancing"
    case 5:
        return "No Commitment"
    default:
        return "None"
    }
}

func getAmbienceType(type: Int) -> String {
    switch type {
    case 1:
        return "Classy"
    case 2:
        return "Relaxed"
    default:
        return "none"
    }
}

//MARK: - getDays
func getAvailableDays(day: Int) -> String {
    switch day {
    case 0:
        return "Sun"
    case 1:
        return "Mon"
    case 2:
        return "Tue"
    case 3:
        return "Wed"
    case 4:
        return "Thu"
    case 5:
        return "Fri"
    case 6:
        return "Sat"
    default:
        return "None"
    }
}

//MARK: - getPopularityImageValue
func getPopularityImageValue(type: Int) -> UIImage {
    if type <= 16 {
        return UIImage(named: "ic_popularity_level1")!
    }
    else if type <= 32 {
        return UIImage(named: "ic_popularity_level2")!
    }
    else if type <= 48 {
        return UIImage(named: "ic_popularity_level3")!
    }
    else if type <= 64 {
        return UIImage(named: "ic_popularity_level4")!
    }
    else if type <= 80 {
        return UIImage(named: "ic_popularity_level5")!
    }
    else if type <= 100 {
        return UIImage(named: "ic_popularity_level6")!
    }
    else {
        return UIImage(named: "ic_popularity_level1")!
    }
}

//MARK: - Image Compression to 10th
func compressImage(image: UIImage) -> Data {
    // Reducing file size to a 10th
    var actualHeight : CGFloat = image.size.height
    var actualWidth : CGFloat = image.size.width
    let maxHeight : CGFloat = 1920.0
    let maxWidth : CGFloat = 1080.0
    var imgRatio : CGFloat = actualWidth/actualHeight
    let maxRatio : CGFloat = maxWidth/maxHeight
    var compressionQuality : CGFloat = 0.5
    if (actualHeight > maxHeight || actualWidth > maxWidth) {
        if (imgRatio < maxRatio) {
            //adjust width according to maxHeight
            imgRatio = maxHeight / actualHeight;
            actualWidth = imgRatio * actualWidth;
            actualHeight = maxHeight;
        } else if (imgRatio > maxRatio) {
            //adjust height according to maxWidth
            imgRatio = maxWidth / actualWidth;
            actualHeight = imgRatio * actualHeight;
            actualWidth = maxWidth;
        } else {
            actualHeight = maxHeight
            actualWidth = maxWidth
            compressionQuality = 1
        }
    }
    let rect = CGRect(x: 0.0, y: 0.0, width:actualWidth, height:actualHeight)
    UIGraphicsBeginImageContext(rect.size)
    image.draw(in: rect)
    let img = UIGraphicsGetImageFromCurrentImageContext()
    let imageData = img!.jpegData(compressionQuality: compressionQuality)
    UIGraphicsEndImageContext();
    return imageData!
}

//MARK: - downloadCachedImage
//extension UIImageView{
//    func downloadCachedImage(placeholder: String,urlString: String){
//        //self.sainiShowLoader(loaderColor:  #colorLiteral(red: 0.06274509804, green: 0.1058823529, blue: 0.2235294118, alpha: 1))
//        let options: SDWebImageOptions = [.scaleDownLargeImages, .continueInBackground, .avoidAutoSetImage]
//        let placeholder = UIImage(named: placeholder)
//        self.sd_setImage(with: URL(string: urlString), placeholderImage: placeholder, options: options) { (image, _, cacheType,_ ) in
//            //self.sainiRemoveLoader()
//            guard image != nil else {
//                //self.sainiRemoveLoader()
//                return
//            }
//            guard cacheType != .memory, cacheType != .disk else {
//                self.image = image
//                //self.sainiRemoveLoader()
//                return
//            }
//            UIView.transition(with: self, duration: 0.2, options: .transitionCrossDissolve, animations: {
//                //self.sainiRemoveLoader()
//                self.image = image
//                return
//            }, completion: nil)
//        }
//    }
//}

//MARK: - setCornerRadius
func setCornerRadius(_ view : UIView, _ addRadius : Bool) {
    var newFrame = view.frame
    newFrame.size.width = SCREEN.WIDTH
    view.frame = newFrame
    
    if addRadius {
        view.sainiRoundCorners([.topLeft,.topRight], radius: 20)
    }
}

extension Date{
    //MARK:- sainiHoursFrom
    public func sainiMinFrom(_ date: Date) -> Double {
        return Double(Calendar.current.dateComponents([.minute], from: date, to: self).minute!)
    }
}

//MARK: - secondsFromGMT
func secondsFromGMT() -> Int {
    let timeZone = TimeZone.current.secondsFromGMT()
    return timeZone / 60
}

//MARK: - get place
public func getPlace(for location: CLLocation,
              completion: @escaping (CLPlacemark?) -> Void) {
    
    let geocoder = CLGeocoder()
    geocoder.reverseGeocodeLocation(location) { placemarks, error in
        
        guard error == nil else {
            print("*** Error in \(#function): \(error!.localizedDescription)")
            completion(nil)
            return
        }
        
        guard let placemark = placemarks?[0] else {
            print("*** Error in \(#function): placemark is nil")
            completion(nil)
            return
        }
        
        completion(placemark)
    }
}


extension UIWindow{
    var visibleViewController:UIViewController?{
        return UIWindow.visibleVC(vc:self.rootViewController)
    }
    static func visibleVC(vc: UIViewController?) -> UIViewController?{
        if let navigationViewController = vc as? UINavigationController{
            return UIWindow.visibleVC(vc:navigationViewController.visibleViewController)
        }
        else if let tabBarVC = vc as? UITabBarController{
           return UIWindow.visibleVC(vc:tabBarVC.selectedViewController)
        }
        else{
            if let presentedVC = vc?.presentedViewController{
                return UIWindow.visibleVC(vc:presentedVC)
            }
            else{
                return vc
            }
        }
    }
}

public func visibleViewController() -> UIViewController?{
    return UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.visibleViewController
}
