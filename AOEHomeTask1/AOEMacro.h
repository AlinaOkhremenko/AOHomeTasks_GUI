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

#endif
