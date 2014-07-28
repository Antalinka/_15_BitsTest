//
//  GRStudents.h
//  _15_Bits
//
//  Created by Exo-terminal on 3/27/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum{
    GRStudentsSubjectTypeBiology     = 1 << 0,
    GRStudentsSubjectTypeMath        = 1 << 1,
    GRStudentsSubjectTypeDevelopment = 1 << 2,
    GRStudentsSubjectTypeEngineering = 1 << 3,
    GRStudentsSubjectTypeArt         = 1 << 4,
    GRStudentsSubjectTypePsychology  = 1 << 5,
    GRStudentsSubjectTypeAnatomy     = 1 << 6,
    GRStudentsSubjectTypeMechanica   = 1 << 7,
}GRStudentsSubjectType;

@interface GRStudents : NSObject

@property(assign, nonatomic)GRStudentsSubjectType subjectType;



@end
