//
//  LINConversionView.h
//  conversionViewDemo
//
//  Created by 林睿强 on 2019/6/19.
//  Copyright © 2019年 Earnest Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LINConversionViewMode) {
    LINConversionViewMode_Transform,   /// <通过改变self.transform达到缩放效果
    LINConversionViewMode_Bounds       /// <通过改变self.bounds达到缩放效果
};

NS_ASSUME_NONNULL_BEGIN

@interface LINConversionView : UIView

/**
 需要添加到StickerView的内容，如:UIView, UITextView, UIImageView等
 */
@property (strong, nonatomic) UIView *contentView;



/**
 参考点(比例)，不设置默认为中心点 CGPoint(0.5, 0.5)
 范围：x: 0 --- 1
 y: 0 --- 1
 
 提示：可以超出范围，设置参考点在self外面
 */
@property (nonatomic) CGPoint originalPoint;


/**
 等比缩放 : YES
 自由缩放 : NO
 
 注意：1、仅适用于CtrlTypeTwo的缩放，默认YES.  其他CtrlType也属于等比缩放
 2、与ScaleModeTransform不兼容，待完善
 */
@property (nonatomic, getter=isScaleFit) BOOL scaleFit;


/*是否需要手势*/
@property (nonatomic, getter=isNeedPinch)  BOOL needPinch;    //捏合手势
@property (nonatomic, getter=isNeedRotate) BOOL needRotate;   //旋转手势
@property (nonatomic, getter=isNeedPan)    BOOL needPan ;     //拖动手势


@property (nonatomic) LINConversionViewMode scaleMode;

/*点位 */
@property (assign, nonatomic) CGPoint rightTop;//控制旋转，右上角
@property (assign, nonatomic) CGPoint rightBottom;//控制缩放，右下角
@property (assign, nonatomic) CGPoint leftBottom;//控制缩放，右下角

/**
 初始化StickerView
 */
- (instancetype)initWithContentView:(UIView *)contentView;

/**
 显示参考点，默认不显示
 
 注意：CtrlTypeGesture 仅支持中心点，该方法无效
 */
- (void)showOriginalPoint:(BOOL)b;

/**
 显示左上角移除按钮，默认显示
 */
- (void)showRemoveCtrl:(BOOL)b;


/**
 根据比例伸缩
 
 @param rate 比例
 */
- (void)scaleByRate:(CGFloat)rate ;
/**
 设置控制图片
 */
- (void)setTransformCtrlImage:(UIImage *)image;// CtrlTypeOne
- (void)setResizeCtrlImage:(UIImage *)resizeImage rotateCtrlImage:(UIImage *)rotateImage;//CtrlTypeTwo

- (void)configGesture;


@end

NS_ASSUME_NONNULL_END
