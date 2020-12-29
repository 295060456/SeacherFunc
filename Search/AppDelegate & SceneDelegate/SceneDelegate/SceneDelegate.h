//
//  SceneDelegate.h
//  Search
//
//  Created by Jobs on 2020/7/31.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability-new"

@interface SceneDelegate : UIResponder <UIWindowSceneDelegate>

@property(nonatomic,strong)UIWindow *window;
@property(nonatomic,strong)UIWindowScene *windowScene;
@property(nonatomic,strong)UINavigationController *navigationController;

+ (SceneDelegate *)sharedInstance;

@end

#pragma clang diagnostic pop

