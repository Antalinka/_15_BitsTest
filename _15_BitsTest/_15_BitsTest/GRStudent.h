//
//  GRStudent.h
//  _15_BitsTest
//
//  Created by Exo-terminal on 3/26/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    GRStudentSubjectTypeBiology     = 1 << 0,
    GRStudentSubjectTypeMath        = 1 << 1,
    GRStudentSubjectTypeDevelopment = 1 << 2,
    GRStudentSubjectTypeEngineering = 1 << 3,
    GRStudentSubjectTypeArt         = 1 << 4,
    GRStudentSubjectTypePsychology  = 1 << 5,
    GRStudentSubjectAnatomy         = 1 << 6,
} GRStudentSubjectType;



@interface GRStudent : NSOperation

@property (assign, nonatomic)GRStudentSubjectType subjectType;


/*
@property (assign, nonatomic)BOOL studyBiology;
@property (assign, nonatomic)BOOL studyMath;
@property (assign, nonatomic)BOOL studyDevelopment;
@property (assign, nonatomic)BOOL studyEngineering;
@property (assign, nonatomic)BOOL studyArt;
@property (assign, nonatomic)BOOL studyPsychology;
@property (assign, nonatomic)BOOL studyAnatomy;*/



@end
