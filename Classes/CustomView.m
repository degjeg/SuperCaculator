//
//  CustomView.m
//  GlossButton
//
//  Created by danger on 15/6/17.
//
//

#import "CustomView.h"
#import "common.h"

#define PI 3.1415926


@implementation CustomView

/*
   // Only override drawRect: if you perform custom drawing.
   // An empty implementation adversely affects performance during animation.
   - (void)drawRect:(CGRect)rect {
   // Drawing code
   }
 */


- (void)drawRect:(CGRect)rect {
	[self drawRoundRect1:CGRectMake(10, 20, 40, 30) corner:5];
	[self drawRoundRect2:CGRectMake(110, 120, 150, 150) corner:15];
	[self drawGradient:CGRectMake(110, 120, 150, 150) corner:15];

	CGContextRef context = UIGraphicsGetCurrentContext();

	CGRect rectOri = CGRectMake(129, 129, 80, 80);
	CGMutablePathRef path = createRoundedRectForRectCCW(rectOri,  10);
	CGContextAddPath(context, path);
	CGContextStrokePath(context);
	[self drawRoundRect1:CGRectOffset(rectOri, 10, 10) corner:10];

	drawCurvedGloss(context, CGRectMake(150, 230, 50, 50), 100);


	//    CGContextRef gc = UIGraphicsGetCurrentContext();



	//    //=== 绘画逻辑 ===
	//
	//    //创建用于转移坐标的Transform，这样我们不用按照实际显示做坐标计算
	//
	//    CGAffineTransform transform = CGAffineTransformMakeTranslation(50, 50);
	//
	//    //创建CGMutablePathRef
	//
	//    CGMutablePathRef path = CGPathCreateMutable();
	//
	//    //半径为30
	//
	//    CGFloat radius = 30;
	//
	//    //初始点为(0, 0)
	//
	//    CGPathMoveToPoint(path, &transform, 0, 0);
	//
	//    //右上角和右下角两个点，画出半个圆角
	//
	//    CGPathAddArcToPoint(path, &transform, 100, 0, 100, 100, radius);
	//
	//    //右下角和左下角两个点，画出另外半个圆角
	//
	//    CGPathAddArcToPoint(path, &transform, 100, 100, 0, 100, radius);
	//
	//    //CGPathAddArcToPoint会在交点中停止，所以需要再次调用CGPathAddLineToPoint画出下面的线
	//
	//    CGPathAddLineToPoint(path, &transform, 0, 100);
	//
	//
	//
	//    //将CGMutablePathRef添加到当前Context内
	//
	//    CGContextAddPath(gc, path);
	//
	//    [[UIColor grayColor] setFill];
	//
	//    [[UIColor blueColor] setStroke];
	//
	//    CGContextSetLineWidth(gc, 2);
	//
	//    //执行绘画
	//
	//    CGContextDrawPath(gc, kCGPathFillStroke);



	//从Context中获取图像，并显示在界面上

	//    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();

	//    UIGraphicsEndImageContext();



	//    UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
	//
	//    [self addSubview:imgView];
}

///在指定矩画一个圆角矩形，corner是圆角的大小
//使用的是CGPathAddArcToPoint的方式
- (void)drawRoundRect1:(CGRect)r corner:(float)corner {
	Rect rect;
	rect.left = r.origin.x;
	rect.top = r.origin.y;
	rect.right = r.origin.x + r.size.width;
	rect.bottom = r.origin.y + r.size.height;

	CGMutablePathRef path = CGPathCreateMutable();
	CGContextRef context  = UIGraphicsGetCurrentContext();

	CGPathMoveToPoint(path, nil, rect.left + corner, rect.top);
	CGPathAddArcToPoint(path, nil, rect.right, rect.top, rect.right, rect.bottom, corner);
	CGPathAddArcToPoint(path, nil, rect.right, rect.bottom, rect.left, rect.bottom, corner);
	CGPathAddArcToPoint(path, nil, rect.left, rect.bottom, rect.left, rect.top, corner);
	CGPathAddArcToPoint(path, nil, rect.left, rect.top, rect.right, rect.top, corner);

	CGContextAddPath(context, path);

	CGContextSaveGState(context);
	[[UIColor grayColor] setFill];
	[[UIColor blueColor] setStroke];
	CGContextSetLineWidth(context, 2);


	CGContextDrawPath(context, kCGPathFillStroke);

	CGContextRestoreGState(context);
}

/**在指定矩画一个圆角矩形，corner是圆角的大小
   使用线+圆弧的方式*/
- (void)drawRoundRect2:(CGRect)r corner:(float)corner {
	Rect rect;
	rect.left = r.origin.x;
	rect.top = r.origin.y;
	rect.right = r.origin.x + r.size.width;
	rect.bottom = r.origin.y + r.size.height;

	CGMutablePathRef path = CGPathCreateMutable();
	CGContextRef context  = UIGraphicsGetCurrentContext();

	CGPathMoveToPoint(path, nil, rect.left, rect.top + corner);
	CGPathAddArc(path, nil, rect.left + corner, rect.top + corner, corner, 180.0 * PI / 180, 270.0 * PI / 180, NO);

	CGPathAddLineToPoint(path, nil, rect.right - corner, rect.top);
	CGPathAddArc(path, nil, rect.right - corner, rect.top + corner, corner,  270 * PI / 180, 360.0 * PI / 180, NO);
	CGPathAddLineToPoint(path, nil, rect.right, rect.bottom - corner);
	CGPathAddArc(path, nil, rect.right -     corner, rect.bottom - corner, corner,  0 * PI / 180, 90.0 * PI / 180, NO);
	CGPathAddLineToPoint(path, nil,   rect.left + corner, rect.bottom);

	CGPathAddArc(path, nil, rect.left   +   corner, rect.bottom - corner,
	             corner,  90 * PI / 180, 180.0 * PI / 180, NO);
	CGPathAddLineToPoint(path, nil, rect.left, rect.top + corner);

	CGContextAddPath(context, path);

	CGContextSaveGState(context);
	[[UIColor lightGrayColor] setFill];
	[[UIColor redColor] setStroke];
	CGContextSetLineWidth(context, 1);


	CGContextDrawPath(context, kCGPathFillStroke);

	int test = 1;
	if (test) {
	}
	CGContextRestoreGState(context);
}

/**在指定矩画一个圆角矩形，corner是圆角的大小
   使用线+圆弧的方式*/
- (void)drawGradient:(CGRect)r corner:(float)corner {
	CGContextRef ctx = UIGraphicsGetCurrentContext();

	//创建一个RGB的颜色空间
	CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
	//定义渐变颜色数组
	CGFloat colors[] = {
		204.0 / 255.0, 224.0 / 255.0, 244.0 / 255.0, 1.00,
		29.0 / 255.0, 156.0 / 255.0, 215.0 / 255.0, 1.00,
		0.0 / 255.0,  50.0 / 255.0, 126.0 / 255.0, 1.00,
	};

	//创建一个渐变的色值 1:颜色空间 2:渐变的色数组 3:位置数组,如果为NULL,则为平均渐变,否则颜色和位置一一对应 4:位置的个数
	CGGradientRef _gradient = CGGradientCreateWithColorComponents(rgb, colors, NULL, sizeof(colors) / (sizeof(colors[0]) * sizeof(CGFloat)));
	CGColorSpaceRelease(rgb);

	//获得一个CGRect
	CGRect clip = CGRectInset(CGContextGetClipBoundingBox(ctx), 20.0, 20.0);
	//剪切到合适的大小
	CGContextClipToRect(ctx, clip);
	//定义起始点和终止点
	CGPoint start = CGPointMake(20, 20);
	CGPoint end = CGPointMake(20, 100);
	//绘制渐变, 颜色的0对应start点,颜色的1对应end点,第四个参数是定义渐变是否超越起始点和终止点
	CGContextDrawLinearGradient(ctx, _gradient, start, end, kCGGradientDrawsBeforeStartLocation);

	//辐射渐变
	start = CGPointMake(100, 80);//起始点
	end = CGPointMake(100, 140); //终结点
	//辐射渐变 start:起始点 20:起始点的半径 end:终止点 40: 终止点的半径 这个辐射渐变
	CGContextDrawRadialGradient(ctx, _gradient, start, 40, end, 40, 0);
}

@end
