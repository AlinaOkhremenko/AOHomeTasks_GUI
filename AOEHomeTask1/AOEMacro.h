//
//  AOEMacro.h
//  AOEHomeTask1
//
//  Created by Alina Okhremenko on 12.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#ifndef AOEHomeTask1_AOEMacro_h
#define AOEHomeTask1_AOEMacro_h

#define macro_concatenate(A, B) A##B

#define AOEweakify(VAR)\
id __weak macro_concatenate(weak, VAR) = VAR\

#define AOEstrongify(VAR)\
id __strong macro_concatenate(strong, VAR) = macro_concatenate(weak, VAR)

#endif
