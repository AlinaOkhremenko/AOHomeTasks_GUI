//
//  AOEMacro.h
//  AOEHomeTask1
//
//  Created by Alina Okhremenko on 12.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#ifndef AOEHomeTask1_AOEMacro_h
#define AOEHomeTask1_AOEMacro_h

#define AOEweakify(VAR) \
    __weak __typeof(VAR) __AOEWeak##VAR = VAR

#define AOEstrongify(VAR) \
    __strong __typeof(VAR) VAR = __AOEWeak##VAR



#define AOEViewControllerClass(viewControllerClass, propertyName, viewClass) \
    @interface viewControllerClass(__AOEPrivateView) \
    \
    AOEViewProperty(propertyName, viewClass) \
    \
    @end \
    \
    @implementation viewControllerClass (__AOEPrivateView) \
    \
    @dynamic propertyName; \
    \
    AOEViewGetterSynthesize(propertyName, viewClass) \
    \
    @end


#define AOEViewProperty(propertyName, class) \
    @property (nonatomic, readonly)     class    *propertyName; \


#define AOEViewGetterSynthesize(selector, viewClass) \
 - (viewClass *)selector { \
    if ([self isViewLoaded] && [self.view isKindOfClass:[viewClass class]]) { \
        return (viewClass*)self.view; \
    } \
    return nil; \
    } \


#endif
