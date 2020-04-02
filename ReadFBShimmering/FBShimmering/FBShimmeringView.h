/**
 Copyright (c) 2014-present, Facebook, Inc.
 All rights reserved.
 
 This source code is licensed under the BSD-style license found in the
 LICENSE file in the root directory of this source tree. An additional grant
 of patent rights can be found in the PATENTS file in the same directory.
 */

#import <UIKit/UIView.h>

#import "FBShimmering.h"

/**
 * @abstract Lightweight, generic shimmering view.
 * 继承自UIView
 */
@interface FBShimmeringView : UIView <FBShimmering>

//! @abstract The content view to be shimmered.
/* 闪耀视图需要添加一个内容视图 子视图 */
@property (strong, nonatomic) UIView *contentView;

@end
