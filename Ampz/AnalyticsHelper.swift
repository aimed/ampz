//
//  AnalyticsHelper.swift
//  Ampz
//
//  Created by Maximilian Täschner on 7/9/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

import Foundation

let kUserDefaultsAnalyticsEnabled = "ANALYTICS_ENABLED"

@objc public class AnalyticsHelper : NSObject {
    
    override public class func initialize () {
        KKGoogleAnalytics.sharedInstance().trackingID = ""
        KKGoogleAnalytics.sharedInstance().startDispatching()
    }
    
    public static var enabled : Bool {
        get {
            return NSUserDefaults.standardUserDefaults().valueForKey(kUserDefaultsAnalyticsEnabled) as! Bool
        }
        set (val) {
            NSUserDefaults.standardUserDefaults().setBool(val, forKey: kUserDefaultsAnalyticsEnabled)
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
    public static func trigger (action : String, label : String, value : NSNumber) {
        if (!AnalyticsHelper.enabled) {
            return;
        }
        var builder = KKGADictionaryBuilder.createEventWithCategory("USAGE", action: action, label: label, value: value)
        var data = builder.build()
        KKGoogleAnalytics.sharedInstance().send(data! as [NSObject : AnyObject])
    }
}
