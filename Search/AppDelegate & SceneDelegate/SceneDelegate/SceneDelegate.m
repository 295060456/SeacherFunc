//
//  SceneDelegate.m
//  Search
//
//  Created by Jobs on 2020/7/31.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "SceneDelegate.h"
#import "AppDelegate.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability-new"

@interface SceneDelegate ()

@end

@implementation SceneDelegate

static SceneDelegate *static_sceneDelegate = nil;
+(SceneDelegate *)sharedInstance{
    @synchronized(self){
        if (!static_sceneDelegate) {
            static_sceneDelegate = SceneDelegate.new;
        }
    }return static_sceneDelegate;
}

-(instancetype)init{
    if (self = [super init]) {
        static_sceneDelegate = self;
    }return self;
}
//系统版本不低于iOS13.0的设备
- (void)scene:(UIScene *)scene
willConnectToSession:(UISceneSession *)session
      options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    if (@available(iOS 13.0, *)) {
        self.windowScene = (UIWindowScene *)scene;
        [self.window setRootViewController:self.navigationController];
        [self.window makeKeyAndVisible];
    }
}

- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    NSLog(@"---applicationDidBecomeActive----");//进入前台
}

- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}

- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.

    // Save changes in the application's managed object context when the application transitions to the background.
    [(AppDelegate *)UIApplication.sharedApplication.delegate saveContext];
    NSLog(@"---applicationDidEnterBackground----"); //进入后台
}
#pragma mark —— lazyLoad
-(UINavigationController *)navigationController{
    if (!_navigationController) {
        _navigationController = [[UINavigationController alloc] initWithRootViewController:ViewController.new];
        _navigationController.navigationBar.hidden = YES;
    }return _navigationController;
}

@end

#pragma clang diagnostic pop
