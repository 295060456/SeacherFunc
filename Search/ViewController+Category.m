//
//  ViewController+Category.m
//  Search
//
//  Created by Jobs on 2020/8/4.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "ViewController+Category.h"
#import <objc/runtime.h>

@implementation ViewController (Category)

@dynamic ly_name;
static char *name;

static char *BaseVC_TZImagePickerController_maxImagesCount = "setLy_name";
static char *BaseVC_TZImagePickerController_columnNumber = "ly_name";

- (void)setLy_name:(NSString *)ly_name{
    objc_setAssociatedObject(self, name, ly_name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)ly_name{
    return objc_getAssociatedObject(self, name);
}

//-(NSString *)ly_name{
//    NSString *Ly_name = objc_getAssociatedObject(self, name);
//    if (!Ly_name) {
//        Ly_name = @"123";
//        objc_setAssociatedObject(self,
//                                 name,
//                                 Ly_name,
//                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//    }return Ly_name;
//}

@end
